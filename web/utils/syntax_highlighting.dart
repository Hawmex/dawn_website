import 'dart:html' as html;

import 'package:js/js.dart';

enum Language { none, dart, powershell }

@JS('Prism.highlight')
external dynamic _prismHighlight(
  final String code,
  final dynamic grammar,
  final String language,
);

@JS('Prism.languages.dart')
external dynamic _dart;

@JS('Prism.languages.powershell')
external dynamic _powershell;

void highlightContainer(
  final html.DivElement element, {
  required final String code,
  required final Language language,
}) {
  switch (language) {
    case Language.none:
      element.append(html.SpanElement()..text = code);
      break;
    case Language.dart:
      element.innerHtml = _prismHighlight(code, _dart, 'dart');
      break;
    case Language.powershell:
      element.innerHtml = _prismHighlight(code, _powershell, 'powershell');
      break;
  }
}
