import 'package:devhub/data/service/user/user_service.dart';
import 'package:devhub/domain/models/user_details/user_details.dart';
import 'package:devhub/domain/repository/user_repo.dart';
import 'package:get/get.dart';

class DevelopersController extends GetxController {
  final UserRepo userService = UserService();

  // Loading state
  RxBool isLoading = true.obs;

  // List to hold developer data
  RxList<UserDetails> developersList = <UserDetails>[].obs;

  @override
  void onInit() {
    fetchDevelopers();
    super.onInit();
  }

  // Fun for fetching developers
  void fetchDevelopers() async {
    isLoading.value = true;
    final result = await userService.getDevelopers();
    result.fold(
      (failure) {
        isLoading.value = false;
      },
      (success) {
        developersList.assignAll(success);
        isLoading.value = false;
      },
    );
  }
}
