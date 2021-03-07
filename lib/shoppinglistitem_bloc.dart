import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ShoppingListState {}

class LoadingShoppingList extends ShoppingListState {}

class ShoppingListSuccess extends ShoppingListState {
  final List<dynamic> listItems;

  ShoppingListSuccess([this.listItems]);
}

class ShoppingListFailures extends ShoppingListState {
  final Exception exception;

  ShoppingListFailures({this.exception});
}

class ShoppingListItemCubit extends Cubit<ShoppingListState> {
  ShoppingListItemCubit() : super(LoadingShoppingList());

  void getListItems() {}

  void createListItems() {}

  void updateListItem() {}
}
