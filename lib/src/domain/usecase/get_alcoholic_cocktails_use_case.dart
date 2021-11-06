import 'package:cocktailapp/src/core/usecases/use_case.dart';
import 'package:cocktailapp/src/domain/repositories/cocktail_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAlcoholicCocktailsUseCase implements UseCase<void, String> {
  final CocktailRepository _cocktailRepository;

  GetAlcoholicCocktailsUseCase(this._cocktailRepository);

  @override
  Future<void> call({required String params}) =>
      _cocktailRepository.getAlcoholicCocktails(params);
}
