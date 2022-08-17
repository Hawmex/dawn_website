import 'dart:html' as html;

import 'package:dawn/dawn.dart';

import '../screens/cli_docs.dart';
import '../screens/features.dart';
import '../widgets/button.dart';
import '../widgets/dropdown.dart';

class DocsDropDown extends StatelessWidget {
  const DocsDropDown({super.key});

  @override
  Widget build(final BuildContext context) {
    return DropDown(
      child: Button('Docs', onTap: (final event) {}),
      items: [
        Button(
          'Features',
          solid: true,
          onTap: (final event) => context.pushRoute(
            builder: (final context) => const Features(),
          ),
        ),
        Button(
          'Package Docs',
          solid: true,
          onTap: (final event) => html.window.open(
            'https://pub.dev/documentation/dawn',
            '',
          ),
        ),
        Button(
          'CLI Docs',
          solid: true,
          onTap: (final event) => context.pushRoute(
            builder: (final context) => const CliDocs(),
          ),
        ),
      ],
    );
  }
}
