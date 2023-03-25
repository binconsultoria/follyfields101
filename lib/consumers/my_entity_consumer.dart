import 'package:follyfields101/consumers/base_consumer.dart';
import 'package:follyfields101/models/my_entity.dart';

///
///
///
class MyEntityConsumer extends BaseConsumer<MyEntity> {
  ///
  ///
  ///
  MyEntityConsumer() : super(['my-entity']);

  ///
  ///
  ///
  @override
  MyEntity fromJson(Map<String, dynamic> map) => MyEntity.fromJson(map);
}
