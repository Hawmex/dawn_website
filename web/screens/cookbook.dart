import 'package:dawn/dawn.dart';

import '../utils/syntax_highlighting.dart';
import '../widgets/button.dart';
import '../widgets/code.dart';
import '../widgets/content.dart';
import '../widgets/heading.dart';
import '../widgets/items_list.dart';
import '../widgets/paragraph.dart';
import '../widgets/screen.dart';
import 'donate.dart' deferred as donate;
import 'features.dart' deferred as features;

class Cookbook extends StatelessWidget {
  const Cookbook({super.key, super.ref});

  @override
  Widget build(final BuildContext context) {
    return Screen(
      drawerActiveItemIndex: 4,
      previous: Button.extendedNormalText(
        icon: 'chevron_left',
        text: 'Features',
        onTap: (final details) => context.pushRouteLazily(
          loader: features.loadLibrary,
          builder: (final context) => features.Features(),
        ),
      ),
      next: Button.extendedSecondaryFilled(
        icon: 'chevron_right',
        text: 'Donate',
        onTap: (final details) => context.pushRouteLazily(
          loader: donate.loadLibrary,
          builder: (final context) => donate.Donate(),
        ),
      ),
      content: const Content([
        Heading.h1(Text('Cookbook')),
        Paragraph([
          Text(
            'This page contains some recommended patterns for Dawn '
            'applications.',
          ),
        ]),
        Heading.h2(
          Text(
            'Low-Level Widgets (Widgets With Extra Functionalities Or Unique '
            'Behaviors)',
          ),
        ),
        Paragraph([
          Text('To create low-level widgets, you would have to create a '),
          Code.inline('Node'),
          Text(' subclass and construct it in '),
          Code.inline('Widget.createNode'),
          Text(
            '. For example, to create a custom and simple video player widget, '
            'you can write the following code.',
          ),
        ]),
        Code.block(
          '''
import 'dart:html' as html;

import 'package:dawn/dawn.dart';

void main() => runApp(const MyVideo('/assets/video.mp4'));

class MyVideo extends PaintedWidget {
  final String source;

  const MyVideo(this.source, {super.key, super.ref});

  @override
  MyVideoNode createNode() => MyVideoNode(this);
}

class MyVideoNode extends ChildlessPaintedNode<MyVideo, html.VideoElement> {
  MyVideoNode(super.widget) : super(element: html.VideoElement());

  @override
  void initializeElement() {
    super.initializeElement();

    element
      ..src = widget.source
      ..controls = true;
  }
}
''',
          language: ProgrammingLanguage.dart,
        ),
        Heading.h2(Text('Navigation')),
        Paragraph([
          Text('For navigation capabilities, Dawn provides the '),
          Code.inline('Navigator'),
          Text(' widget.'),
        ]),
        Heading.h3(Text('Routing')),
        ItemsList.unordered([
          Paragraph([
            Text('To navigate to a new route, you can use '),
            Code.inline('Navigation.pushRoute'),
            Text('.')
          ]),
          Paragraph([
            Text('To go back, you can call '),
            Code.inline('Navigation.pop'),
          ]),
        ]),
        Code.block(
          '''
import 'package:dawn/dawn.dart';

void main() => runApp(const Navigator(child: Page1()));

class Page1 extends StatelessWidget {
  const Page1({super.key, super.ref});

  @override
  Widget build(final BuildContext context) {
    return Text(
      'Page 1',
      onTap: (final details) => context.pushRoute(
        builder: (final context) => const Page2(),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key, super.ref});

  @override
  Widget build(final BuildContext context) {
    return Text('Page 2', onTap: (final details) => context.pop());
  }
}
''',
          language: ProgrammingLanguage.dart,
        ),
        Heading.h3(Text('Lazy Loading Routes')),
        Paragraph([
          Text('To lazy load a route, you can call '),
          Code.inline('Navigation.pushRouteLazily'),
          Text(' instead.'),
        ]),
        Code.block(
          '''
import 'package:dawn/dawn.dart';

import 'routes/route_one.dart' deferred as route_one;

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key, super.ref});

  @override
  Widget build(final BuildContext context) {
    return Navigator(
      child: Text(
        'Go to route one',
        onTap: (final details) => context.pushRouteLazily(
          loader: route_one.loadLibrary,
          builder: (final context) => route_one.RouteOne(),
        ),
      ),
    );
  }
}
''',
          language: ProgrammingLanguage.dart,
        ),
        Heading.h3(Text('Modals')),
        Paragraph([
          Text(
            "Modals are those widgets that push the state of browser's "
            "history when opened. They are also closed when the browser's "
            "back button is tapped or ",
          ),
          Code.inline('Navigation.pop'),
          Text(' is called. Remember that '),
          Code.inline('Navigator'),
          Text(' should be constructed in your program.'),
        ]),
        Code.block(
          '''
import 'package:dawn/dawn.dart';

void main() => runApp(const Navigator(child: App()));

class App extends StatefulWidget {
  const App({super.key, super.ref});

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
          onTap: (final details) {
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
''',
          language: ProgrammingLanguage.dart,
        ),
        Heading.h2(Text('Theming')),
        Paragraph([
          Text(
            'Instead of using CSS variables, we recommend using the following '
            'patterns.',
          ),
        ]),
        Heading.h3(Text('Static Theming')),
        Paragraph([
          Text('For static theming, it is recommended to use the '),
          Code.inline('InheritedWidget'),
          Text(' class.'),
        ]),
        Code.block(
          '''
import 'package:dawn/dawn.dart';

void main() => runApp(const Theme(child: App()));

class Theme extends InheritedWidget {
  final String accentColor = 'red';

  const Theme({required super.child, super.key, super.ref});

  static Theme of(final BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<Theme>();

  @override
  bool updateShouldNotify(final Theme oldWidget) => true;
}

class App extends StatelessWidget {
  const App({super.key, super.ref});

  @override
  Widget build(final BuildContext context) {
    return Text(
      'Hello World',
      style: Style({'color': Theme.of(context).accentColor}),
    );
  }
}
''',
          language: ProgrammingLanguage.dart,
        ),
        Heading.h3(Text('Dynamic Theming')),
        Paragraph([
          Text(
            'For dynamic theming, it is recommended to create a store by '
            'extending the ',
          ),
          Code.inline('Store'),
          Text(' class, provide it in your root via the '),
          Code.inline('Provider'),
          Text(' widget, and consume its value via the '),
          Code.inline('ConsumerBuilder'),
          Text(' widget.'),
        ]),
        Code.block(
          '''
import 'package:dawn/dawn.dart';

final _theme = Theme()..initialize();

void main() => runApp(Provider(stores: [_theme], child: const App()));

class Theme extends Store {
  String accentColor = 'red';

  void toggleAccentColor() =>
      setState(() => accentColor = accentColor == 'red' ? 'blue' : 'red');
}

class App extends StatelessWidget {
  const App({super.key, super.ref});

  @override
  Widget build(final BuildContext context) {
    return ConsumerBuilder<Theme>((final context, final theme) {
      return Text(
        'Hello World!',
        style: Style({'color': theme.accentColor}),
        onTap: (final details) => theme.toggleAccentColor(),
      );
    });
  }
}
''',
          language: ProgrammingLanguage.dart,
        )
      ]),
    );
  }
}
