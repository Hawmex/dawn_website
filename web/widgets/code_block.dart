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
            'padding': '32px',
            'font-size': '12px',
            'white-space': 'pre',
            'overflow': 'auto',
          }),
        ),
        Container(
          [
            Button(
              icon: 'content_copy',
              onTap: (final event) =>
                  html.window.navigator.clipboard!.writeText(value),
            ),
          ],
          style: const Style({
            'margin-inline-start': 'auto',
            'padding': '16px',
          }),
        ),
      ],
      style: const Style({
        'display': 'flex',
        'flex-flow': 'row',
        'flex-wrap': 'wrap',
        'background': '#0f192a',
        'color': 'white',
        'border-radius': '40px',
        'width': 'calc(100% + 64px)',
        'margin-inline': '-32px',
        'line-height': '20px',
        'overflow': 'hidden',
        'direction': 'ltr',
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
  void updateSubtree() {
    super.updateSubtree();
    _highlight();
  }

  @override
  void initialize() {
    super.initialize();
    _highlight();
  }
}
