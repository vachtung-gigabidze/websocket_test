import 'package:stacked/stacked.dart';
import 'package:my_websocket_app/app/app.locator.dart';
import 'package:my_websocket_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  /// Place anything here that needs to happen before we get into the application
  Future<void> runStartupLogic() async {
    await Future<void>.delayed(
      const Duration(seconds: 3),
      () => null,
    );

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic

    _navigationService.replaceWithHomeView();
  }
}
