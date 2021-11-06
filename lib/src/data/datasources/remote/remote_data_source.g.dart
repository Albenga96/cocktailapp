// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_data_source.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RemoteDataSource implements RemoteDataSource {
  _RemoteDataSource(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://www.thecocktaildb.com/api/json/v1/1';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<CocktailResponse> getAlcoholicCocktails(alcoholic) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'a': alcoholic};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CocktailResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/filter.php',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CocktailResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CocktailResponse> getCategoryCocktails(category) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'c': category};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CocktailResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/filter.php',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CocktailResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
