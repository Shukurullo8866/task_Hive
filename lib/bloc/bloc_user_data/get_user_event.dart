part of 'get_user_bloc.dart';

@immutable
abstract class UserStateEvent {}

class GetUserFromApiEvent extends UserStateEvent{}