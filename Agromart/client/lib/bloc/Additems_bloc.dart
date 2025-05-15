import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

class AdditemsBloc extends Bloc<AdditemsEvent, AdditemsState> {
  AdditemsBloc() : super(AdditemsInitial()) {
    on<CropSubmitEvent>((event, emit) async {
      final String cropname = event.cropname;
      final String croptype = event.croptype;
      final String avaliablity = event.avaliablity;
      final String price = event.price;
      final String description = event.description;
      final File? image = event.image;
      getValidate(
          cropname, croptype, avaliablity, price, description, image, emit);
    });
  }

  getValidate(
      String cropname,
      String croptype,
      String avaliablity,
      String price,
      String description,
      File? image,
      Emitter<AdditemsState> emit) {
    if (cropname.isEmpty) {
      return emit(AddedItemErrorState(
          error: "Cropname Required", fieldname: 'cropname'));
    } else if (croptype.isEmpty) {
      return emit(AddedItemErrorState(
          error: "CropnType Required", fieldname: 'croptype'));
    } else if (avaliablity.isEmpty) {
      return emit(AddedItemErrorState(
          error: "Availablity Required", fieldname: 'cropavability'));
    } else if (price.isEmpty) {
      return emit(
          AddedItemErrorState(error: "Price per Kg", fieldname: 'cropprice'));
    } else if (description.isEmpty) {
      return emit(AddedItemErrorState(
          error: "Description Required", fieldname: 'cropdescription'));
    } else if (image == null) {
      return emit(
          AddedItemErrorState(error: "Image Required", fieldname: 'image'));
    }
    return emit(ItemAddedState());
  }
}

class AdditemsEvent {}

class AdditemsState {}

class AdditemsInitial extends AdditemsState {}

class CropSubmitEvent extends AdditemsEvent {
  final String cropname;
  final String croptype;
  final String avaliablity;
  final String price;
  final String description;
  final File? image;

  CropSubmitEvent(
      {required this.cropname,
      required this.croptype,
      required this.avaliablity,
      required this.price,
      required this.description,
      required this.image});
}

class AddedItemErrorState extends AdditemsState {
  final String error;
  final String fieldname;
  AddedItemErrorState({required this.error, required this.fieldname});
}

class ItemAddedState extends AdditemsState {}

class ItemFailedState extends AdditemsBloc {}
