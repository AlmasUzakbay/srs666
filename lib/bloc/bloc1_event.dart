part of 'bloc1_bloc.dart';

@immutable
abstract class Bloc1Event {}

class RegisterUserEvent extends Bloc1Event {
  final Map<String, dynamic> userData;

  RegisterUserEvent(this.userData);
}
