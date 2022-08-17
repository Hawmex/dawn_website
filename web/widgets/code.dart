import 'dart:html' as html;

import 'package:dawn/dawn.dart';
import 'package:js/js.dart';

import 'button.dart';

class Code extends StatelessWidget {
  final String value;
  final bool inline;

  const Code(this.value, {this.inline = false, super.key});

  @override
  CodeNode createNode() => CodeNode(this);

  @override
  Widget build(final BuildContext context) {
    if (inline) {
      return Text(
        value,
        style: const Style({
          'font-family': 'FiraCodeVF',
          'font-size': '12px',
          'background': '#0f192a',
          'font-variation-settings': '"wght" 500',
          'color': 'white',
          'padding': '2px 4px',
          'line-height': '20px',
          'width': 'max-content',
          'display': 'inline-block',
          'border-radius': '4px',
        }),
      );
    } else {
      return Container(
        [
          Text(
            value,
            style: const Style({
              'background': 'unset',
              'font-family': 'FiraCodeVF',
              'font-variation-settings': '"wght" 500',
              'font-size': '12px',
              'align-items': 'center',
              'white-space': 'pre',
              'overflow': 'auto',
            }),
          ),
          Container(
            [
              Button(
                'Copy',
                onTap: (final event) {
                  html.window.navigator.clipboard!.writeText(value);
                },
              ),
            ],
            style: const Style({'align-self': 'end'}),
          ),
        ],
        style: const Style({
          'display': 'flex',
          'flex-flow': 'column',
          'gap': '16px',
          'padding': '16px',
          'background': '#0f192a',
          'color': 'white',
          'border-radius': '16px',
          'line-height': '20px',
        }),
      );
    }
  }
}

@JS('hljs.highlightElement')
external void _highlightElement(final html.Element element);

class CodeNode extends StatelessNode {
  CodeNode(super.widget);

  _highlight() {
    if (childNode is ContainerNode) {
      _highlightElement(
        ((childNode as ContainerNode).childNodes.first as TextNode).element
          ..className = 'language-dart',
      );
    }
  }

  @override
  void initialize() {
    super.initialize();
    _highlight();
  }

  @override
  void didWidgetUpdate(final StatelessWidget oldWidget) {
    super.didWidgetUpdate(oldWidget);
    _highlight();
  }
}
