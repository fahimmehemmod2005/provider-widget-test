import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_testing/checkbox/checkbox_screen.dart';
import 'package:provider_testing/copypaste/copy_paste_screen.dart';
import 'package:provider_testing/qrcode/widget_qr_code.dart';
import 'package:provider_testing/showitemcard/widget_scaffold.dart';
import 'package:provider_testing/swtich/switch_screen.dart';
import 'package:provider_testing/test_1/home_screen1.dart';
import 'package:provider_testing/test_2/home_screen2.dart';
import 'package:provider_testing/test_3/home_screen3.dart';
import 'package:provider_testing/test_4/home_screen4.dart';
import 'package:provider_testing/test_4/view_model4.dart';
import 'package:provider_testing/viewmodels/view_models.dart';
import 'countrypickerinputfiled/country_picker_input_field_screen.dart';
import 'login_logic_screen/login_screen.dart';

void main() {
  runApp(
    MultiProvider(providers: AppViewModels.viewModels, child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ViewModel4>(context);
    return MaterialApp(
      themeMode: themeChanger.themeMode,
      darkTheme: ThemeData(
        brightness: Brightness.dark
      ),
      theme: ThemeData(
        brightness: Brightness.light
      ),
      debugShowCheckedModeBanner: false,
      home: CountryPickerInputFieldScreen(),
    );
  }
}
