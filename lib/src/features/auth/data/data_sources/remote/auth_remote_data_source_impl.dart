import 'package:dio/dio.dart';

import '../../../../../core/constants/api_constants.dart';
import 'abstract_auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AbstractAuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        ApiConstants.loginUrl,
        data: {
          'email': email,
          'password': password,
        },
      );

      final result = {
        'jwtToken': response.data['token'],
        'user': response.data['data'],
      };

      return result;
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Map<String, dynamic>> signup({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final response = await dio.post(
        ApiConstants.signupUrl,
        data: {
          'email': email,
          'password': password,
          'name': name,
        },
      );

      final result = {
        'jwtToken': response.data['token'],
        'user': response.data['data'],
      };

      return result;
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }
}
