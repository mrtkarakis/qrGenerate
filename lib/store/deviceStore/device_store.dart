import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'device_store.g.dart';

// ignore: library_private_types_in_public_api
class DeviceStore = _DeviceStoreBase with _$DeviceStore;

abstract class _DeviceStoreBase with Store {
  Size size = const Size(0, 0);
  @action
  void setSize(BuildContext context) => size = MediaQuery.of(context).size;
}
