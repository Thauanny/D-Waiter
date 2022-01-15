enum ErrorType { http }

abstract class IFoodSourceError {
  ErrorType getError();
}
