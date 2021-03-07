/*
* Copyright 2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// ignore_for_file: public_member_api_docs

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';

// ignore: slash_for_doc_comments
/** This is an auto generated class representing the ShoppingListItem type in your schema. */
@immutable
class ShoppingListItem extends Model {
  static const classType = const ShoppingListItemType();
  final String id;
  final String itemName;
  final bool isComplete;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const ShoppingListItem._internal(
      {@required this.id, @required this.itemName, @required this.isComplete});

  factory ShoppingListItem(
      {String id, @required String itemName, @required bool isComplete}) {
    return ShoppingListItem._internal(
        id: id == null ? UUID.getUUID() : id,
        itemName: itemName,
        isComplete: isComplete);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShoppingListItem &&
        id == other.id &&
        itemName == other.itemName &&
        isComplete == other.isComplete;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("ShoppingListItem {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("itemName=" + "$itemName" + ", ");
    buffer.write(
        "isComplete=" + (isComplete != null ? isComplete.toString() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  ShoppingListItem copyWith({String id, String itemName, bool isComplete}) {
    return ShoppingListItem(
        id: id ?? this.id,
        itemName: itemName ?? this.itemName,
        isComplete: isComplete ?? this.isComplete);
  }

  ShoppingListItem.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        itemName = json['itemName'],
        isComplete = json['isComplete'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'itemName': itemName, 'isComplete': isComplete};

  static final QueryField ID = QueryField(fieldName: "shoppingListItem.id");
  static final QueryField ITEMNAME = QueryField(fieldName: "itemName");
  static final QueryField ISCOMPLETE = QueryField(fieldName: "isComplete");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ShoppingListItem";
    modelSchemaDefinition.pluralName = "ShoppingListItems";

    modelSchemaDefinition.authRules = [
      AuthRule(authStrategy: AuthStrategy.PUBLIC, operations: [
        ModelOperation.CREATE,
        ModelOperation.UPDATE,
        ModelOperation.DELETE,
        ModelOperation.READ
      ])
    ];

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: ShoppingListItem.ITEMNAME,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: ShoppingListItem.ISCOMPLETE,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)));
  });
}

class ShoppingListItemType extends ModelType<ShoppingListItem> {
  const ShoppingListItemType();

  @override
  ShoppingListItem fromJson(Map<String, dynamic> jsonData) {
    return ShoppingListItem.fromJson(jsonData);
  }
}
