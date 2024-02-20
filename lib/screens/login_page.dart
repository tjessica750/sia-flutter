// ignore: file_names
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_driven_app/auth/authentication_cubit.dart';
import 'package:test_driven_app/components/alert.dart';
import 'package:test_driven_app/components/loader_overlay.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: SizedBox(
          width: 600,
          height: 600,
          child: Center(
            child: LoginForm(),
          )),
    ));
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginForm createState() => _LoginForm();
}

class _LoginForm extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _errorMessage;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
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
                SizedBox(
                  height: 150.0,
                  width: 150.0, // Altura de la imagen
                  child: Image.asset("assets/images/logo-sia.png"),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'Sistema de identificacion  de automotores avaluo comercial',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Correo",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingresa tu correo electrónico';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Contraseña",
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
                      if (_formKey.currentState!.validate()) {
                        LoaderOverlay.show(context);
                        try {
                          await context.read<AuthenticationCubit>().signIn(
                              _emailController.text, _passwordController.text);
                        } catch (e) {
                          setState(() {
                            _errorMessage = e.toString();
                          });
                        }
                        LoaderOverlay.hide();
                      }
                    },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                        minimumSize: MaterialStateProperty.all(
                            const Size(double.infinity, 60))),
                    child: const Text('Iniciar sesión',
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
