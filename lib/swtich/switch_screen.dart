import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_testing/swtich/switch_view_model.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<SwitchViewModel>(
          builder: (context, provider, child) {
            return Switch(
                value: provider.isSwitched,
                onChanged: (value) {
                  provider.toggleSwitch(value);
                },
            );
          },
        ),
      ),
    );
  }
}
