import 'package:cocktailapp/src/core/usecases/use_case.dart';
import 'package:cocktailapp/src/domain/entities/cocktail_entity.dart';
import 'package:cocktailapp/src/domain/repositories/cocktail_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchCocktailsByIngredientUseCase
    implements UseCase<List<CocktailEntity>, String> {
  final CocktailRepository _cocktailRepository;

  SearchCocktailsByIngredientUseCase(this._cocktailRepository);

  @override
  Future<List<CocktailEntity>> call({required String params}) =>
      _cocktailRepository.searchCocktailsByIngredient(params);
}
