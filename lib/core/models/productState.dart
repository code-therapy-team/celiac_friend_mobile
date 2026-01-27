class ProductState{
  String? productName;
  String productSafetyStatus;
  int contributionCount;
  String? imageURL;

  ProductState({required this.contributionCount,required this.productSafetyStatus,required this.imageURL,
  required this.productName
  });
  factory ProductState.fromJson(Map<String,dynamic> json ){
    return ProductState(
      contributionCount:json['contributionCount'] , 
      productSafetyStatus:json ['productSafetyStatus'], 
      imageURL:json['imageURL'] , 
      productName:json ['productName']);

  }
}