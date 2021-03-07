import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_shopper/models/ModelProvider.dart';
import 'package:smart_shopper/shoppinglistitem_repository.dart';

abstract class ShoppingListState {}

class LoadingShoppingList extends ShoppingListState {}

class ShoppingListSuccess extends ShoppingListState {
  final List<ShoppingListItem> listItems;

  ShoppingListSuccess({this.listItems});
}

class ShoppingListFailures extends ShoppingListState {
  final Exception exception;

  ShoppingListFailures({this.exception});
}

class ShoppingListItemCubit extends Cubit<ShoppingListState> {
  final _shoppingListRepo = ShoppingListItemRepository();

  ShoppingListItemCubit() : super(LoadingShoppingList());

  void getListItems() async {
    if (state is ShoppingListSuccess == false) {
      emit(LoadingShoppingList());
    }

    try {
      final items = await _shoppingListRepo.getListItems();
      emit(ShoppingListSuccess(listItems: items));
    } catch (e) {
      emit(ShoppingListFailures(exception: e));
    }
  }

  void createListItems(String itemName) async {
    await _shoppingListRepo.createListItems(itemName);
    getListItems();
  }

  void updateListItem(ShoppingListItem item, bool isComplete) async {
    await _shoppingListRepo.updateListItem(item, isComplete);
    getListItems();
  }
}
