import 'dart:html' as html;

import 'package:dawn/dawn.dart';

import 'screens/cli_docs.dart' deferred as cli_docs;
import 'screens/cookbook.dart' deferred as cookbook;
import 'screens/donate.dart' deferred as donate;
import 'screens/features.dart' deferred as features;
import 'screens/get_started.dart' deferred as get_started;
import 'screens/home.dart';
import 'screens/loading.dart';
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
              ..pushRouteLazily(
                loader: get_started.loadLibrary,
                builder: (final context) => get_started.GetStarted(),
                initialData: const Loading(),
              )
              ..pop(),
          ),
          const Divider(),
          Button(
            text: 'Features',
            icon: 'list',
            onTap: (final event) => context
              ..pushRouteLazily(
                loader: features.loadLibrary,
                builder: (final context) => features.Features(),
                initialData: const Loading(),
              )
              ..pop(),
          ),
          Button(
            text: 'Cookbook',
            icon: 'menu_book',
            onTap: (final event) => context
              ..pushRouteLazily(
                loader: cookbook.loadLibrary,
                builder: (final context) => cookbook.Cookbook(),
                initialData: const Loading(),
              )
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
              ..pushRouteLazily(
                loader: cli_docs.loadLibrary,
                builder: (final context) => cli_docs.CliDocs(),
                initialData: const Loading(),
              )
              ..pop(),
          ),
          const Divider(),
          Button(
            text: 'Donate',
            icon: 'finance_chip',
            onTap: (final event) => context
              ..pushRouteLazily(
                loader: donate.loadLibrary,
                builder: (final context) => donate.Donate(),
                initialData: const Loading(),
              )
              ..pop(),
          ),
        ])
      ],
      style: const Style({
        'font-family': '"JostVF"',
        'font-size': '16px',
        'line-height': '24px',
        'height': '100vh',
        'overflow': 'auto',
      }),
    );
  }
}
