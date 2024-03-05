import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> RegisterMethod(
      {required String email,
      required String password,
      required FirebaseAuth auth}) async {
    emit(RegisterLoading());
    try {
      UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailure(errMessage: 'weak password'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(errMessage: 'email already in use'));
      } else {
        emit(RegisterFailure(errMessage: 'Something went wrong'));
      }
    }
  }
}
