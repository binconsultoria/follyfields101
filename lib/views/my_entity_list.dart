import 'package:flutter/widgets.dart';
import 'package:folly_fields/crud/abstract_list.dart';
import 'package:follyfields101/consumers/my_entity_consumer.dart';
import 'package:follyfields101/models/my_entity.dart';
import 'package:follyfields101/views/my_entity_builder.dart';
import 'package:follyfields101/views/my_entity_edit.dart';

///
///
///
class MyEntityList
    extends AbstractList<MyEntity, MyEntityBuilder, MyEntityConsumer> {
  ///
  ///
  ///
  MyEntityList({
    super.key,
  }) : super(
          selection: false,
          multipleSelection: false,
          showRefreshButton: true,
          consumer: MyEntityConsumer(),
          uiBuilder: MyEntityBuilder(),
          onAdd: (
            BuildContext context,
            MyEntityBuilder uiBuilder,
            MyEntityConsumer consumer,
          ) async =>
              MyEntityEdit(
            MyEntity(),
            uiBuilder,
            consumer,
            edit: true,
          ),
          onUpdate: (
            BuildContext context,
            MyEntity model,
            MyEntityBuilder uiBuilder,
            MyEntityConsumer consumer,
            bool edit,
          ) async =>
              MyEntityEdit(
            model,
            uiBuilder,
            consumer,
            edit: edit,
          ),
        );
}
