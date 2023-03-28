import 'package:my_websocket_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:my_websocket_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:my_websocket_app/ui/views/home/home_view.dart';
import 'package:my_websocket_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute<dynamic>(page: HomeView),
    MaterialRoute<dynamic>(page: StartupView),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton<dynamic>(classType: BottomSheetService),
    LazySingleton<dynamic>(classType: DialogService),
    LazySingleton<dynamic>(classType: NavigationService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
