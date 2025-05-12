import 'package:client/Models/CropModels.dart';
import 'package:client/Repo/ProductRepo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatergoryBloc extends Bloc<CatergoryEvent, CatergoryState> {
  CatergoryBloc() : super(CatergorySucessState(data:[])) {
    on<CatergorySwitchEvent>((event, emit) async {
      final int indx = event.key;
      List<CropProduct> postdata = [];
      emit(CatergoryLoadingState());
      switch (indx) {
        case 0:
          postdata = await Productrepo.alldata();
          break;
        case 1:
          postdata = await Productrepo.getdata("Grain");
          break;
        case 2:
          postdata = await Productrepo.getdata("Vegetable");
          break;
        case 3:
          postdata = await Productrepo.getdata("Dairy");
          break;
        case 4:
          postdata = await Productrepo.getdata("Fruit");
          break;
        default:
          return emit(CatergoryErrorState());
      }
      await Future.delayed(const Duration(seconds: 2));
      if (postdata.isEmpty) {
        return emit(CatergoryNoDataState());
      }
      return emit(CatergorySucessState(data: postdata));
    });
  }
}

class CatergoryState {}

class CatergoryLoadingState extends CatergoryState {}

class CatergorySucessState extends CatergoryState {
  final List<CropProduct> data;
  CatergorySucessState({required this.data});
}

class CatergoryNoDataState extends CatergoryState {}

class CatergoryErrorState extends CatergoryState {}

class CatergoryEvent {}

class CatergorySwitchEvent extends CatergoryEvent {
  final int key;
  CatergorySwitchEvent({required this.key});
}
