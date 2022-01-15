import '../../infra/datasources/errors/ifoodsource_error.dart';

class FoodEmptyError implements IFoodSourceError {
  @override
  ErrorType getError() {
    return ErrorType.http;
  }
}
