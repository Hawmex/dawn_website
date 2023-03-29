import 'dart:html' as html;

import 'package:dawn/dawn.dart';

import '../utils/syntax_highlighting.dart';
import 'button.dart';
import 'theme.dart';

enum CodeVariant { inline, block }

class Code extends StatelessWidget {
  final String value;
  final ProgrammingLanguage language;
  final CodeVariant variant;

  const Code.inline(this.value, {super.key, super.ref})
      : language = ProgrammingLanguage.none,
        variant = CodeVariant.inline;

  const Code.block(
    this.value, {
    this.language = ProgrammingLanguage.none,
    super.key,
    super.ref,
  }) : variant = CodeVariant.block;

  @override
  CodeNode createNode() => CodeNode(this);

  @override
  Widget build(final BuildContext context) {
    switch (variant) {
      case CodeVariant.inline:
        return ConsumerBuilder<Theme>((final context, final store) {
          return Text(
            value,
            style: Style({
              'font-family': '"FiraCodeVF"',
              'font-size': '0.75em',
              'background': store.onSurfaceColor.withAlpha(0.12).toString(),
              'white-space': 'nowrap',
              'padding': '4px 8px',
              'width': 'max-content',
              'border-radius': '10000px',
              'direction': 'ltr',
              'display': 'inline-block',
            }),
          );
        });
      case CodeVariant.block:
        return Container(
          [
            const Container(
              [],
              style: Style({
                'font-family': '"FiraCodeVF"',
                'line-height': '20px',
                'padding': '18px 16px',
                'font-size': '12px',
                'white-space': 'pre',
                'overflow': 'auto',
              }),
            ),
            Container(
              [
                Button.normalText(
                  icon: 'content_copy',
                  onTap: (final details) =>
                      html.window.navigator.clipboard!.writeText(value),
                ),
              ],
              style: const Style({
                'margin-inline-start': 'auto',
                'padding': '8px',
              }),
            ),
          ],
          style: const Style({
            'display': 'flex',
            'flex-flow': 'row',
            'flex-wrap': 'wrap',
            'background': '#1e1e1e',
            'color': '#ffffff',
            'border-radius': '28px',
            'width': '100%',
            'overflow': 'hidden',
            'direction': 'ltr',
          }),
        );
    }
  }
}

class CodeNode extends StatelessNode<Code> {
  CodeNode(super.widget);

  void _highlight() {
    if (widget.variant == CodeVariant.block) {
      final childNode = this.childNode as ContainerNode;

      highlightContainer(
        (childNode.childNodes.first as ContainerNode).element,
        code: widget.value,
        language: widget.language,
      );
    }
  }

  @override
  void reassemble() {
    super.reassemble();
    _highlight();
  }

  @override
  void initialize() {
    super.initialize();
    _highlight();
  }
}
