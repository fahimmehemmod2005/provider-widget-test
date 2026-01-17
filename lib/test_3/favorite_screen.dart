import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_testing/test_3/view_model3.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late final provider = Provider.of<ViewModel3>(context, listen: false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,),
      body: ListView.builder(
        itemCount: provider.selectedItem.length,
        itemBuilder: (context, index) {
          return Consumer<ViewModel3>(
            builder: (context, value, child) {
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
