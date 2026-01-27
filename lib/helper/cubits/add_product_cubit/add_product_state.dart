class AddProductState{}
class DoneAddProductState extends AddProductState{
  final String name;
  DoneAddProductState({required this.name});
}
class InitailAddProductState extends AddProductState{ }
class LoadingAddProductState extends AddProductState{}
class AddProductErrorState extends AddProductState{
  final String errorMessage;
  AddProductErrorState({required this.errorMessage});
}