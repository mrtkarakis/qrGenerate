import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'device_store.g.dart';

class DeviceStore = _DeviceStoreBase with _$DeviceStore;

abstract class _DeviceStoreBase with Store {
  Size size = const Size(0, 0);
  @action
  void setSize(BuildContext context) => size = MediaQuery.of(context).size;
}
