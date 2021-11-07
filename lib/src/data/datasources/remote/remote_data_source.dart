import 'package:cocktailapp/src/data/models/cocktail_details_response.dart';
import 'package:cocktailapp/src/data/models/cocktail_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'remote_data_source.g.dart';

@injectable
@LazySingleton()
@RestApi(baseUrl: "https://www.thecocktaildb.com/api/json/v1/1")
abstract class RemoteDataSource {
  @factoryMethod
  factory RemoteDataSource(Dio dio) = _RemoteDataSource;

  @GET("/filter.php")
  Future<CocktailResponse> getAlcoholicCocktails(
    @Query("a") String alcoholic,
  );

  @GET("/filter.php")
  Future<CocktailResponse> getCategoryCocktails(
    @Query("c") String category,
  );

  @GET("/lookup.php")
  Future<CocktailDetailsResponse> getCocktailDetails(
    @Query("i") String drinkId,
  );
}
