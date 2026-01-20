import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:provider_testing/copypaste/copy_paste_view_model.dart';

class CopyPasteScreen extends StatefulWidget {
  const CopyPasteScreen({super.key});

  @override
  State<CopyPasteScreen> createState() => _CopyPasteScreenState();
}

class _CopyPasteScreenState extends State<CopyPasteScreen> {
  final TextEditingController _input = TextEditingController();

  @override
  void dispose() {
    _input.dispose();
    super.dispose();
  }

  void showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: color,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 6,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _input,
                decoration: const InputDecoration(
                  hintText: 'https://example.com',
                ),
              ),

              const SizedBox(height: 20),

              Consumer<CopyPasteViewModel>(
                builder: (context, value, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // COPY BUTTON
                      IconButton(
                        onPressed: () {
                          if (_input.text.isEmpty) {
                            showSnackBar('Nothing to copy!', Colors.red.shade700);
                          } else {
                            Clipboard.setData(ClipboardData(text: _input.text));
                            showSnackBar('Copied to clipboard', Colors.green.shade700);
                          }
                        },
                        icon: const Icon(Icons.copy_outlined),
                      ),

                      // PASTE BUTTON
                      IconButton(
                        onPressed: () async {
                          final data = await Clipboard.getData('text/plain');
                          final text = data?.text ?? '';
                          if (text.isEmpty) {
                            showSnackBar('Clipboard is empty!', Colors.red.shade700);
                          } else {
                            setState(() {
                              _input.text = text;
                            });
                            showSnackBar('Pasted from clipboard', Colors.green.shade700);
                          }
                          // Debug print
                          if (kDebugMode) print('Clipboard: $text');
                        },
                        icon: const Icon(Icons.paste_outlined),
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 20),

              Text(
                'Clipboard: ${_input.text}',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
