import 'package:weather_app/app/locator_service.dart';
import 'package:weather_app/ui/view/widgets/city_selector_dialog.dart';
import 'package:weather_app/utilities/enums.dart';

void setupDialogUi() {
  final builders = {
    DialogType.citySelector: (context, sheetRequest, completer) => const CitySelectorDialog(),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
