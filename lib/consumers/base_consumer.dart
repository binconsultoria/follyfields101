import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:folly_fields/crud/abstract_consumer.dart';
import 'package:folly_fields/crud/abstract_model.dart';
import 'package:follyfields101/utils/config.dart';
import 'package:http/http.dart' as http;

///
///
///
abstract class BaseConsumer<T extends AbstractModel<Object>>
    extends AbstractConsumer<T> {
  final Map<String, String> headers = <String, String>{
    'Content-Type': 'application/json; charset=utf-8',
  };

  ///
  ///
  ///
  BaseConsumer(
    List<String> routeName, {
    bool returnLog = false,
  }) : super(routeName, returnLog: returnLog);

  ///
  ///
  ///
  @override
  Future<ConsumerPermission> checkPermission(
    BuildContext context,
    List<String> paths,
  ) async {
    return const ConsumerPermission(
      menu: true,
      view: true,
      insert: true,
      update: true,
      delete: true,
    );
  }

  @override
  Future<bool> delete(BuildContext context, T model) async {
    String url = [
      Config().endpoint,
      ...routeName,
      model.id.toString(),
    ].join('/');

    http.Response response =
        await http.delete(Uri.parse(url), headers: headers);

    return response.statusCode == 204;
  }

  @override
  Future<T?> getById(BuildContext context, T model) async {
    String url = [
      Config().endpoint,
      ...routeName,
      model.id.toString(),
    ].join('/');

    http.Response response = await http.get(Uri.parse(url), headers: headers);

    Map<String, dynamic> map = json.decode(response.body);

    return fromJson(map);
  }

  @override
  Future<List<T>> list(
    BuildContext context,
    Map<String, String> qsParam, {
    required bool forceOffline,
  }) async {
    String url = [Config().endpoint, ...routeName].join('/');

    int page = int.parse(qsParam['f'].toString()) ~/
        int.parse(qsParam['q'].toString());

    String size = qsParam['q'].toString();

    url += '?page=$page&size=$size';

    http.Response response = await http.get(Uri.parse(url), headers: headers);

    if (response.body.isEmpty) {
      return [];
    }

    List<dynamic> list = json.decode(response.body);

    return list
        .map<T>((dynamic item) => fromJson(AbstractModel.fromMultiMap(item)))
        .toList();
  }

  @override
  Future<bool> saveOrUpdate(BuildContext context, T model) async {
    if (model.id == null) {
      String url = [Config().endpoint, ...routeName].join('/');

      http.Response response = await http.post(
        Uri.parse(url),
        body: json.encode(model.toMap()),
        headers: headers,
      );

      return response.statusCode == 201;
    } else {
      String url = [
        Config().endpoint,
        ...routeName,
        model.id.toString(),
      ].join('/');

      http.Response response = await http.put(
        Uri.parse(url),
        body: json.encode(model.toMap()),
        headers: headers,
      );

      return response.statusCode == 204;
    }
  }
}
