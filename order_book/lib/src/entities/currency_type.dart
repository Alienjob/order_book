

enum CurrencyType {
  fiat,
  crypto
}

extension CurrencyTypeExtension on CurrencyType {
  String getName() {
    switch (this) {
      case CurrencyType.fiat:
        return 'fiat';
      case CurrencyType.crypto:
        return 'crypto';
    }
  }


}
