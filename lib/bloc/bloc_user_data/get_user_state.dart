part of 'get_user_bloc.dart';

@immutable
abstract class UserStateState {}

class UserStateInitial extends UserStateState {}

class GettingDataInProgress extends UserStateState{}

class GettingDataInSuccess extends UserStateState{
  List user;

  GettingDataInSuccess({required this.user});
}

class GettingDataInFailury extends UserStateState{
  String errorText;

  GettingDataInFailury({required this.errorText});
}