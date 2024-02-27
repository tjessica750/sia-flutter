/* import 'dart:convert'; */
import 'package:amplify_flutter/amplify_flutter.dart';
/* import 'package:crypto/crypto.dart'; */

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum AuthenticationStatus {
  authenticated,
  unauthenticated,
  unknown,
  confirmSignInWithNewPassword
}

class AuthenticationCubit extends Cubit<AuthenticationStatus> {
  AuthenticationCubit() : super(AuthenticationStatus.unknown);

  void checkAuthStatus() async {
    try {
      AuthUser response = await Amplify.Auth.getCurrentUser();

      safePrint(response);

      emit(AuthenticationStatus.authenticated);
    } catch (e) {
      emit(AuthenticationStatus.unauthenticated);
    }
  }

  Future<void> signOut() async {
    await Amplify.Auth.signOut();
    emit(AuthenticationStatus.unauthenticated);
  }

  Future<void> signIn(String username, String password) async {
    try {
      /*  final secretHash = _calculateSecretHash(
        username: username,
        userPoolClientId: 'us-east-2_hUzRnEJE6',
        clientSecret: '1g8sa3o9kg9lpbiorl8ia46ffisiu5ia8m0fn595u873ukk7nakq',
      ); */

      final result = await Amplify.Auth.signIn(
        username: username,
        password: password,
      );

      safePrint(result);

      if (result.isSignedIn) {
        return emit(AuthenticationStatus.authenticated);
      }

      if (result.nextStep.signInStep ==
          AuthSignInStep.confirmSignInWithNewPassword) {
        return emit(AuthenticationStatus.confirmSignInWithNewPassword);
      }
    } on UserNotFoundException {
      throw Exception("usuario no encontrado");
    } on NotAuthorizedServiceException {
      throw Exception("usuario o contraseña incorrectas");
    } catch (e) {
      throw Exception(
          "no se pudo realizar el inicio se sesion comuniquese con el equipo de soporte");
    }
  }

  Future<void> confirmSignInWithNewPassword(String newPassword) async {
    try {
      final result =
          await Amplify.Auth.confirmSignIn(confirmationValue: newPassword);

      if (result.isSignedIn) {
        return emit(AuthenticationStatus.authenticated);
      }
    } on InvalidPasswordException {
      throw Exception("contraseña no cumple con las politicas requeridas");
    } catch (e) {
      throw Exception(
          "no se pudo realizar el inicio se sesion comuniquese con el equipo de soporte");
    }
  }

/* 
  String _calculateSecretHash({
    required String username,
    required String userPoolClientId,
    required String clientSecret,
  }) {
    final hmac = Hmac(sha256, utf8.encode(clientSecret));
    final digest = hmac.convert(utf8.encode(username + userPoolClientId));
    return base64.encode(digest.bytes);
  } */
}
