import 'package:dawn/dawn.dart';

import '../utils/syntax_highlighting.dart';
import '../widgets/button.dart';
import '../widgets/code.dart';
import '../widgets/content.dart';
import '../widgets/heading.dart';
import '../widgets/items_list.dart';
import '../widgets/link.dart';
import '../widgets/paragraph.dart';
import '../widgets/screen.dart';
import 'cookbook.dart' deferred as cookbook;
import 'get_started.dart' deferred as get_started;

class Features extends StatelessWidget {
  const Features({super.key, super.ref});

  @override
  Widget build(final BuildContext context) {
    return Screen(
      drawerActiveItemIndex: 3,
      previous: Button.extendedNormalText(
        icon: 'chevron_left',
        text: 'Get Started',
        onTap: (final details) => context.pushRouteLazily(
          loader: get_started.loadLibrary,
          builder: (final context) => get_started.GetStarted(),
        ),
      ),
      next: Button.extendedSecondaryFilled(
        icon: 'chevron_right',
        text: 'Cookbook',
        onTap: (final details) => context.pushRouteLazily(
          loader: cookbook.loadLibrary,
          builder: (final context) => cookbook.Cookbook(),
        ),
      ),
      content: const Content([
        Heading.h1(Text('Features')),
        Paragraph([Text('What are the main features of Dawn?')]),
        Heading.h2(Text('JavaScript Interop')),
        Paragraph([
          Text('You can use '),
          Link(
            children: [Code.inline('js'), Text(' package')],
            address: 'https://pub.dev/packages/js',
          ),
          Text(
            ' to add JavaScript interoperability to your apps. For example '
            'this website is built with Dawn while PrismJS is used for syntax '
            'highlighting code samples.',
          ),
        ]),
        Heading.h2(Text('CLI')),
        Paragraph([
          Text(
            'As it is mentioned in the previous pages, Dawn provides a CLI to '
            'create your applications.',
          )
        ]),
        Heading.h2(Text('Essential And Unstyled Widgets')),
        Paragraph([
          Text(
            "Dawn provides the essential and unstyled widgets that a minimal "
            "project needs. You can create more complex widgets by combining and "
            "styling the essential ones. If you need to implement extra "
            "functionalities and unique behaviors, you can use Dawn's "
            "extensibility feature. We'll get to that later on this page.",
          ),
        ]),
        ItemsList.unordered([
          Code.inline('InheritedWidget'),
          Code.inline('StatelessWidget'),
          Code.inline('StatelessBuilder'),
          Code.inline('StatefulWidget'),
          Code.inline('StatefulBuilder'),
          Code.inline('FutureBuilder'),
          Code.inline('StreamBuilder'),
          Code.inline('ConsumerWidget'),
          Code.inline('ConsumerBuilder'),
          Code.inline('Provider'),
          Code.inline('Navigator'),
          Code.inline('Text'),
          Code.inline('Image'),
          Code.inline('Container'),
        ]),
        Heading.h2(Text('Styles')),
        Paragraph([
          Text('Dawn provides CSS styling via the '),
          Code.inline('Style'),
          Text(' constructor.')
        ]),
        Code.block(
          '''
import 'package:dawn/dawn.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key, super.ref});

  @override
  Widget build(final BuildContext context) {
    return const Text(
      'Hello World!',
      style: Style({
        'font-size': '24px',
        'font-weight': 'bold',
        'color': '#121212',
        'padding': '8px 16px',
      }),
    );
  }
}
''',
          language: ProgrammingLanguage.dart,
        ),
        Heading.h2(Text('Animations')),
        Paragraph([
          Text('Dawn has a built-in '),
          Code.inline('Animation'),
          Text(
            ' constructor that is implemented similar to CSS and JavaScript '
            'animations.',
          ),
        ]),
        Code.block(
          '''
import 'package:dawn/dawn.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key, super.ref});

  @override
  Widget build(final BuildContext context) {
    return const Text(
      'Hello World!',
      animation: Animation(
        keyframes: [
          Keyframe(offset: 0, style: Style({'opacity': '0'})),
          Keyframe(offset: 1, style: Style({'opacity': '1'}))
        ],
        duration: Duration(milliseconds: 300),
        startDelay: Duration.zero,
        endDelay: Duration.zero,
        easing: Easing.linear,
        direction: AnimationDirection.normal,
        fillMode: AnimationFillMode.none,
        iterations: 1,
      ),
    );
  }
}
''',
          language: ProgrammingLanguage.dart,
        ),
        Heading.h2(Text('Extensibility')),
        Paragraph([
          Text(
            'If you need to implement extra functionalities and unique behaviors '
            'for your widgets, you can create your custom ',
          ),
          Code.inline('Nodes'),
          Text(' and attach it to your widget by overriding the '),
          Code.inline('Widget.createNode'),
          Text(' method.'),
        ]),
        Code.block(
          '''
import 'dart:html' as html;

import 'package:dawn/dawn.dart';

class MyInput extends PaintedWidget {
  final String value;
  final EventCallback? onChange;

  const MyInput(this.value, {this.onChange, super.key, super.ref});

  @override
  MyInputNode createNode() => MyInputNode(this);
}

class MyInputNode extends ChildlessPaintedNode<MyInput, html.TextInputElement> {
  MyInputNode(super.widget) : super(element: html.TextInputElement());

  @override
  void initializeElement() {
    super.initializeElement();

    addEventSubscription(
      type: 'change',
      callback: widget.onChange,
      eventTransformer: (final html.Event event) => EventDetails(
        event,
        targetNode: this,
      ),
    );

    element.value = widget.value;
  }
}
''',
          language: ProgrammingLanguage.dart,
        )
      ]),
    );
  }
}
