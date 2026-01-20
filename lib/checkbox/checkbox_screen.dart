import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_testing/checkbox/checkbox_view_model.dart';

class CheckboxScreen extends StatefulWidget {
  const CheckboxScreen({super.key});

  @override
  State<CheckboxScreen> createState() => _CheckboxScreenState();
}

class _CheckboxScreenState extends State<CheckboxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<CheckboxViewModel>(
            builder: (context, provider, child) {
              return Checkbox(
                value: provider.isChecked,
                onChanged: (value) {
                  provider.toggleChecked(value!);
                },
              );
            },
        )
      ),
    );
  }
}
