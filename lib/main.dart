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
    // Amplify.addPlugin(AmplifyAPI()); // UNCOMMENT this line once backend is deployed
    Amplify.addPlugin(AmplifyDataStore(modelProvider: ModelProvider.instance));

    try {
      // Once Plugins are added, configure Amplify
      await Amplify.configure(amplifyconfig);
    } catch (e) {
      print(e);
    }

    setState(() {
      _amplifyConfigured = true;
    });
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
