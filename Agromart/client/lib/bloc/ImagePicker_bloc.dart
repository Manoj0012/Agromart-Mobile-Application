import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final _image = ImagePicker();
  ImagePickerBloc() : super(ImagePickerInitial()) {
    on<ImagePickGallery>((event, emit) async {
      final image = await pickimagefromgallery();
      if (image != null) {
        return emit(ImagePickedSucessState(image: File(image.path)));
      }
      return emit(ImagePickerState());
    });
    on<ImagePickCamera>(
      (event, emit) async {
        final image = await pickimagefromcamera();
        if (image != null) {
          return emit(ImagePickedSucessState(image: File(image.path)));
        }
        return emit(ImagePickerInitial());
      },
    );
  }
  pickimagefromgallery() async {
    return await _image.pickImage(source: ImageSource.gallery);
  }

  pickimagefromcamera() async {
    return await _image.pickImage(source: ImageSource.camera);
  }
}

class ImagePickerInitial extends ImagePickerState {}

class ImagePickerState {}

class ImagePickedSucessState extends ImagePickerState {
  final File image;
  ImagePickedSucessState({required this.image});
}

class ImagePickerEvent {}

class ImagePickGallery extends ImagePickerEvent {}

class ImagePickCamera extends ImagePickerEvent {}
