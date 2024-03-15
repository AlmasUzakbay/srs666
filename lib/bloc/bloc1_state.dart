part of 'bloc1_bloc.dart';

@immutable
abstract class Bloc1State {}

class Bloc1Initial extends Bloc1State {}

class RegistrationSuccessState extends Bloc1State {}

class RegistrationErrorState extends Bloc1State {
  final String errorMessage;

  RegistrationErrorState(this.errorMessage);
}
