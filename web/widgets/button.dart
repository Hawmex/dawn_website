import 'package:dawn/dawn.dart';

import 'icon.dart';
import 'link.dart';
import 'theme.dart';

enum ButtonVariant {
  normalText,
  primaryText,
  secondaryText,
  primaryFilled,
  secondaryFilled,
  drawer,
  coloredDrawer,
  extendedNormalText,
  extendedPrimaryText,
  extendedSecondaryText,
  extendedPrimaryFilled,
  extendedSecondaryFilled,
}

class Button extends StatefulWidget {
  final String? icon;
  final String? text;
  final String? link;

  final EventCallback? onTap;

  final ButtonVariant variant;

  const Button.normalText({
    this.icon,
    this.text,
    this.onTap,
    this.link,
    super.key,
    super.ref,
  }) : variant = ButtonVariant.normalText;

  const Button.primaryText({
    this.icon,
    this.text,
    this.onTap,
    this.link,
    super.key,
    super.ref,
  }) : variant = ButtonVariant.primaryText;

  const Button.secondaryText({
    this.icon,
    this.text,
    this.onTap,
    this.link,
    super.key,
    super.ref,
  }) : variant = ButtonVariant.secondaryText;

  const Button.primaryFilled({
    this.icon,
    this.text,
    this.onTap,
    this.link,
    super.key,
    super.ref,
  }) : variant = ButtonVariant.primaryFilled;

  const Button.secondaryFilled({
    this.icon,
    this.text,
    this.onTap,
    this.link,
    super.key,
    super.ref,
  }) : variant = ButtonVariant.secondaryFilled;

  const Button.drawer({
    this.icon,
    this.text,
    this.onTap,
    this.link,
    super.key,
    super.ref,
  }) : variant = ButtonVariant.drawer;

  const Button.coloredDrawer({
    this.icon,
    this.text,
    this.onTap,
    this.link,
    super.key,
    super.ref,
  }) : variant = ButtonVariant.coloredDrawer;

  const Button.extendedNormalText({
    this.icon,
    this.text,
    this.onTap,
    this.link,
    super.key,
    super.ref,
  }) : variant = ButtonVariant.extendedNormalText;

  const Button.extendedPrimaryText({
    this.icon,
    this.text,
    this.onTap,
    this.link,
    super.key,
    super.ref,
  }) : variant = ButtonVariant.extendedPrimaryText;

  const Button.extendedSecondaryText({
    this.icon,
    this.text,
    this.onTap,
    this.link,
    super.key,
    super.ref,
  }) : variant = ButtonVariant.extendedSecondaryText;

  const Button.extendedPrimaryFilled({
    this.icon,
    this.text,
    this.onTap,
    this.link,
    super.key,
    super.ref,
  }) : variant = ButtonVariant.extendedPrimaryFilled;

  const Button.extendedSecondaryFilled({
    this.icon,
    this.text,
    this.onTap,
    this.link,
    super.key,
    super.ref,
  }) : variant = ButtonVariant.extendedSecondaryFilled;

  @override
  State createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  double _highlightOpacity = 0;

  String _getHighlightTransition(final Theme store) {
    final duration = store.shortDuration;
    final curve = store.standardCurve;

    return 'opacity ${duration.inMilliseconds}ms $curve';
  }

  String _getTransition(final Theme store) {
    final duration = store.shortDuration;
    final curve = store.standardCurve;
    final delay = store.shortDuration;

    return 'all ${duration.inMilliseconds}ms $curve ${delay.inMilliseconds}ms';
  }

  String get _flexFlow {
    switch (widget.variant) {
      case ButtonVariant.normalText:
      case ButtonVariant.primaryText:
      case ButtonVariant.secondaryText:
      case ButtonVariant.primaryFilled:
      case ButtonVariant.secondaryFilled:
      case ButtonVariant.drawer:
      case ButtonVariant.coloredDrawer:
        return 'row';
      case ButtonVariant.extendedNormalText:
      case ButtonVariant.extendedPrimaryText:
      case ButtonVariant.extendedSecondaryText:
      case ButtonVariant.extendedPrimaryFilled:
      case ButtonVariant.extendedSecondaryFilled:
        return 'column';
    }
  }

  String get _gap {
    switch (widget.variant) {
      case ButtonVariant.normalText:
      case ButtonVariant.primaryText:
      case ButtonVariant.secondaryText:
      case ButtonVariant.primaryFilled:
      case ButtonVariant.secondaryFilled:
        return '8px';
      case ButtonVariant.drawer:
      case ButtonVariant.coloredDrawer:
        return '12px';
      case ButtonVariant.extendedNormalText:
      case ButtonVariant.extendedPrimaryText:
      case ButtonVariant.extendedSecondaryText:
      case ButtonVariant.extendedPrimaryFilled:
      case ButtonVariant.extendedSecondaryFilled:
        return '16px';
    }
  }

  String get _padding {
    switch (widget.variant) {
      case ButtonVariant.normalText:
      case ButtonVariant.primaryText:
      case ButtonVariant.secondaryText:
        if (widget.text == null) {
          return '8px';
        } else if (widget.icon == null) {
          return '8px 12px';
        } else {
          return '8px 16px 8px 12px';
        }
      case ButtonVariant.primaryFilled:
      case ButtonVariant.secondaryFilled:
        if (widget.text == null) {
          return '8px';
        } else if (widget.icon == null) {
          return '8px 24px';
        } else {
          return '8px 24px 8px 16px';
        }
      case ButtonVariant.drawer:
      case ButtonVariant.coloredDrawer:
        return '16px';
      case ButtonVariant.extendedNormalText:
      case ButtonVariant.extendedPrimaryText:
      case ButtonVariant.extendedSecondaryText:
      case ButtonVariant.extendedPrimaryFilled:
      case ButtonVariant.extendedSecondaryFilled:
        return '24px';
    }
  }

