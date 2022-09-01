import 'package:dawn/dawn.dart';

import '../utils/syntax_highlighting.dart';
import '../widgets/code_block.dart';
import '../widgets/content.dart';
import '../widgets/heading.dart';
import '../widgets/inline_code.dart';
import '../widgets/screen.dart';
import '../widgets/section.dart';
import '../widgets/top_bar.dart';

const _lowLevelWidget = '''
import 'dart:html' as html;

import 'package:dawn/dawn.dart';

void main() => runApp(const MyVideo('/assets/video.mp4'));

class MyVideo extends PaintedWidget {
  final String source;

  const MyVideo(this.source, {super.key});

  @override
  MyVideoNode createNode() => MyVideoNode(this);
}

class MyVideoNode extends PaintedNode<MyVideo, html.VideoElement> {
  MyVideoNode(super.widget) : super(element: html.VideoElement());

  @override
  void initializeElement() => element
    ..src = widget.source
    ..controls = true;
}
''';

const _routing = '''
import 'package:dawn/dawn.dart';

void main() => runApp(const Navigator(child: Page1()));

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(final BuildContext context) {
    return Text(
      'Page 1',
      onTap: (final event) => context.pushRoute(
        builder: (final context) => const Page2(),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(final BuildContext context) {
    return Text('Page 2', onTap: (final event) => context.pop());
  }
}
''';

const _modal = '''
import 'package:dawn/dawn.dart';

void main() => runApp(const Navigator(child: App()));

class App extends StatefulWidget {
  const App({super.key});

  @override
  State createState() => _AppState();
}

class _AppState extends State<App> {
  bool _isModalShown = false;

  @override
  Widget build(final BuildContext context) {
    return Container(
      [
        Text(
          _isModalShown ? 'Close modal' : 'Open modal',
          onTap: (final event) {
            if (_isModalShown) {
              context.pop();
            } else {
              setState(() => _isModalShown = true);

              context.pushModal(
                onPop: () => setState(() => _isModalShown = false),
              );
            }
          },
        ),
        if (_isModalShown) const Text('Modal!'),
      ],
      style: const Style({'display': 'flex', 'flex-flow': 'column'}),
    );
  }
}
''';

const _staticTheming = '''
import 'package:dawn/dawn.dart';

void main() => runApp(const Theme(child: App()));

class Theme extends InheritedWidget {
  final String accentColor = 'red';

  const Theme({required super.child, super.key});

  static Theme of(final BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<Theme>();

  @override
  bool shouldUpdateNotify(final Theme oldWidget) => false;
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(final BuildContext context) {
    return Text(
      'Hello World',
      style: Style({'color': Theme.of(context).accentColor}),
    );
  }
}
''';

const _dynamicTheming = '''
import 'package:dawn/dawn.dart';

final _theme = Theme()..initialize();

void main() => runApp(Provider(stores: [_theme], child: const App()));

class Theme extends Store {
  String accentColor = 'red';

  void toggleAccentColor() =>
      setState(() => accentColor = accentColor == 'red' ? 'blue' : 'red'); 
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(final BuildContext context) {
    return ConsumerBuilder<Theme>((final context, final store) {
      return Text(
        'Hello World!',
        style: Style({'color': store.accentColor}),
        onTap: (final event) => store.toggleAccentColor(),
      );
    });
  }
}
''';

class Cookbook extends StatelessWidget {
  const Cookbook({super.key});

  @override
  Widget build(final BuildContext context) {
    return const Screen([
      TopBar(title: 'Cookbook'),
      Content([
        Section([
          Section([
            Heading('Low-Level Widgets'),
            Text(
              'To create low-level widgets, you would have to extend or '
              'change Dawn\'s built-in widgets\' behavior. For example, to '
              'create a custom video player widget, you can write the '
              'following code.',
            ),
            CodeBlock(_lowLevelWidget, language: Language.dart),
          ]),
          Section([
            Heading('Routing'),
            Container([
              Text('For routing and navigation, a built-in '),
              InlineCode('Navigator'),
              Text(' class is provided.'),
            ]),
            CodeBlock(_routing, language: Language.dart),
          ]),
          Section([
            Heading('Modals'),
            Container([
              Text(
                'Modals are widgets that push the state of browser\'s history '
                'when opened. They are also closed when the browser\'s back '
                'button is tapped or ',
              ),
              InlineCode('context.pop()'),
              Text(' is called. Remember that '),
              InlineCode('Navigator'),
              Text(' should be constructed in your program.')
            ]),
            CodeBlock(_modal, language: Language.dart),
          ]),
          Heading('Theming'),
          Container([
            Text('For static theming, you can extend an '),
            InlineCode('InheritedWidget'),
            Text('.'),
          ]),
          CodeBlock(_staticTheming, language: Language.dart),
          Container([
            Text('For dynamic theming, you can extend a '),
            InlineCode('Store'),
            Text(', provide it via a '),
            InlineCode('Provider'),
            Text(', and use its data via a '),
            InlineCode('ConsumerBuilder'),
            Text('.'),
          ]),
          CodeBlock(_dynamicTheming, language: Language.dart),
        ]),
      ]),
    ]);
  }
}
