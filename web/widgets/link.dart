import 'dart:html' as html;

import 'package:dawn/dawn.dart';

class Link extends StatelessWidget {
  final String text;
  final String address;

  const Link({required this.text, required this.address, super.key});

  @override
  Widget build(final BuildContext context) {
    return Text(
      text,
      style: const Style({'color': '#0468d7', 'cursor': 'pointer'}),
      onTap: (final event) => html.window.open(address, ''),
    );
  }
}
