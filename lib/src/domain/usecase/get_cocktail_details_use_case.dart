import 'package:cocktailapp/src/core/usecases/use_case.dart';
import 'package:cocktailapp/src/domain/entities/cocktail_details_entity.dart';
import 'package:cocktailapp/src/domain/repositories/cocktail_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCocktailDetailsUseCase
    implements UseCase<CocktailDetailsEntity, String> {
  final CocktailRepository _cocktailRepository;

  GetCocktailDetailsUseCase(this._cocktailRepository);

  @override
  Future<CocktailDetailsEntity> call({required String params}) =>
      _cocktailRepository.getCocktailDetails(params);
}
