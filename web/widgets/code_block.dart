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
        const Text(
          '',
          style: Style({
            'font-family': '"FiraCodeVF"',
            'font-variation-settings': '"wght" 500',
            'padding': '16px 32px',
            'font-size': '12px',
            'white-space': 'pre',
            'overflow': 'auto',
          }),
        ),
        Container(
          [
            Button(
              'Copy',
              onTap: (final event) =>
                  html.window.navigator.clipboard!.writeText(value),
            ),
          ],
          style: const Style({'align-self': 'end', 'padding': '16px'}),
        ),
      ],
      style: const Style({
        'display': 'flex',
        'flex-flow': 'column',
        'background': '#0f192a',
        'color': 'white',
        'border-radius': '16px',
        'width': 'calc(100% + 64px)',
        'margin-left': '-32px',
        'line-height': '20px',
        'overflow': 'hidden',
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
