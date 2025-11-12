import 'dart:developer';
import 'package:dio/dio.dart';
// ignore: depend_on_referenced_packages
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:devhub/domain/core/api_endpoints/api_endpoints.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.options = BaseOptions(
      baseUrl: ApiEndPoints.baseUrl,
      headers: {
        'accept': 'application/vnd.github+json',
        'content-Type': 'application/json',
      },
    );

    assert(() {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: false,
          responseHeader: false,
          responseBody: true,
          error: true,
          compact: true,
          maxWidth: 100,
        ),
      );
      return true;
    }());
  }

  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response.data;
    } catch (e, st) {
      log('GET error: $e', stackTrace: st);
      rethrow;
    }
  }

  Future<dynamic> post(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    dynamic data,
  }) async {
    try {
      final response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response.data;
    } catch (e, st) {
      log('POST error: $e', stackTrace: st);
      rethrow;
    }
  }

  Future<dynamic> put(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    dynamic data,
  }) async {
    try {
      final response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response.data;
    } catch (e, st) {
      log('PUT error: $e', stackTrace: st);
      rethrow;
    }
  }

  Future<dynamic> delete(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    dynamic data,
  }) async {
    try {
      final response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response.data;
    } catch (e, st) {
      log('DELETE error: $e', stackTrace: st);
      rethrow;
    }
  }

  Future<dynamic> patch(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    dynamic data,
  }) async {
    try {
      final response = await _dio.patch(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response.data;
    } catch (e, st) {
      log('PATCH error: $e', stackTrace: st);
      rethrow;
    }
  }

  Future<bool> downloadFile({
    required String url,
    required String savePath,
    Map<String, dynamic>? headers,
    Function(int received, int total)? onReceiveProgress,
  }) async {
    try {
      await _dio.download(
        url,
        savePath,
        options: Options(headers: headers),
        onReceiveProgress: onReceiveProgress,
      );
      return true;
    } catch (e, st) {
      log('Download error: $e', stackTrace: st);
      return false;
    }
  }
}
