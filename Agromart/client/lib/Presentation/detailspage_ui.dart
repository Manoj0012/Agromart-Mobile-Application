import 'package:another_flushbar/flushbar.dart';
import 'package:client/Presentation/ProfileCreated_ui.dart';
import 'package:client/Presentation/Utiltis/Backgroundimage.dart';
import 'package:client/Presentation/Utiltis/utilis.dart';
import 'package:client/Presentation/widgets/FieldButton.dart';
import 'package:client/Presentation/widgets/FieldTap.dart';
import 'package:client/Presentation/widgets/SetLocation.dart';
import 'package:client/bloc/Details.event.dart';
import 'package:client/bloc/Details_state.dart';
import 'package:client/bloc/Field_Event.dart';
import 'package:client/bloc/Field_bloc.dart';
import 'package:client/bloc/Details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailspageUi extends StatefulWidget {
  const DetailspageUi({super.key});

  @override
  State<DetailspageUi> createState() => _DetailspageUiState();
}

class _DetailspageUiState extends State<DetailspageUi> {
  double? latitude;
  double? longitude;
  @override
  Widget build(BuildContext context) {
    Utils utils = Utils();
    TextEditingController firstname = TextEditingController();
    TextEditingController lastname = TextEditingController();
    TextEditingController emailaddress = TextEditingController();
    TextEditingController phonenumber = TextEditingController();

    return BlocConsumer<DetailsBloc, DetailsState>(
      listener: (context, state) {
        if (state is DetailsErrorState) {
          context.read<FieldBloc>().add(FieldError_Event(
              fieldname: state.fieldname, error_msg: state.errorMsg));
        }
        if (state is DetailLocationError_State) {
          Flushbar(
            flushbarPosition: FlushbarPosition.TOP,
            message: state.errorMsg,
            duration: const Duration(seconds: 4),
            backgroundColor: Color(utils.Secoundary_color),
          ).show(context);
        }
        if(state is DetailapageErrorState){
                    Flushbar(
            flushbarPosition: FlushbarPosition.TOP,
            message: state.error,
            duration: const Duration(seconds: 4),
            backgroundColor: Color(utils.Secoundary_color),
          ).show(context);
        }
        if (state is DetailsSuccessState) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const ProfilecreatedUi()));
        }
      },
      builder: (context, state) {
        if (state is DetailLocationSucess_State) {
          latitude = state.geopostion.latitude;
          longitude = state.geopostion.longitude;
        }
        return Scaffold(
            body: BackgroundImage(
                child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(30, 100, 30, 30),
          child: Column(
            children: [
              const Text("Fill in your bio to get started",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22)),
              const SizedBox(
                height: 7,
              ),
              Text(
                "This data will be displayed in your account profile for security",
                style: TextStyle(
                    color: Color(utils.Secoundary_color), fontSize: 12),
                textAlign: TextAlign.center,
              ),
              Fieldtap(
                  label: "",
                  hint: "First Name",
                  fieldname: "firstname",
                  controller: firstname),
              Fieldtap(
                  hint: "Last Name",
                  fieldname: "lastname",
                  controller: lastname),
              Fieldtap(
                  hint: "Email address",
                  fieldname: "emailaddress",
                  controller: emailaddress),
              Fieldtap(
                  hint: "Phone number",
                  fieldname: "phonenumber",
                  controller: phonenumber),
              const SizedBox(height: 20),
              Setlocation(onPressed: () {
                context.read<DetailsBloc>().add(DetailsSetLocationEvent());
              }),
              const SizedBox(
                height: 20,
              ),
              Fieldbutton(
                  label: "Next",
                  Onpressed: () {
                    context.read<DetailsBloc>().add(Details_OnsubmitEvent(
                        firstname: firstname.text,
                        lastname: lastname.text,
                        emailaddress: emailaddress.text,
                        phonenumber: phonenumber.text,
                        latitude: latitude,
                        longitude: longitude));
                  })
            ],
          ),
        )));
      },
    );
  }
}
