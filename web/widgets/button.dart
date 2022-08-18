import 'package:dawn/dawn.dart';

class Button extends StatefulWidget {
  final String value;
  final bool solid;
  final EventListener? onTap;

  const Button(this.value, {this.solid = false, this.onTap, super.key});

  @override
  State createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  late String _backgroundOpacity = '0';

  @override
  Widget build(final BuildContext context) {
    return Container(
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
            'opacity': _backgroundOpacity,
            'transition': 'opacity 300ms cubic-bezier(0.4, 0, 0.2, 1)',
          }),
        ),
        Text(widget.value),
      ],
      style: Style({
        'position': 'relative',
        'overflow': 'hidden',
        'min-width': 'max-content',
        'width': '100%',
        'padding': '8px 16px',
        'color': widget.solid ? '#1d2737' : 'white',
        'background': widget.solid ? 'white' : 'transparent',
        'pointer-events': widget.onTap == null ? 'none' : 'all',
        'opacity': widget.onTap == null ? '0.64' : '1',
        'user-select': 'none',
        'cursor': 'pointer',
        'border-radius': '10000px',
        'font-size': '14px',
        'font-variation-settings': '"wght" 700',
        'height': 'max-content',
      }),
      onTap: widget.onTap,
      onPointerLeave: (final event) => setState(() => _backgroundOpacity = '0'),
      onPointerUp: (final event) => setState(() => _backgroundOpacity = '0.08'),
      onPointerEnter: (final event) => setState(() {
        _backgroundOpacity = '0.08';
      }),
      onPointerDown: (final event) => setState(() {
        _backgroundOpacity = '0.16';
      }),
      animation: const Animation(
        keyframes: [
          Keyframe(
            offset: 0,
            style: Style({'opacity': '0', 'transform': 'rotateX(-90deg)'}),
          ),
          Keyframe(
            offset: 1,
            style: Style({'opacity': '1', 'transform': 'rotateX(0deg)'}),
          )
        ],
        duration: Duration(milliseconds: 300),
        easing: Easing(0.4, 0, 0.2, 1),
        startDelay: Duration(milliseconds: 300),
        fillMode: AnimationFillMode.both,
      ),
    );
  }
}
