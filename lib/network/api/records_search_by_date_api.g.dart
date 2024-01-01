// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'records_search_by_date_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _MedicalRecordsByDateAPI implements MedicalRecordsByDateAPI {
  _MedicalRecordsByDateAPI(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://clinica-app.onrender.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<SingleMedicalRecordVO>> getAllRecords(
    String authorization,
    String date,
    String doctorId,
    String hospitalId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': authorization};
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'date': date,
      'doctor_id': doctorId,
      'hospital_clinic_id': hospitalId,
    };
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<SingleMedicalRecordVO>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
            .compose(
              _dio.options,
              '/list_of_medical_records_by_doctor_and_hospital_by_date',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) =>
            SingleMedicalRecordVO.fromJson(i as Map<String, dynamic>))
        .toList();
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

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
