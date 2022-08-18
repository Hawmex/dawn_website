import 'dart:html' as html;

import 'package:dawn/dawn.dart';

import '../utils/syntax_highlighting.dart';
import 'button.dart';

class CodeBlock extends StatelessWidget {
  final String value;
  final Language language;

  const CodeBlock(this.value, {this.language = Language.none, super.key});

  @override
  CodeBlockNode createNode() => CodeBlockNode(this);

  @override
  Widget build(final BuildContext context) {
    return Container(
      [
        Text(
          language != Language.none ? '' : value,
          style: const Style({
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
        'max-height': 'calc(100vh - 64px)',
        'line-height': '20px',
      }),
    );
  }
}

class CodeBlockNode extends StatelessNode {
  CodeBlockNode(super.widget);

  void _highlight() {
    highlightElement(
      ((childNode as ContainerNode).childNodes.first as TextNode).element,
      code: (widget as CodeBlock).value,
      language: (widget as CodeBlock).language,
    );
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
