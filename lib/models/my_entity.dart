import 'package:folly_fields/crud/abstract_model.dart';

///
///
///
class MyEntity extends AbstractModel<int> {
  String field = '';

  ///
  ///
  ///
  MyEntity();

  ///
  ///
  ///
  MyEntity.fromJson(Map<String, dynamic> map)
      : field = map['field'],
        super.fromJson(map);

  ///
  ///
  ///
  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = super.toMap();
    map['field'] = field;
    return map;
  }
}
