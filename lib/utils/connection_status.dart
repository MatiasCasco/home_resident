import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConnectionStatus extends GetxController {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription _connectionSubscription;
  RxBool _isOnline = true.obs;
  RxBool get isOnline => _isOnline;

  ConnectionStatus() {
    _connectionSubscription = _connectivity.onConnectivityChanged.listen((_) =>_checkInternetConnection());
    _checkInternetConnection();
  }

  Future<void> _checkInternetConnection() async {
    try {
      await Future.delayed(Duration(seconds: 3));
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        _isOnline.value = true;
        print('connect');
      } else {
        _isOnline.value = false;
        print('not connect');
      }
    } on SocketException catch (_) {
      _isOnline.value = false;
      print('not connect');
    }
    //notifyListeners();
  }
  @override
  void dispose() {
    _connectionSubscription.cancel();
    super.dispose();
  }
}

