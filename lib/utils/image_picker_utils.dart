import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {
  final ImagePicker imagePicker = ImagePicker();

  Future<XFile?> cameraCapture() async {
    final XFile? capturedImageFile = await imagePicker.pickImage(
      source: ImageSource.camera,
    );
    return capturedImageFile;
  }

  Future<XFile?> pickImageFromGallery() async {
    final XFile? file = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    return file;
  }
}
