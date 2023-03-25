import 'package:flutter/widgets.dart';
import 'package:folly_fields/crud/abstract_edit.dart';
import 'package:folly_fields/crud/empty_edit_controller.dart';
import 'package:folly_fields/fields/string_field.dart';
import 'package:folly_fields/responsive/responsive.dart';
import 'package:folly_fields/util/folly_validators.dart';
import 'package:follyfields101/consumers/my_entity_consumer.dart';
import 'package:follyfields101/models/my_entity.dart';
import 'package:follyfields101/views/my_entity_builder.dart';

///
///
///
class MyEntityEdit extends AbstractEdit<MyEntity, MyEntityBuilder,
    MyEntityConsumer, EmptyEditController<MyEntity>> {
  ///
  ///
  ///
  const MyEntityEdit(
    super.model,
    super.uiBuilder,
    super.consumer, {
    super.key,
    required super.edit,
  });

  ///
  ///
  ///

  @override
  List<Responsive> formContent(
    BuildContext context,
    MyEntity model,
    String labelPrefix,
    Function(bool refresh) refresh,
    bool Function() formValidate,
    EmptyEditController<MyEntity> editController, {
    required bool edit,
  }) {
    return [
      StringField(
        label: 'Nome',
        initialValue: model.field,
        validator: FollyValidators.stringNotEmpty,
        onSaved: (String? value) => model.field = value!,
      ),
    ];
  }
}
