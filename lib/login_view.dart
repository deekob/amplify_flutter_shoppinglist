import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:smart_shopper/confirmlogin_view.dart';
import 'package:smart_shopper/shoppinglistitem_bloc.dart';
import 'package:smart_shopper/shoppinglistitems_view.dart';

class LoginView extends StatefulWidget {
  static const routeName = '/auth';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginView> {
  LoginData _data;
  bool _isSignedIn = false;

  Future<String> _onLogin(LoginData data) async {
    try {
      final res = await Amplify.Auth.signIn(
        username: data.name,
        password: data.password,
      );
      _isSignedIn = res.isSignedIn;
    } catch (e) {
      for (final err in e.exceptionList) {
        if (err.exception == 'NOT_AUTHORIZED') {
          return err.detail;
        }

        if (err.exception == 'INVALID_STATE') {
          if (err.detail.contains('already a user which is signed in')) {
            await Amplify.Auth.signOut();
            return 'Problem logging in. Please try again.';
          }

          return err.detail;
        }
      }

      return 'There was a problem signing up. Please try again.';
    }
  }

  Future<String> _onSignup(LoginData data) async {
    try {
      await Amplify.Auth.signUp(
        username: data.name,
        password: data.password,
        options: CognitoSignUpOptions(userAttributes: {
          'email': data.name,
        }),
      );

      _data = data;
    } catch (e) {
      for (final err in e.exceptionList) {
        if (err.exception == 'USERNAME_EXISTS') {
          return err.detail;
        }
      }

      return 'There was a problem signing up. Please try again.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Welcome',
      onLogin: _onLogin,
      onRecoverPassword: (_) => null,
      onSignup: _onSignup,
      theme: LoginTheme(
        primaryColor: Theme.of(context).primaryColor,
      ),
      onSubmitAnimationCompleted: () {
        return MaterialApp(
            home: BlocProvider(
          create: (context) => ShoppingListItemCubit()
            ..getListItems()
            ..observeItems(),
          child: ShoppingListItemsView(),
        ));
      },
    );
  }
}
