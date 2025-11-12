import 'package:devhub/data/service/user/user_service.dart';
import 'package:devhub/domain/models/user_details/user_details.dart';
import 'package:devhub/domain/repository/user_repo.dart';
import 'package:get/get.dart';

class DevelopersController extends GetxController {
  final UserRepo userService = UserService();

  // Loading state
  RxBool isLoading = true.obs;

  // List to hold all developers
  RxList<UserDetails> developersList = <UserDetails>[].obs;

  // Filtered list for search results
  RxList<UserDetails> filteredDevelopers = <UserDetails>[].obs;

  // Search query text
  RxString searchQuery = ''.obs;

  @override
  void onInit() {
    fetchDevelopers();
    super.onInit();
  }

  // Fetch all developers with a delay
  void fetchDevelopers() async {
    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 2));

    final result = await userService.getDevelopers();
    result.fold(
      (failure) {
        isLoading.value = false;
      },
      (success) {
        developersList.assignAll(success);
        filteredDevelopers.assignAll(success);
        isLoading.value = false;
      },
    );
  }

  // Search developers by name
  void searchDevelopers(String query) {
    searchQuery.value = query;

    if (query.isEmpty) {
      filteredDevelopers.assignAll(developersList);
    } else {
      final results = developersList.where((dev) {
        final name = dev.name?.toLowerCase() ?? '';
        final login = dev.login?.toLowerCase() ?? '';
        final lowerQuery = query.toLowerCase();
        return name.contains(lowerQuery) || login.contains(lowerQuery);
      }).toList();

      filteredDevelopers.assignAll(results);
    }
  }
}
