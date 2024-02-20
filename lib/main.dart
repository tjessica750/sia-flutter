import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_driven_app/auth/authentication_cubit.dart';
import 'package:test_driven_app/screens/auth/confirm_password_page.dart';
import 'screens/login_page.dart';
import 'screens/home_page.dart';
import 'amplifyconfiguration.dart';

Future<void> configureAmplify() async {
  try {
    final auth = AmplifyAuthCognito();
    await Amplify.addPlugin(auth);

    await Amplify.configure(amplifyconfig);
  } on Exception catch (e) {
    safePrint('An error occurred configuring Amplify: $e');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureAmplify();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthenticationCubit authenticationCubit = AuthenticationCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Sia de colombia',
        home: BlocProvider(
          create: (context) => authenticationCubit..checkAuthStatus(),
          child: const AuthenticationWrapper(),
        ),
        theme: ThemeData(
            fontFamily: "Abel",
            useMaterial3: true,
            textTheme: const TextTheme(
                bodyLarge: TextStyle(fontSize: 20.0),
                displayLarge: TextStyle(fontSize: 20.0),
                bodyMedium: TextStyle(fontSize: 18.0),
                bodySmall: TextStyle(fontSize: 16.0),
                labelSmall: TextStyle(fontSize: 20.0),
                labelMedium: TextStyle(fontSize: 20.0),
                titleLarge: TextStyle(fontSize: 20.0),
                titleMedium: TextStyle(fontSize: 18.0)),
            drawerTheme: const DrawerThemeData(
                backgroundColor: Color.fromRGBO(255, 255, 255, 1)),
            colorScheme: ColorScheme.fromSeed(
                seedColor: Color(int.parse('0xFFE0E0F9')))));
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationStatus>(
      builder: (context, state) {
        switch (state) {
          case AuthenticationStatus.authenticated:
            return const HomePage();
          case AuthenticationStatus.unauthenticated:
            return const LoginPage();
          case AuthenticationStatus.confirmSignInWithNewPassword:
            return const ConfirmPasswordPage();
          default:
            break;
        }

        return Container(
          color: Colors.white.withOpacity(0.5),
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
