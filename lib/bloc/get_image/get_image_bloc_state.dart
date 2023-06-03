part of 'get_image_bloc.dart';

@immutable
abstract class MultiStateState {}

class MultiStateInitial extends MultiStateState {}

class GettingDataInProgress extends MultiStateState{}

class GettingDataInSuccess extends MultiStateState{
  List image;

  GettingDataInSuccess({required this.image});
}

class GettingDataInFailury extends MultiStateState{
  String errorText;

  GettingDataInFailury({required this.errorText});
}