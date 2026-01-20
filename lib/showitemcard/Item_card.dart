import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  final Map<String, String> item;
  final String? icons;
  final String? title;
  final String? subTitle;
  final VoidCallback? onTap;

  const ItemCard({
    super.key,
    required this.item,
    this.icons,
    this.title,
    this.subTitle,
    this.onTap,
  });

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0.5,
      semanticContainer: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16), // ripple matches border radius
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.all(20),
          height: 200,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(widget.icons ?? '', height: 48, width: 48),
              const SizedBox(height: 10),
              Text(
                widget.title ?? '',
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                widget.subTitle ?? '',
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}