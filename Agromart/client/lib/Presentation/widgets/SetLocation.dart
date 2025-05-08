// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/Presentation/Utiltis/utilis.dart';
import 'package:client/Presentation/widgets/LocationButton.dart';
import 'package:client/bloc/Details_bloc.dart';
import 'package:client/bloc/Details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Setlocation extends StatelessWidget {
  final VoidCallback onPressed;
  const Setlocation({
    super.key,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    Utils utils = Utils();
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.location_on_rounded,
                    size: 30, color: Color(utils.location_color)),
                BlocBuilder<DetailsBloc, DetailsState>(
                  builder: (context, state) {
                    if(state is DetailLocationSucess_State ){
                       return  Text(state.geopostion.address,
                      style:
                           TextStyle(fontSize:18, fontWeight: FontWeight.normal,color:Color(utils.error_color)),
                    );
                    }
                    return const Text(
                      "Your Location",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    );
                  },
                )
              ]),
          Locationbutton(label: "Set Location", Onpressed: onPressed)
        ],
      ),
    );
  }
}
