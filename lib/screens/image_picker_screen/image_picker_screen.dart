import 'dart:io';
import 'package:bloc_rest_api_clean_arch/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_rest_api_clean_arch/bloc/image_picker/image_picker_event.dart';
import 'package:bloc_rest_api_clean_arch/bloc/image_picker/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
                builder: (context, state) {
                  if (state.capturedImageFile == null) {
                    return InkWell(
                      onTap: () {
                        context.read<ImagePickerBloc>().add(
                              CameraCapture(),
                            );
                      },
                      child: const CircleAvatar(
                        child: Icon(
                          Icons.camera,
                        ),
                      ),
                    );
                  } else {
                    return Image.file(
                      width: 250,
                      fit: BoxFit.cover,
                      File(
                        state.capturedImageFile!.path.toString(),
                      ),
                    );
                  }
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
                builder: (context, state) {
                  if (state.galleryImageFile == null) {
                    return InkWell(
                      onTap: () {
                        context.read<ImagePickerBloc>().add(
                              GalleryImagePicker(),
                            );
                      },
                      child: const CircleAvatar(
                        child: Icon(
                          Icons.grid_view_rounded,
                        ),
                      ),
                    );
                  } else {
                    return Image.file(
                      width: 250,
                      fit: BoxFit.cover,
                      File(
                        state.galleryImageFile!.path.toString(),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
