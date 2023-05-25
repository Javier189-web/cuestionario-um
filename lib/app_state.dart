import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _idAreaQr = '';
  String get idAreaQr => _idAreaQr;
  set idAreaQr(String _value) {
    _idAreaQr = _value;
  }

  double _starValue = 0.0;
  double get starValue => _starValue;
  set starValue(double _value) {
    _starValue = _value;
  }

  final _poloManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> polo({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _poloManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPoloCache() => _poloManager.clear();
  void clearPoloCacheKey(String? uniqueKey) =>
      _poloManager.clearRequest(uniqueKey);
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
