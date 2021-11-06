import 'package:cocktailapp/src/data/models/cocktail.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'remote_data_source.g.dart';

@LazySingleton()
@RestApi(baseUrl: "https://www.thecocktaildb.com/api/json/v1/1")
abstract class RemoteDataSource {
  @factoryMethod
  factory RemoteDataSource(Dio dio, {String baseUrl}) = _RemoteDataSource;

  @GET("/filter.php")
  Future<List<Cocktail>> getAlcoholicCocktails(
    @Query("a") String alcoholic,
  );

  @GET("/filter.php")
  Future<List<Cocktail>> getCategoryCocktails(
    @Query("c") String category,
  );
}
