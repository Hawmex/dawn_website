import 'package:dawn/dawn.dart';

class Icon extends StatelessWidget {
  final String value;

  const Icon(this.value, {super.key});

  @override
  Widget build(final BuildContext context) {
    return Text(
      value,
      key: value,
      animation: const Animation(
        keyframes: [
          Keyframe(
            offset: 0,
            style: Style({'opacity': '0', 'transform': 'rotate(-90deg)'}),
          ),
          Keyframe(
            offset: 1,
            style: Style({'opacity': '1', 'transform': 'rotate(0deg)'}),
          ),
        ],
        duration: Duration(milliseconds: 300),
        easing: Easing(0.4, 0, 0.2, 1),
        startDelay: Duration(milliseconds: 300),
        fillMode: AnimationFillMode.both,
      ),
      style: const Style({
        'font-family': '"Material Symbols Outlined"',
        'font-weight': 'normal',
        'font-style': 'normal',
        'font-size': '24px',
        'line-height': '24px',
        'letter-spacing': 'normal',
        'text-transform': 'none',
        'display': 'inline-block',
        'white-space': 'nowrap',
        'word-wrap': 'normal',
        'direction': 'ltr',
        '-webkit-font-feature-settings': 'liga',
        '-webkit-font-smoothing': 'antialiased',
      }),
    );
  }
}
