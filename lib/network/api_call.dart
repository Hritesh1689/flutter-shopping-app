import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'enums.dart';
import 'network_exceptions.dart';

class CallApi {
  static Future<dynamic> callApi(String baseUrl, MethodType methodType, String relativeUrl, {String contentType = "application/json", Map<String, dynamic>? requestBody, Map<String, dynamic>?  params, Map<String, dynamic>? headers, int? pathId}) async {
    var dioObj = Dio();
    if (!await ((InternetConnectionChecker()).hasConnection)) {
      return {"occurredErrorDescriptionMsg": noConnection};
    }

    dioObj.options.baseUrl = baseUrl;
    dioObj.options.connectTimeout = 30000;
    dioObj.options.receiveTimeout = 30000;
    dioObj.interceptors.add(
        LogInterceptor(
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true,
          logPrint: (object) {
            log(object.toString());
          },
        )
    );

    Response response;
    try {
      switch (methodType) {
        case MethodType.get:
          {
            params != null
                ? response = await dioObj.get(relativeUrl,
                    queryParameters: params,
                    options: Options(
                        validateStatus: (_) => true,
                        headers: headers,
                        contentType: contentType))
                : pathId != null
                    ? response = await dioObj.get("$relativeUrl/$pathId")
                    : headers != null
                        ? response = await dioObj.get(relativeUrl,
                            options: Options(
                                headers: headers, contentType: contentType))
                        : response = await dioObj.get(relativeUrl);

            break;
          }

        case MethodType.post:
          if (contentType == contentTypeMap[ContentTypeLabel.multipart]) {
            final formData = FormData.fromMap(requestBody ?? {});
            response = await dioObj.post(
              relativeUrl,
              options: Options(
                  validateStatus: (_) => true,
                  headers: headers,
                  contentType: contentType),
              data: formData,
            );
          } else {
            params != null
                ? response = await dioObj.post(
                    relativeUrl,
                    options: Options(
                        validateStatus: (_) => true,
                        headers: headers,
                        contentType: contentType),
                    queryParameters: params,
                    data: jsonEncode(requestBody),
                  )
                : response = await dioObj.post(
                    relativeUrl,
                    options:
                        Options(headers: headers, contentType: contentType),
                    data: jsonEncode(requestBody),
                  );
          }

          break;
      }
      if (response.statusCode == 200) {
        return response.data;
      } else if ((response.statusCode == 401 || response.statusCode == 400) &&
          response.data != null) {
        return response.data;
      } else {
        return {
          "occurredErrorDescriptionMsg":
              "Might be status code is not success or response data is null"
        };
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        log("------------ DioError Exception e: connectTimeout: ${e.message} --------------");
      }
      if (e.type == DioErrorType.receiveTimeout) {
        log("------------ DioError Exception e: receiveTimeout: ${e.message} --------------");
      }

      log("------------ DioError Exception e: ${e.message} --------------");
      log("------------ DioError Exception e:: response:  ${e.message} --------------");
      log("------------ DioError Exception e:: getDioException: msg:  Dio Exception --------------");

      return {"occurredErrorDescriptionMsg": "Dio Exception"};
    }
  }
}
