import 'package:dartz/dartz.dart';
import 'package:devhub/domain/models/failure/failure.dart';
import 'package:devhub/domain/models/user_details/user_details.dart';

abstract class UserRepo {
  Future<Either<Failure, List<UserDetails>>> getDevelopers();
}
