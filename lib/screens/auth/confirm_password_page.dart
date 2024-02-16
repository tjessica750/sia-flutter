// ignore: file_names
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_driven_app/auth/authentication_cubit.dart';
import 'package:test_driven_app/components/alert.dart';
import 'package:test_driven_app/components/loader_overlay.dart';

class ConfirmPasswordPage extends StatelessWidget {
  const ConfirmPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Card(
        elevation: 0,
        color: Theme.of(context).colorScheme.surfaceVariant,
        child: const SizedBox(
            width: 600,
            height: 600,
            child: Center(
              child: ConfimPasswordForm(),
            )),
      )),
    );
  }
}

class ConfimPasswordForm extends StatefulWidget {
  const ConfimPasswordForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ConfimPasswordFormState createState() => _ConfimPasswordFormState();
}

class _ConfimPasswordFormState extends State<ConfimPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                if (MediaQuery.of(context).size.width > 600)
                  SizedBox(
                    height: 150.0,
                    width: 150.0, // Altura de la imagen
                    child: Image.asset("assets/images/logo-sia.png"),
                  ),
                if (MediaQuery.of(context).size.width > 600)
                  const SizedBox(height: 16.0),
                const Text(
                  'Cambiar Contraseña',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'se necesita que cree una nueva contraseña para iniciar sesion',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nueva contraseña",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingresa tu contraseña';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Confirma nueva contraseña",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingresa tu contraseña';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                if (_errorMessage != null) Alert(message: _errorMessage!),
                ElevatedButton(
                    onPressed: () async {
                      safePrint("iniciando sesion");
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }

                      if (_passwordController.text.trim() !=
                          _confirmPasswordController.text.trim()) {
                        safePrint("contrasenas icorrectas");
                        return setState(() {
                          _errorMessage = "contraseñas deben ser iguales";
                        });
                      }

                      LoaderOverlay.show(context);
                      try {
                        await context
                            .read<AuthenticationCubit>()
                            .confirmSignInWithNewPassword(
                                _passwordController.text.trim());
                      } catch (e) {
                        setState(() {
                          _errorMessage = e.toString();
                        });
                      }
                      LoaderOverlay.hide();
                    },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                        minimumSize: MaterialStateProperty.all(
                            const Size(double.infinity, 60))),
                    child: const Text('Confirmar cambio de contraseña',
                        style: TextStyle(
                          fontSize: 18.0, // Tamaño del texto del botón
                        ))),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
