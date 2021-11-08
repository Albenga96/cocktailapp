import 'package:cocktailapp/src/core/usecases/use_case.dart';
import 'package:cocktailapp/src/domain/entities/cocktail_entity.dart';
import 'package:cocktailapp/src/domain/repositories/cocktail_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class InsertFavoriteUseCase implements UseCase<void, CocktailEntity> {
  final CocktailRepository _cocktailRepository;

  InsertFavoriteUseCase(this._cocktailRepository);

  @override
  Future<void> call({required CocktailEntity params}) =>
      _cocktailRepository.insertFavorite(params);
}
