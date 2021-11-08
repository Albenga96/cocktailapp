import 'package:cocktailapp/src/core/usecases/use_case.dart';
import 'package:cocktailapp/src/domain/entities/cocktail_entity.dart';
import 'package:cocktailapp/src/domain/repositories/cocktail_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class FindFavoriteUseCase implements UseCase<bool, String> {
  final CocktailRepository _cocktailRepository;

  FindFavoriteUseCase(this._cocktailRepository);

  @override
  Future<bool> call({required String params}) async {
    final CocktailEntity? foundCocktail =
        await _cocktailRepository.findFavoriteById(params);
    return foundCocktail != null ? true : false;
  }
}
