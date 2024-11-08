import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main_viewmodel.g.dart';

@riverpod
class MainIndexViewmodel extends _$MainIndexViewmodel {
  @override
  int build() {
    return 0;
  }

  void selectIndex(int index) {
    state = index;
  }
}

@riverpod
class MainOnboardingViewmodel extends _$MainOnboardingViewmodel {
  final _dio = Dio();
  var deviceInfo = DeviceInfoPlugin();
  @override
  Future<void> build() async {
    var iosInfo = await deviceInfo.iosInfo;

    final uri = Uri.http(
      "semtle.catholic.ac.kr:8087",
      '/users',
    );

    try {
      final response =
          await _dio.postUri(uri, data: {"uuid": iosInfo.identifierForVendor});

      print(response);
    } catch (e) {
      print(e);
    }
  }
}