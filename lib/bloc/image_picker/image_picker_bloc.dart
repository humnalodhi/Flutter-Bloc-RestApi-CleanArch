import 'package:bloc/bloc.dart';
import 'package:bloc_rest_api_clean_arch/bloc/image_picker/image_picker_event.dart';
import 'package:bloc_rest_api_clean_arch/utils/image_picker_utils.dart';
import 'package:image_picker/image_picker.dart';

import 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerState()) {
    on<CameraCapture>(_cameraCapture);
    on<GalleryImagePicker>(_galleryImagePicker);
  }

  Future<void> _cameraCapture(
      CameraCapture event, Emitter<ImagePickerState> emit) async {
    XFile? capturedImageFile = await imagePickerUtils.cameraCapture();
    emit(
      state.copyWith(
        capturedImageFile: capturedImageFile,
      ),
    );
  }

  Future<void> _galleryImagePicker(
      GalleryImagePicker event, Emitter<ImagePickerState> emit) async {
    XFile? galleryImageFile = await imagePickerUtils.pickImageFromGallery();
    emit(
      state.copyWith(
        galleryImageFile: galleryImageFile,
      ),
    );
  }
}
