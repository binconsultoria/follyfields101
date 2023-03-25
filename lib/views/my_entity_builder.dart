import 'package:flutter/widgets.dart';
import 'package:folly_fields/crud/abstract_ui_builder.dart';
import 'package:follyfields101/models/my_entity.dart';

///
///
///
class MyEntityBuilder extends AbstractUIBuilder<MyEntity> {
  ///
  ///
  ///
  @override
  Widget getTitle(BuildContext context, MyEntity model) {
    return Text(model.field);
  }

  ///
  ///
  ///
  @override
  String plural(BuildContext context) {
    return 'My Entities';
  }

  ///
  ///
  ///
  @override
  String single(BuildContext context) {
    return 'My Entity';
  }
}
