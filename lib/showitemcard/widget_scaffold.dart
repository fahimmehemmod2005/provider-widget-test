import 'package:flutter/material.dart';

import 'Item_card.dart';
import 'detail_screen.dart';

class WidgetScaffold extends StatefulWidget {
  const WidgetScaffold({super.key});

  @override
  State<WidgetScaffold> createState() => _WidgetScaffoldState();
}

var list = [
  {
    'icon': 'https://cdn-icons-png.flaticon.com/512/1144/1144760.png',
    'title': 'Check a Link',
    'subtitle': 'Paste a URL to see If It’s safe',
  },
  {
    'icon': 'https://www.iconpacks.net/icons/2/free-user-icon-3296-thumb.png',
    'title': 'Scan QR Code',
    'subtitle': 'Safely scan QR codes before openirg them',
  },
  {
    'icon': 'https://cdn-icons-png.flaticon.com/512/535/535239.png',
    'title': 'I Think This Is a Scam',
    'subtitle': 'Get step-by-step guidance if you suspect fraud',
  },
];

class _WidgetScaffoldState extends State<WidgetScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        top: true,
        bottom: true,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text('Show list of map item'),
              Expanded(
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final item = list[index];
                    return ItemCard(
                      item: item,
                      icons: item['icon']!,
                      title: item['title']!,
                      subTitle: item['subtitle']!,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (builder) => DetailScreen(
                              title: item['title']!,
                              subtitle: item['subtitle']!,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
