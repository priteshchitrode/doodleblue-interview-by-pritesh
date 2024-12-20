import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:doodleblue_interview_by_pritesh/data/network/apiURL.dart';
import 'package:doodleblue_interview_by_pritesh/data/network/baseApiService.dart';
import 'package:doodleblue_interview_by_pritesh/data/response/result.dart';
import 'package:doodleblue_interview_by_pritesh/data/storage/securedSharedPreferences.dart';
import 'package:doodleblue_interview_by_pritesh/service/hasInternetConnection.dart';
import 'package:doodleblue_interview_by_pritesh/utils/customLog.dart';


class ApiService extends BaseApiService {
  final Duration _timeout = const Duration(seconds: 30);
  final Dio _dio;
  late DioCacheManager _cacheManager;
  ApiService(this._dio) {
    CacheConfig cacheConfig = CacheConfig(baseUrl: ApiUrl.baseUrl);
    _cacheManager = DioCacheManager(cacheConfig);
    _dio.interceptors.add(_cacheManager.interceptor);
    _dio.options.connectTimeout = _timeout.inMilliseconds;
    _dio.options.receiveTimeout = _timeout.inMilliseconds;
  }

  @override
  Future<Result<dynamic>> get(String url, {Map<String, dynamic>? queryParams, bool forceRefresh = false, CancelToken? cancelToken}) async {
    CustomLog.debug(this, "Method : Get, URL : $url, queryParams : $queryParams");
    try {
      if(HasInternetConnection.isInternet != true){
        return Error(InternetNetworkError());
      }

      String cacheKey = await _generateCacheKey(url, queryParams);
      final response = await _dio.get(
        url,
        queryParameters: queryParams,
        cancelToken: cancelToken,
        options: buildConfigurableCacheOptions(
          options: Options(
            headers: await _getHeaders(),
          ),
          maxAge: const Duration(minutes: 30),
          maxStale: const Duration(days: 1),
          subKey: cacheKey,
          forceRefresh: forceRefresh,
        ),
      );
      return _handleBodyResponse(response);
    } on DioError catch (dioError) {
      return _handleDioError(dioError);
    } catch (exception) {
      CustomLog.error(this, "Generic HTTP call error", exception);
      return Error(GenericError());
    }
  }

  Future<String> _generateCacheKey(String url, Map<String, dynamic>? queryParams) async {
    var queryParamsString = queryParams != null ? base64.encode(utf8.encode(json.encode(queryParams))) : "";
    return "$url-$queryParamsString";
  }


  Result<dynamic> _handleBodyResponse(Response response) {
    CustomLog.debug(this, "Response status code: ${response.statusCode}, response.data: ${response.data}");
    log("Res : ${response.data}");
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Success(response.data);
      } else {
        return _handleHttpError(response);
      }
    } on Exception catch (e) {
      CustomLog.error(this, "Error decoding data response: $e", null);
      return Error(GenericError());
    }
  }

  Result<dynamic> _handleDioError(DioError error) {
    CustomLog.error(this, "DIO HTTP call error, response : ${error.response}", error);
    switch (error.type) {
      case DioErrorType.response:
        return _handleHttpError(error.response);
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return Error(NetworkTimeoutError());
      case DioErrorType.cancel:
        return Error(RequestCancelledError());
      default:
        return Error(ErrorWithMessage(message: error.response?.data));
    }
  }

  Result<dynamic> _handleHttpError(Response? response) {
    switch (response?.statusCode) {
      case 400: return Error(ErrorWithMessage.fromApiResponse(response?.data));
      case 401: return Error(UnauthenticatedError());
      case 404: return Error(NotFoundError());
      case 409: return Error(ConflictError());
      case 498: return Error(InvalidTokenError());
      case 500: return Error(GenericError());
      default:
        log("Unexpected status code: ${response?.statusCode}");
        return Error(GenericError());
    }
  }

  Future<Map<String, String>> _getHeaders() async {
    return {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    };
  }



}
