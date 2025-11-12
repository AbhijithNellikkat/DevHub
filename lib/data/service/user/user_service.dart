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
      /// Get the base user list
      final result = await apiService.get(ApiEndPoints.users);
      final developers = (result as List<dynamic>)
          .map((e) => UserDetails.fromJson(e))
          .toList();

      /// Fetch details for each developer using login
      final List<UserDetails> fullDevelopers = [];
      for (final dev in developers) {
        if (dev.login != null && dev.login!.isNotEmpty) {
          try {
            final details = await apiService.get(
              '${ApiEndPoints.users}/${dev.login}',
            );
            final fullUser = UserDetails.fromJson(details);
            fullDevelopers.add(fullUser);
          } catch (e) {
            log('[UserService] Failed to load details for ${dev.login}: $e');

            fullDevelopers.add(dev);
          }
        }
      }

      log(
        '[UserService] Completed fetching full details for ${fullDevelopers.length} developers',
      );
      return Right(fullDevelopers);
    } catch (e, st) {
      log('[UserService] Error fetching developers: $e', stackTrace: st);
      return Left(Failure(message: e.toString()));
    }
  }
}
