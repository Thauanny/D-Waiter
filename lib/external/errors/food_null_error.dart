import '../../infra/datasources/errors/ifoodsource_error.dart';

class FoodNullError implements IFoodSourceError {
  @override
  ErrorType getError() {
    return ErrorType.http;
  }
}
