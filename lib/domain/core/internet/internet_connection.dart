import 'dart:async';
import 'package:devhub/application/presentation/utils/colors.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../application/presentation/utils/snackbar/flutter_tost.dart';

class InternetConnectionController extends GetxController {
  /// Observable to track the internet connection status.
  RxBool isConnectedToInternet = false.obs;

  /// StreamSubscription to listen to the internet status changes.
  StreamSubscription<InternetConnectionStatus>? _connectionSubscription;

  @override
  void onInit() {
    super.onInit();
    _startListening();
  }

  int connectionCount = 0;

  /// Initializes the InternetConnectionChecker listener.
  void _startListening() {
    _connectionSubscription = InternetConnectionChecker().onStatusChange.listen((
      status,
    ) {
      switch (status) {
        case InternetConnectionStatus.connected:
          isConnectedToInternet.value = true;
          if (connectionCount > 0) {
            showCustomToast(
              message: "You are now back online.",
              backgroundColor: Get.isDarkMode ? kgrey.withOpacity(0.2) : kblack,
              textColor: Get.isDarkMode ? kblack : kwhite,
            );
          }

          break;
        case InternetConnectionStatus.disconnected:
          isConnectedToInternet.value = false;
          showCustomToast(
            message:
                'No internet connection. Please check your network and try again.',
            backgroundColor: kred,
          );
          break;
      }
      connectionCount++;
    });
  }

  /// Dispose of the subscription when the controller is closed.
  @override
  void onClose() {
    _connectionSubscription?.cancel();
    super.onClose();
  }

  /// Method to manually check the internet status.
  Future<void> checkConnection() async {
    final isConnected = await InternetConnectionChecker().hasConnection;
    isConnectedToInternet.value = isConnected;
  }
}
