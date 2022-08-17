import 'package:dawn/dawn.dart';

import '../widgets/button.dart';
import '../widgets/code.dart';
import '../widgets/content.dart';
import '../widgets/heading.dart';
import '../widgets/screen.dart';
import '../widgets/section.dart';
import '../widgets/top_bar.dart';

const _stylingExample = '''
// Example of using `Style`.

import 'package:dawn/dawn.dart';

class App extends StatelessWidget {
  const App({super.key});

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
''';

const _animationSample = '''
// Example of using `Animation`.

import 'package:dawn/dawn.dart';

class App extends StatelessWidget {
  const App({super.key});

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
''';

const _extensibilityExample = '''
// Example of creating a custom low-level widget.

import 'dart:html' as html;

import 'package:dawn/dawn.dart';

class MyInput extends PaintedWidget {
  final String value;
  final EventListener? onChange;

  const MyInput(this.value, {this.onChange, super.key});

  @override
  MyInputNode createNode() => MyInputNode(this);
}

class MyInputNode extends PaintedNode<MyInput, html.TextInputElement> {
  MyInputNode(super.widget) : super(element: html.TextInputElement());

  @override
  void initializeElement() {
    super.initializeElement();

    element
      ..addEventListener('change', widget.onChange)
      ..value = widget.value;
  }

  @override
  void disposeElement() {
    element.removeEventListener('change', widget.onChange);
    super.disposeElement();
  }
}
''';

class Features extends StatelessWidget {
  const Features({super.key});

  @override
  Widget build(final BuildContext context) {
    return Screen([
      TopBar(
        title: 'Features',
        trailing: [
          Button('Back', onTap: (final event) => context.pop(), solid: true),
        ],
      ),
      const Content([
        Section([
          Heading('Why Dawn Exists'),
          Container([
            Text(
              'Flutter is great, especially its syntax and its concepts '
              'such as ',
            ),
            Code('BuildContext', inline: true),
            Text(', '),
            Code('StatelessWidget', inline: true),
            Text(', '),
            Code('StatefulWidget', inline: true),
            Text(', '),
            Code('State', inline: true),
            Text(
              ', etc. But it\'s considerably harder in terms of styling '
              'and development pace compared to HTML and CSS. So, Dawn is '
              'created to provide HTML rendering via Flutter semantics and '
              'styling it using CSS.',
            ),
          ]),
        ]),
        Section([
          Heading('Basic, Yet Useful Widgets'),
          Text('Dawn provides your favorite widgets and builders.'),
          Code('InheritedWidget', inline: true),
          Code('StatelessWidget', inline: true),
          Code('StatefulWidget', inline: true),
          Code('StatelessBuilder', inline: true),
          Code('StatefulBuilder', inline: true),
          Code('FutureBuilder', inline: true),
          Code('StreamBuilder', inline: true),
          Code('ConsumerBuilder', inline: true),
          Code('Text', inline: true),
          Code('Image', inline: true),
          Code('Container', inline: true),
          Code('Navigator', inline: true),
          Code('Provider', inline: true),
        ]),
        Section([
          Heading('CLI'),
          Text(
            'Dawn comes with a CLI to help you create and compile your '
            'applications.',
          )
        ]),
        Section([
          Heading('Styles'),
          Container([
            Text('Dawn uses CSS styling via '),
            Code('Map<String, String>', inline: true),
            Text('.'),
          ]),
          Code(_stylingExample),
        ]),
        Section([
          Heading('Animations'),
          Text(
            'Dawn has a built-in animation system that comes with '
            'multiple parameters.',
          ),
          Code(_animationSample),
        ]),
        Section([
          Heading('Extensibility'),
          Text(
            'Dawn gives its users the ability to extend the '
            'framework and create their own low-level widgets.',
          ),
          Code(_extensibilityExample),
        ]),
      ]),
    ]);
  }
}
