import 'dart:html' as html;

import 'package:dawn/dawn.dart';

import 'screens/cli_docs.dart';
import 'screens/donate.dart';
import 'screens/features.dart';
import 'screens/get_started.dart';
import 'screens/home.dart';
import 'widgets/button.dart';
import 'widgets/divider.dart';
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
            text: 'Get Started',
            icon: 'code',
            onTap: (final event) => context
              ..pushRoute(builder: (final context) => const GetStarted())
              ..pop(),
          ),
          const Divider(),
          Button(
            text: 'Features',
            icon: 'list',
            onTap: (final event) => context
              ..pushRoute(builder: (final context) => const Features())
              ..pop(),
          ),
          Button(
            text: 'Package Docs',
            icon: 'open_in_new',
            onTap: (final event) =>
                html.window.open('https://pub.dev/documentation/dawn', ''),
          ),
          Button(
            text: 'CLI Docs',
            icon: 'article',
            onTap: (final event) => context
              ..pushRoute(builder: (final context) => const CliDocs())
              ..pop(),
          ),
          const Divider(),
          Button(
            text: 'Donate',
            icon: 'finance_chip',
            onTap: (final event) => context
              ..pushRoute(builder: (final context) => const Donate())
              ..pop(),
          ),
        ])
      ],
      style: const Style({
        'font-family': 'JostVF',
        'font-size': '16px',
        'line-height': '24px',
        'height': '100vh',
        'overflow': 'auto',
      }),
    );
  }
}
