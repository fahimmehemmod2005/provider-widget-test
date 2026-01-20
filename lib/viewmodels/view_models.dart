import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider_testing/checkbox/checkbox_view_model.dart';
import 'package:provider_testing/copypaste/copy_paste_view_model.dart';
import 'package:provider_testing/swtich/switch_view_model.dart';
import 'package:provider_testing/test_2/view_model2.dart';
import 'package:provider_testing/test_3/view_model3.dart';
import '../countrypickerinputfiled/country_picker_view_model.dart';
import '../login_logic_screen/login_view_model.dart';
import '../test_1/view_model1.dart';
import '../test_4/view_model4.dart';

class AppViewModels {
  static final List<SingleChildWidget> viewModels = [
    ChangeNotifierProvider<ViewModel1>(create: (_) => ViewModel1()),
    ChangeNotifierProvider<ViewModel2>(create: (_) => ViewModel2()),
    ChangeNotifierProvider<ViewModel3>(create: (_) => ViewModel3()),
    ChangeNotifierProvider<ViewModel4>(create: (_) => ViewModel4()),
    ChangeNotifierProvider<LoginViewModel>(create: (_) => LoginViewModel()),
    ChangeNotifierProvider<CheckboxViewModel>(create: (_) => CheckboxViewModel()),
    ChangeNotifierProvider<SwitchViewModel>(create: (_) => SwitchViewModel()),
    ChangeNotifierProvider<CopyPasteViewModel>(create: (_) => CopyPasteViewModel()),
    ChangeNotifierProvider<CountryPickerViewModel>(create: (_) => CountryPickerViewModel()),
  ];
}