  String _getTextColor(final Theme store) {
    switch (widget.variant) {
      case ButtonVariant.normalText:
      case ButtonVariant.extendedNormalText:
        return 'currentcolor';
      case ButtonVariant.drawer:
        return store.onSurfaceColor.toString();
      case ButtonVariant.primaryText:
      case ButtonVariant.extendedPrimaryText:
      case ButtonVariant.coloredDrawer:
        return store.primaryColor.toString();
      case ButtonVariant.secondaryText:
      case ButtonVariant.extendedSecondaryText:
        return store.secondaryColor.toString();
      case ButtonVariant.primaryFilled:
      case ButtonVariant.extendedPrimaryFilled:
        return store.onPrimaryColor.toString();
      case ButtonVariant.secondaryFilled:
      case ButtonVariant.extendedSecondaryFilled:
        return store.onSecondaryColor.toString();
    }
  }

  String _getBackgroundColor(final Theme store) {
    switch (widget.variant) {
      case ButtonVariant.normalText:
      case ButtonVariant.primaryText:
      case ButtonVariant.secondaryText:
      case ButtonVariant.extendedNormalText:
      case ButtonVariant.extendedPrimaryText:
      case ButtonVariant.extendedSecondaryText:
        return 'transparent';
      case ButtonVariant.drawer:
      case ButtonVariant.coloredDrawer:
        return store.surfaceColor.toString();
      case ButtonVariant.primaryFilled:
      case ButtonVariant.extendedPrimaryFilled:
        return store.primaryColor.toString();
      case ButtonVariant.secondaryFilled:
      case ButtonVariant.extendedSecondaryFilled:
        return store.secondaryColor.toString();
    }
  }

  String get _borderRadius {
    switch (widget.variant) {
      case ButtonVariant.normalText:
      case ButtonVariant.primaryText:
      case ButtonVariant.secondaryText:
      case ButtonVariant.primaryFilled:
      case ButtonVariant.secondaryFilled:
        return '20px';
      case ButtonVariant.drawer:
      case ButtonVariant.coloredDrawer:
        return '28px';
      case ButtonVariant.extendedNormalText:
      case ButtonVariant.extendedPrimaryText:
      case ButtonVariant.extendedSecondaryText:
      case ButtonVariant.extendedPrimaryFilled:
      case ButtonVariant.extendedSecondaryFilled:
        return '36px';
    }
  }

  String get _fontSize {
    switch (widget.variant) {
      case ButtonVariant.normalText:
      case ButtonVariant.primaryText:
      case ButtonVariant.secondaryText:
      case ButtonVariant.primaryFilled:
      case ButtonVariant.secondaryFilled:
      case ButtonVariant.drawer:
      case ButtonVariant.coloredDrawer:
        return '14px';
      case ButtonVariant.extendedNormalText:
      case ButtonVariant.extendedPrimaryText:
      case ButtonVariant.extendedSecondaryText:
      case ButtonVariant.extendedPrimaryFilled:
      case ButtonVariant.extendedSecondaryFilled:
        return '16px';
    }
  }

  @override
  Widget build(final BuildContext context) {
    return ConsumerBuilder<Theme>((final context, final store) {
      final child = Container(
        [
          Container(
            [],
            style: Style({
              'position': 'absolute',
              'top': '0px',
              'left': '0px',
              'width': '100%',
              'height': '100%',
              'pointer-events': 'none',
              'background': 'currentcolor',
              'opacity': '$_highlightOpacity',
              'transition': _getHighlightTransition(store),
            }),
          ),
          if (widget.icon != null) Icon(widget.icon!),
          if (widget.text != null)
            Text(
              widget.text!,
              style: Style({
                'font-size': _fontSize,
                'font-variation-settings': '"wght" 500',
                'line-height': '24px',
              }),
            ),
        ],
        onTap: widget.onTap,
        onPointerLeave: (final details) =>
            setState(() => _highlightOpacity = 0),
        onPointerUp: (final details) =>
            setState(() => _highlightOpacity = 0.08),
        onPointerEnter: (final details) => setState(
          () => _highlightOpacity = 0.08,
        ),
        onPointerDown: (final details) => setState(
          () => _highlightOpacity = 0.16,
        ),
        style: Style({
          'position': 'relative',
          'display': 'flex',
          'flex-flow': _flexFlow,
          'align-items': 'center',
          'gap': _gap,
          'min-width': 'max-content',
          'width': '100%',
          'height': 'max-content',
          'padding': _padding,
          'color': _getTextColor(store),
          'background': _getBackgroundColor(store),
          'user-select': 'none',
          'opacity': widget.onTap == null && widget.link == null ? '0.32' : '1',
          'pointer-events':
              widget.onTap == null && widget.link == null ? 'none' : 'all',
          'cursor': 'pointer',
          'border-radius': _borderRadius,
          'transition': _getTransition(store),
          'overflow': 'hidden',
        }),
        animation: Animation(
          keyframes: const [
            Keyframe(offset: 0, style: Style({'transform': 'scaleY(0)'})),
            Keyframe(offset: 1, style: Style({'transform': 'scaleY(1)'}))
          ],
          duration: store.shortDuration,
          easing: store.decelerationCurve,
          startDelay: store.shortDuration,
          fillMode: AnimationFillMode.both,
        ),
      );

      if (widget.link != null) {
        return Link(
          children: [child],
          address: widget.link!,
          style: const Style({'text-decoration': 'none'}),
        );
      } else {
        return child;
      }
    });
  }
}
