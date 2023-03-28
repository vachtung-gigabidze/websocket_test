import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_websocket_app/app/app.bottomsheets.dart';
import 'package:my_websocket_app/app/app.locator.dart';
import 'package:my_websocket_app/ui/common/app_strings.dart';
import 'package:my_websocket_app/ui/views/home/home_viewmodel.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';

void main() {
  HomeViewModel _getModel() => HomeViewModel();

  group('HomeViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

    group('incrementCounter -', () {
      test('When called once should return  Counter is: 1', () {
        final HomeViewModel model = _getModel();
        model.incrementCounter();
        expect(model.counterLabel, 'Counter is: 1');
      });
    });

    group('showBottomSheet -', () {
      test('When called, should show custom bottom sheet using notice variant',
          () {
        final MockBottomSheetService bottomSheetService =
            getAndRegisterBottomSheetService<dynamic>();

        final HomeViewModel model = _getModel();
        model.showBottomSheet();
        verify(
          bottomSheetService.showCustomSheet<dynamic, dynamic>(
            variant: BottomSheetType.notice,
            title: ksHomeBottomSheetTitle,
            description: ksHomeBottomSheetDescription,
          ),
        );
      });
    });
  });
}
