import 'package:client/Presentation/Homepage_ui.dart';
import 'package:client/Presentation/Utiltis/Backgroundimage.dart';
import 'package:client/Presentation/widgets/FieldButton.dart';
import 'package:client/bloc/Details.event.dart';
import 'package:client/bloc/Details_bloc.dart';
import 'package:client/bloc/Details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class ProfilecreatedUi extends StatefulWidget {
  const ProfilecreatedUi({super.key});
  @override
  State<ProfilecreatedUi> createState() => _ProfilecreatedUiState();
}

class _ProfilecreatedUiState extends State<ProfilecreatedUi>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DetailsBloc, DetailsState>(
      listener: (context, state) {
        if (state is DetailsHomeNavigateState) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomepageUi(userdata: null,),
              ));
        }
      },
      child: Scaffold(
          body: BackgroundImage(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset('assets/congratsgif.json', controller: _controller,
              onLoaded: (animation) {
            _controller.duration = animation.duration;
            _controller.forward(from: 0);
          }),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 60, 30, 0),
            child: Fieldbutton(
                label: "Next",
                Onpressed: () {
                  context.read<DetailsBloc>().add(DetailsNavigateHomeEvent());
                }),
          )
        ],
      ))),
    );
  }
}
