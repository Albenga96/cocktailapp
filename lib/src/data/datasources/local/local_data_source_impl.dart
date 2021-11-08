import 'package:cocktailapp/src/data/datasources/local/local_data_source.dart';
import 'package:cocktailapp/src/domain/entities/cocktail_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

@LazySingleton(as: LocalDataSource)
class LocalDataSourceImpl implements LocalDataSource {
  Future<Database> get _database async {
    return openDatabase(
      join(
        await getDatabasesPath(),
        "cocktail_database",
      ),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE favorites(drinkId TEXT PRIMARY KEY, drinkName TEXT, drinkThumbnail TEXT)',
        );
      },
      version: 2,
    );
  }

  @override
  Future<void> insertFavorite(CocktailEntity cocktailEntity) async {
    final db = await _database;
    await db.insert(
      "favorites",
      cocktailEntity.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<CocktailEntity>> retrieveFavorites() async {
    final db = await _database;
    final List<Map<String, dynamic>> maps = await db.query("favorites");
    return List.generate(
      maps.length,
      (index) => CocktailEntity(
        drinkName: maps[index]["drinkName"],
        drinkThumbnail: maps[index]["drinkThumbnail"],
        drinkId: maps[index]["drinkId"],
      ),
    );
  }

  @override
  Future<void> deleteFavorite(String drinkId) async {
    final db = await _database;
    await db.delete(
      "favorites",
      where: 'drinkId = ?',
      whereArgs: [drinkId],
    );
  }

  @override
  Future<CocktailEntity?> findFavoriteById(String drinkId) async {
    final db = await _database;
    final List<Map<String, dynamic>> maps = await db.query(
      "favorites",
      where: 'drinkId = ?',
      whereArgs: [drinkId],
      limit: 1,
    );
    if (maps.isNotEmpty) {
      return CocktailEntity(
        drinkName: maps[0]["drinkName"],
        drinkThumbnail: maps[0]["drinkThumbnail"],
        drinkId: maps[0]["drinkId"],
      );
    } else
      return null;
  }
}
