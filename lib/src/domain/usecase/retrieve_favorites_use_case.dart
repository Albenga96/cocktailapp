import 'package:cocktailapp/src/core/usecases/use_case.dart';
import 'package:cocktailapp/src/domain/entities/cocktail_entity.dart';
import 'package:cocktailapp/src/domain/repositories/cocktail_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RetrieveFavoriteUseCase implements UseCase<List<CocktailEntity>, void> {
  final CocktailRepository _cocktailRepository;

  RetrieveFavoriteUseCase(this._cocktailRepository);

  @override
  Future<List<CocktailEntity>> call({required params}) =>
      _cocktailRepository.retrieveFavorites();
}
