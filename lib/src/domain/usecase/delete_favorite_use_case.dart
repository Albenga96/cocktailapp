import 'package:cocktailapp/src/core/usecases/use_case.dart';

import 'package:cocktailapp/src/domain/repositories/cocktail_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteFavoriteUseCase implements UseCase<void, String> {
  final CocktailRepository _cocktailRepository;

  DeleteFavoriteUseCase(this._cocktailRepository);

  @override
  Future<void> call({required String params}) =>
      _cocktailRepository.deleteFavorite(params);
}
