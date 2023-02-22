// import 'package:weather_app/app/locator_service.dart';
// import 'package:weather_app/utilities/enums.dart';

// void setupDialogUi() {

//   final builders = {
//     DialogType.basic: (context, sheetRequest, completer) =>
//         _BasicDialog(request: sheetRequest, completer: completer),
//     DialogType.form:  (context, sheetRequest, completer) =>
//         _FormDialog(request: sheetRequest, completer: completer),
//   };

//   dialogService.registerCustomDialogBuilders(builders);
// }

// class _BasicDialog extends StatelessWidget {
//   final DialogRequest request;
//   final Function(DialogResponse) completer;
//   const _BasicDialog({Key? key, this.request, this.completer}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       child: /* Build your dialog UI here */
//     );
//   }
// }

// class _FormDialog extends StatelessWidget {
//   final DialogRequest request;
//   final Function(DialogResponse) completer;
//   const _FormDialog({Key? key, this.request, this.completer}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       child: /* Build your dialog UI here */
//     );
//   }
// }


import 'package:weather_app/app/locator_service.dart';
import 'package:weather_app/ui/view/widgets/city_selector_dialog.dart';
import 'package:weather_app/utilities/enums.dart';


void setupDialogUi() {
  final builders = {

    DialogType.citySelector: (context, sheetRequest, completer) => const CitySelectorDialog(),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
