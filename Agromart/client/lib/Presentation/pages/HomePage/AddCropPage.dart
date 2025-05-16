import 'dart:io';
import 'package:another_flushbar/flushbar.dart';
import 'package:client/Presentation/Utiltis/utilis.dart';
import 'package:client/Presentation/pages/HomePage/Wigets/ImageContainer.dart';
import 'package:client/Presentation/widgets/DescribeFieldTap.dart';
import 'package:client/Presentation/widgets/FieldButton.dart';
import 'package:client/Presentation/widgets/FieldTap.dart';
import 'package:client/bloc/Additems_bloc.dart';
import 'package:client/bloc/Field_Event.dart';
import 'package:client/bloc/Field_bloc.dart';
import 'package:client/bloc/ImagePicker_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Addcroppage extends StatelessWidget {
  Addcroppage({super.key});
  final TextEditingController cropname = TextEditingController();
  final TextEditingController croptype = TextEditingController();
  final TextEditingController avalibilty = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils();
    File? image;
    return BlocConsumer<AdditemsBloc, AdditemsState>(
      listener: (context, state) {
        if (state is AddedItemErrorState) {
          context.read<FieldBloc>().add(FieldError_Event(
              fieldname: state.fieldname, error_msg: state.error));
        }
        if (state is AddedItemErrorState) {
          Flushbar(
            flushbarPosition: FlushbarPosition.TOP,
            message: "Crop Failed to add",
            duration: const Duration(seconds: 4),
            backgroundColor: Color(utils.error_color),
          ).show(context);
        }
        if (state is ItemAddedState) {
          Flushbar(
            flushbarPosition: FlushbarPosition.TOP,
            message: "Crop added Successfully",
            duration: const Duration(seconds: 4),
            backgroundColor: Color(utils.Primary_color),
          ).show(context);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      BlocBuilder<ImagePickerBloc, ImagePickerState>(
                        builder: (context, state) {
                          if (state is ImagePickedSucessState) {
                            image = state.image;
                            return Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey.shade400, width: 2),
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.grey[200],
                              ),
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: 140,
                              child: Image.file(
                                state.image,
                                fit: BoxFit.fill,
                              ),
                            );
                          }
                          return const Imagecontainer(fieldname: 'image');
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 140,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                context
                                    .read<ImagePickerBloc>()
                                    .add(ImagePickGallery());
                              },
                              icon: const Icon(Icons.file_upload_outlined),
                              iconSize: 50,
                              color: Color(utils.Primary_color),
                            ),
                            const Text("Upload Image")
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Fieldtap(
                    hint: "Crop Name",
                    fieldname: "cropname",
                    controller: cropname),
                Fieldtap(
                    hint: "Crop Type",
                    fieldname: "croptype",
                    controller: croptype),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.44,
                        child: Fieldtap(
                            hint: "Avaliable in kg",
                            fieldname: "cropavability",
                            controller: avalibilty)),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.44,
                      child: Fieldtap(
                          hint: "Price per Kg",
                          fieldname: "cropprice",
                          controller: price),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Describefieldtap(
                    hint: "Description",
                    fieldname: "cropdescription",
                    controller: description),
                const SizedBox(
                  height: 20,
                ),
                Fieldbutton(
                    label: "Publish Crop",
                    Onpressed: () {
                      context.read<AdditemsBloc>().add(CropSubmitEvent(
                          cropname: cropname.text,
                          croptype: croptype.text,
                          avaliablity: avalibilty.text,
                          price: price.text,
                          description: description.text,
                          image: image));
                    })
              ],
            ),
          ),
        );
      },
    );
  }
}
