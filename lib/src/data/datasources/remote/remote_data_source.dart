import 'package:cocktailapp/src/data/models/cocktail.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

@RestApi(baseUrl: "https://www.thecocktaildb.com/api/json/v1/1")
abstract class RemoteDataSource {
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
