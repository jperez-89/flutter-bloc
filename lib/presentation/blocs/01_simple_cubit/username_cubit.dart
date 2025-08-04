import 'package:bloc/bloc.dart';

class UsernameCubit extends Cubit<String> {
  UsernameCubit() : super('no_username');

  // Notifica a todos los widgets que están escuchando este cubit cuando el estado cambia.
  void setUsername(String username) {
    emit(username);
  }
}
