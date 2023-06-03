import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/response_data/response.dart';
import '../../data/services/api_servise.dart';

part 'get_user_event.dart';
part 'get_user_state.dart';

class GetUserBloc extends Bloc<UserStateEvent, UserStateState> {
  GetUserBloc() : super(UserStateInitial()) {
    on<GetUserFromApiEvent>(getData);
  }

  getData(event, emit) async {
    emit(GettingDataInProgress());
    MyResponse myResponse = await ApiService().getAllUser();
    if(myResponse.error==""){
      emit(GettingDataInSuccess(user: myResponse.data));
    }else{
      emit(GettingDataInFailury(errorText: myResponse.error));
    }
  }
}