import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
  void observeNetwork(VoidCallback success, VoidCallback failure);
}

class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> get isConnected async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    // ignore: unrelated_type_equality_checks
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }

  @override
  void observeNetwork(VoidCallback success, VoidCallback failure) async {
    if (await isConnected) {
      success();
    } else {
      failure();
    }
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        failure();
      } else {
        success();
      }
    } as void Function(List<ConnectivityResult> event)?);
  }
}
