import 'package:bloc/bloc.dart';
import 'package:flutter_nd_registerform/rep.dart';
import 'package:meta/meta.dart';

part 'bloc1_event.dart';
part 'bloc1_state.dart';

class Bloc1Bloc extends Bloc<Bloc1Event, Bloc1State> {
  final UserRepository userRepository = UserRepository();

  Bloc1Bloc() : super(Bloc1Initial()) {
    on<RegisterUserEvent>(_handleRegisterUserEvent);
  }

  void _handleRegisterUserEvent(
      RegisterUserEvent event, Emitter<Bloc1State> emit) async {
    try {
      final success = await userRepository.registerUser(event.userData);

      if (success) {
        emit(RegistrationSuccessState());
      } else {
        emit(RegistrationErrorState('Ошибка регистрации'));
      }
    } catch (e) {
      emit(RegistrationErrorState('Произошла ошибка: $e'));
    }
  }
}
