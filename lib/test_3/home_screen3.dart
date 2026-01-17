import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_testing/test_3/favorite_screen.dart';
import 'package:provider_testing/test_3/view_model3.dart';

class HomeScreen3 extends StatefulWidget {
  const HomeScreen3({super.key});

  @override
  State<HomeScreen3> createState() => _HomeScreen3State();
}

class _HomeScreen3State extends State<HomeScreen3> {
  late final provider = Provider.of<ViewModel3>(context, listen: false);

  @override
  void dispose() {
    provider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('object');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (builder) => FavoriteScreen()),
              );
            },
            icon: Icon(Icons.favorite, color: Colors.red),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Consumer<ViewModel3>(
            builder: (context, value, child) {
              print('final');
              return ListTile(
                onTap: () {
                  if (value.selectedItem.contains(index)) {
                    value.removeItem(index);
                  } else {
                    value.addItem(index);
                  }
                },
                trailing: Icon(
                  value.selectedItem.contains(index)
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                ),
                title: Text('Item ' + index.toString()),
              );
            },
          );
        },
      ),
    );
  }
}
