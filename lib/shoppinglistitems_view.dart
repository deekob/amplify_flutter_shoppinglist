import 'package:flutter/material.dart';

class ShoppingListItemsView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ShoppingListItemsViewState();
}

class _ShoppingListItemsViewState extends State<ShoppingListItemsView> {
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _navBar(), floatingActionButton: _floatingActionButton());
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
          controller: _titleController,
          decoration: InputDecoration(hintText: 'Enter groceries here'),
        ),
        ElevatedButton(
            onPressed: () {
              // ignore: todo
              // TODO Implement me
            },
            child: Text('Add to shopping list'))
      ],
    );
  }
}
