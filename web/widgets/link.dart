import 'dart:html' as html;

import 'package:dawn/dawn.dart';

import 'icon.dart';

class Link extends StatelessWidget {
  final String text;
  final String address;

  const Link({required this.text, required this.address, super.key});

  @override
  Widget build(final BuildContext context) {
    return Container(
      [Text(text), const Icon('open_in_new')],
      style: const Style({
        'color': '#0468d7',
        'cursor': 'pointer',
        'display': 'inline-flex',
        'gap': '4px',
      }),
      onTap: (final event) => html.window.open(address, ''),
    );
  }
}
