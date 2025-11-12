import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:devhub/data/service/api_service.dart';
import 'package:devhub/domain/core/api_endpoints/api_endpoints.dart';
import 'package:devhub/domain/models/failure/failure.dart';
import 'package:devhub/domain/models/user_details/user_details.dart';
import 'package:devhub/domain/repository/user_repo.dart';

class UserService implements UserRepo {
  final ApiService apiService = ApiService();

  @override
  Future<Either<Failure, List<UserDetails>>> getDevelopers() async {
    try {
      final result = await apiService.get(ApiEndPoints.users);

      final developers = (result as List<dynamic>)
          .map((e) => UserDetails.fromJson(e))
          .toList();

      log(
        'Mapped ${developers.length} developer objects successfully.',
        name: '[UserService]',
      );

      return Right(developers);
    } catch (e, st) {
      log(
        'Failed to fetch developers: $e',
        stackTrace: st,
        name: '[UserService]',
      );
      return Left(Failure(message: e.toString()));
    }
  }
}
