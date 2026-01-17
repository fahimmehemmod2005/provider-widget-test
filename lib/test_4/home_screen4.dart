import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_testing/test_4/view_model4.dart';

class HomeScreen4 extends StatefulWidget {
  const HomeScreen4({super.key});

  @override
  State<HomeScreen4> createState() => _HomeScreen4State();
}

class _HomeScreen4State extends State<HomeScreen4> {
  late final ViewModel4 provider;

  @override
  void initState() {
    provider = Provider.of<ViewModel4>(context, listen: false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print('object');
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: Consumer<ViewModel4>(
          builder: (context, value, child) {
            print('final');
            return Column(
              children: [
                RadioListTile<ThemeMode>(
                  title: Text('Light Mode'),
                  value: ThemeMode.light,
                  groupValue: value.themeMode,
                  onChanged: value.setTheme,
                ),
                RadioListTile<ThemeMode>(
                  title: Text('Dark Mode'),
                  value: ThemeMode.dark,
                  groupValue: value.themeMode,
                  onChanged: value.setTheme,
                ),
                RadioListTile<ThemeMode>(
                  title: Text('System Mode'),
                  value: ThemeMode.system,
                  groupValue: value.themeMode,
                  onChanged: value.setTheme,
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
