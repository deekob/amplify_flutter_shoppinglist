import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_shopper/main.dart';
import 'package:smart_shopper/models/ShoppingListItem.dart';
import 'package:smart_shopper/shoppinglistitem_bloc.dart';

class ShoppingListItemsView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ShoppingListItemsViewState();
}

class _ShoppingListItemsViewState extends State<ShoppingListItemsView> {
  final _itemNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _navBar(),
      floatingActionButton: _floatingActionButton(),
      body: BlocBuilder<ShoppingListItemCubit, ShoppingListState>(
          builder: (context, state) {
        if (state is ShoppingListSuccess) {
          return state.listItems.isEmpty
              ? _emptyTodosView()
              : _shoppingItemListView(state.listItems);
        } else if (state is ShoppingListFailures) {
          return _exceptionView(state.exception);
        } else {
          return LoadingView();
        }
      }),
    );
  }

  Widget _exceptionView(Exception exception) {
    return Center(child: Text(exception.toString()));
  }

  AppBar _navBar() {
    return AppBar(
      title: Text('My Shopping List'),
    );
  }

  Widget _floatingActionButton() {
    return FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => _newItemView());
        });
  }

  Widget _newItemView() {
    return Column(
      children: [
        TextField(
          controller: _itemNameController,
          decoration: InputDecoration(hintText: 'Enter groceries here'),
        ),
        ElevatedButton(
            onPressed: () {
              BlocProvider.of<ShoppingListItemCubit>(context)
                  .createListItems(_itemNameController.text);
              _itemNameController.text = '';
              Navigator.of(context).pop();
            },
            child: Text('Add to shopping list'))
      ],
    );
  }

  Widget _emptyTodosView() {
    return Center(
      child: Text('Your shopping list is empty',
          style: TextStyle(fontWeight: FontWeight.bold), textScaleFactor: 1.5),
    );
  }

  Widget _shoppingItemListView(List<ShoppingListItem> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Card(
          child: CheckboxListTile(
              title: Text(item.itemName),
              value: item.isComplete,
              onChanged: (newValue) {
                BlocProvider.of<ShoppingListItemCubit>(context)
                    .updateListItem(item, newValue);
              }),
        );
      },
    );
  }
}
