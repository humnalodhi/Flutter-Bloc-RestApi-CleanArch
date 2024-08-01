import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerState extends Equatable {
  final XFile? capturedImageFile;
  final XFile? galleryImageFile;

  const ImagePickerState({
    this.capturedImageFile,
    this.galleryImageFile,
  });

  ImagePickerState copyWith({
    XFile? capturedImageFile,
    XFile? galleryImageFile,
  }) {
    return ImagePickerState(
      capturedImageFile: capturedImageFile ?? this.capturedImageFile,
      galleryImageFile: galleryImageFile ?? this.galleryImageFile,
    );
  }

  @override
  List<Object?> get props => [
        capturedImageFile,
        galleryImageFile,
      ];
}
