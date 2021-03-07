import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_shopper/shoppinglistitem_bloc.dart';
import 'package:smart_shopper/shoppinglistitems_view.dart';
// Amplify Flutter Packages
import 'package:amplify_flutter/amplify.dart';
// import 'package:amplify_api/amplify_api.dart'; // UNCOMMENT this line once backend is deployed
import 'package:amplify_datastore/amplify_datastore.dart';

// Generated in previous step
import 'models/ModelProvider.dart';
import 'amplifyconfiguration.dart';

void main() {
  runApp(ShoppingApp());
}

class ShoppingApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingApp> {
  bool _amplifyConfigured = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocProvider(
            create: (context) => ShoppingListItemCubit()..getListItems(),
            child:
                _amplifyConfigured ? ShoppingListItemsView() : LoadingView()));
  }

  @override
  initState() {
    super.initState();
    _configureAmplify();
  }

  void _configureAmplify() async {
    try {
      Future.wait([
        Amplify.addPlugin(AmplifyAPI()),
        Amplify.addPlugin(
            AmplifyDataStore(modelProvider: ModelProvider.instance)),
        Amplify.addPlugin(AmplifyAuthCognito())
      ]);

      // Once Plugins are added, configure Amplify
      await Amplify.configure(amplifyconfig);

      setState(() {
        _amplifyConfigured = true;
      });
    } catch (e) {
      print(e);
    }
  }
}

class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
