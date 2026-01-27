class EndPoint {
  static const String baseUrl = "http://152.53.32.75:8000/api/";
  static const String product = "product";
  static const String signIn = "auth/authenticate";
  static const String productByBarcode = "$product/barcode/";
  static const String searchByName="$product?searchTerm=";
  static const String reasonsLookup="lookup/contribution-reasons";
  static const String vote="contribute";
}
