import 'package:dawn/dawn.dart';

import '../utils/syntax_highlighting.dart';
import '../widgets/button.dart';
import '../widgets/code_block.dart';
import '../widgets/content.dart';
import '../widgets/heading.dart';
import '../widgets/inline_code.dart';
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
          Heading('First Of All, Why Dawn Exists'),
          Container([
            Text(
              'Flutter is great, especially its syntax and its concepts '
              'such as ',
            ),
            InlineCode('BuildContext'),
            Text(', '),
            InlineCode('StatelessWidget'),
            Text(', '),
            InlineCode('StatefulWidget'),
            Text(', '),
            InlineCode('State'),
            Text(
              ', etc. But it\'s considerably harder in terms of styling '
              'and development pace compared to HTML and CSS. So, Dawn is '
              'created to provide HTML rendering via Flutter semantics and '
              'styling it using CSS.',
            ),
          ]),
          Section([
            Heading('JavaScript Interoperability'),
            Container([
              Text(
                'This website is made with Dawn itself. However, code '
                'snippets use ',
              ),
              InlineCode('Prism.js'),
              Text(' for syntax highlighting.'),
            ]),
          ]),
        ]),
        Section([
          Heading('CLI'),
          Text(
            'Dawn comes with a CLI to help you create and compile your '
            'applications.',
          )
        ]),
        Section([
          Heading('Basic, Yet Useful Widgets'),
          Text('Dawn provides your favorite widgets and builders.'),
          InlineCode('InheritedWidget'),
          InlineCode('StatelessWidget'),
          InlineCode('StatefulWidget'),
          InlineCode('StatelessBuilder'),
          InlineCode('StatefulBuilder'),
          InlineCode('FutureBuilder'),
          InlineCode('StreamBuilder'),
          InlineCode('ConsumerBuilder'),
          InlineCode('Text'),
          InlineCode('Image'),
          InlineCode('Container'),
          InlineCode('Navigator'),
          InlineCode('Provider'),
        ]),
        Section([
          Heading('Styles'),
          Container([
            Text('Dawn uses CSS styling via '),
            InlineCode('Map<String, String>'),
            Text('.'),
          ]),
          CodeBlock(_stylingExample, language: Language.dart),
        ]),
        Section([
          Heading('Animations'),
          Text(
            'Dawn has a built-in animation system that comes with '
            'multiple parameters.',
          ),
          CodeBlock(_animationSample, language: Language.dart),
        ]),
        Section([
          Heading('Extensibility'),
          Text(
            'Dawn gives its users the ability to extend the '
            'framework and create their own low-level widgets.',
          ),
          CodeBlock(_extensibilityExample, language: Language.dart),
        ]),
      ]),
    ]);
  }
}
