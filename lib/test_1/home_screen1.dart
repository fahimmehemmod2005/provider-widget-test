import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_testing/test_1/view_model1.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({super.key});

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  @override
  late final provider = Provider.of<ViewModel1>(
    context,
    listen: false,
  );

  @override
  void dispose() {
    provider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<ViewModel1>(
          builder: (context, value, child) {
            return Text(value.count.toString(), style: TextStyle(fontSize: 50));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          provider.setCount();
        },
      ),
    );
  }
}
