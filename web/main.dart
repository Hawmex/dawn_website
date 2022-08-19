import 'dart:html' as html;

import 'package:dawn/dawn.dart';

import 'screens/cli_docs.dart';
import 'screens/donate.dart';
import 'screens/features.dart';
import 'screens/get_started.dart';
import 'screens/home.dart';
import 'widgets/button.dart';
import 'widgets/drawer.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(final BuildContext context) {
    return Container(
      [
        const Navigator(child: Home()),
        Drawer([
          Button(
            'Get Started',
            onTap: (final event) => context
              ..pushRoute(
                builder: (final context) => const GetStarted(),
              )
              ..pop(),
          ),
          Button(
            'Features',
            onTap: (final event) => context
              ..pushRoute(
                builder: (final context) => const Features(),
              )
              ..pop(),
          ),
          Button(
            'Package Docs',
            onTap: (final event) => html.window.open(
              'https://pub.dev/documentation/dawn',
              '',
            ),
          ),
          Button(
            'CLI Docs',
            onTap: (final event) => context
              ..pushRoute(
                builder: (final context) => const CliDocs(),
              )
              ..pop(),
          ),
          Button(
            'Donate',
            onTap: (final event) => context
              ..pushRoute(
                builder: (final context) => const Donate(),
              )
              ..pop(),
          ),
        ])
      ],
      style: const Style({
        'font-family': 'JostVF',
        'font-size': '16px',
        'height': '100vh',
        'overflow': 'auto',
      }),
    );
  }
}
