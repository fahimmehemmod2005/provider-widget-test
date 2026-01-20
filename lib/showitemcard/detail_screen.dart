import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final String? title;
  final String? subtitle;

  const DetailScreen({
    super.key,
     this.title,
     this.subtitle
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title ?? '')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.title ?? '',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(widget.subtitle ?? '', style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
