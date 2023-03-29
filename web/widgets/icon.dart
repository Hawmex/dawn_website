import 'package:dawn/dawn.dart';

import 'theme.dart';

class Icon extends StatelessWidget {
  final String value;

  const Icon(this.value, {super.key, super.ref});

  @override
  Widget build(final BuildContext context) {
    return ConsumerBuilder<Theme>((final context, final store) {
      return Text(
        value,
        key: value,
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
        animation: Animation(
          keyframes: const [
            Keyframe(
              offset: 0,
              style: Style({'transform': 'rotateZ(-90deg)', 'opacity': '0'}),
            ),
            Keyframe(
              offset: 1,
              style: Style({'transform': 'rotateZ(0deg)', 'opacity': '1'}),
            ),
          ],
          duration: store.standardDuration,
          easing: store.decelerationCurve,
        ),
      );
    });
  }
}
