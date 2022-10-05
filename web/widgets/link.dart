import 'dart:html' as html;

import 'package:dawn/dawn.dart';

import 'theme.dart';

class Link extends PaintedWidget {
  final List<Widget> children;
  final String address;

  const Link({
    required this.children,
    required this.address,
    super.style,
    super.animation,
    super.onTap,
    super.onPointerDown,
    super.onPointerUp,
    super.onPointerEnter,
    super.onPointerLeave,
    super.onPointerMove,
    super.onPointerCancel,
    super.onPointerOver,
    super.onPointerOut,
    super.onMouseDown,
    super.onMouseUp,
    super.onMouseEnter,
    super.onMouseLeave,
    super.onMouseMove,
    super.onMouseOver,
    super.onMouseOut,
    super.onTouchStart,
    super.onTouchEnd,
    super.onTouchMove,
    super.onTouchCancel,
    super.key,
  });

  @override
  LinkNode createNode() => LinkNode(this);

  Widget build(final BuildContext context) {
    return ConsumerBuilder<Theme>((final context, final store) {
      return Container(
        children,
        style: Style({
          'color': store.secondaryColor.toString(),
          'display': 'contents',
        }),
      );
    });
  }
}

class LinkNode extends SingleChildPaintedNode<Link, html.AnchorElement> {
  LinkNode(super.widget) : super(element: html.AnchorElement());

  @override
  Widget get childWidget => widget.build(context);

  @override
  void initialize() {
    super.initialize();

    element
      ..href = widget.address
      ..target = '_blank';
  }
}
