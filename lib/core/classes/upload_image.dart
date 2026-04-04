import 'package:image_picker/image_picker.dart';
class UploadImage{
   // File? fileimage;
  late XFile? image;
   final ImagePicker picker = ImagePicker();
  Future<XFile?> pickImageGallery() async {
    return image = await picker.pickImage(source: ImageSource.gallery);
    
  }
   Future<XFile?> pickImageCamira() async {
    return image = await picker.pickImage(source: ImageSource.camera);
    
  }

}