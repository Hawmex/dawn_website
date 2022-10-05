import 'dart:html' as html;

import 'package:dawn/dawn.dart';

import '../utils/syntax_highlighting.dart';
import '../widgets/button.dart';
import '../widgets/code.dart';
import '../widgets/content.dart';
import '../widgets/heading.dart';
import '../widgets/screen.dart';
import 'install.dart' deferred as install;

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(final BuildContext context) {
    return Screen(
      drawerActiveItemIndex: 0,
      content: Content([
        Container(
          [
            const Image(
              '/assets/logo.svg',
              style: Style({'width': '128px ', 'height': '128px'}),
            ),
            const Heading.h1(
              Text(
                'Build Fast & User-Friendly Web Apps',
                style: Style({'text-align': 'center', 'display': 'block'}),
              ),
            ),
            Container(
              [
                Container([
                  Button.secondaryFilled(
                    text: 'Install',
                    icon: 'download',
                    onTap: (final event) => context
                      ..pushRouteLazily(
                        loader: install.loadLibrary,
                        builder: (final context) => install.Install(),
                      ),
                  )
                ]),
                const Container([
                  Button.normalText(
                    text: 'API Reference',
                    icon: 'open_in_new',
                    link: 'https://pub.dev/documentation/dawn',
                  )
                ]),
              ],
              style: const Style({
                'display': 'flex',
                'flex-flow': 'row',
                'flex-wrap': 'wrap',
                'gap': '8px',
                'justify-content': 'center',
              }),
            ),
            Container(
              const [
                Code.block(
                  '''
import 'package:dawn/dawn.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(final BuildContext context) {
    return const Text('Hello World!');
  }
}
''',
                  language: ProgrammingLanguage.dart,
                ),
                Heading.h4(
                  Text(
                    'Dawn is a Dart web framework that lets developers create '
                    'UIs with a widget model similar to Flutter. Dawn apps are '
                    'compiled into JS and painted with HTML & CSS.',
                    style: Style({'text-align': 'center', 'display': 'block'}),
                  ),
                )
              ],
              style: Style({
                'display': 'flex',
                'flex-flow': html.window.innerWidth! > 1080 ? 'row' : 'column',
                'gap': '12px',
                'align-items': 'center',
                'width': '100%',
              }),
            ),
          ],
          style: const Style({
            'display': 'flex',
            'flex-flow': 'column',
            'gap': '24px',
            'align-items': 'center',
            'justify-content': 'space-evenly',
            'height': '100%',
          }),
        ),
      ]),
    );
  }
}
