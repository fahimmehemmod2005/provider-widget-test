import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_testing/test_2/view_model2.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  late final provider = Provider.of<ViewModel2>(context, listen: false);

  @override
  void dispose() {
    provider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<ViewModel2>(
              builder: (context, value, child) {
                return Slider(
                  value: value.value,
                  onChanged: (val) {
                    value.setValue(val);
                  },
                );
              },
            ),
            Consumer<ViewModel2>(
              builder: (context, value, child) {
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 100,
                        color: Colors.green.withOpacity(value.value),
                        child: Center(child: Text('Container 1')),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 100,
                        color: Colors.red.withOpacity(value.value),
                        child: Center(child: Text('Container 1')),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
