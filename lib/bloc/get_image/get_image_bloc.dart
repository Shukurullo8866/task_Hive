import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/response_data/response.dart';
import '../../data/services/api_servise.dart';

part 'get_image_bloc_event.dart';
part 'get_image_bloc_state.dart';

class GetImageBloc extends Bloc<MultiStateEvent, MultiStateState> {
  GetImageBloc() : super(MultiStateInitial()) {
    on<GetDataFromApiEvent>(getData);
  }

  getData(event, emit) async {
    emit(GettingDataInProgress());
    MyResponse myResponse = await ApiService().getAllImage();
    if(myResponse.error==""){
      emit(GettingDataInSuccess(image: myResponse.data));
    }else{
      emit(GettingDataInFailury(errorText: myResponse.error));
    }
  }
}