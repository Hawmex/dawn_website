import 'package:dawn/dawn.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key});

  @override
  Widget build(final BuildContext context) {
    return const Container(
      [
        Container(
          [
            Container([], style: Style({'background': 'white'})),
            Container([]),
            Container([], style: Style({'background': 'white'})),
          ],
          style: Style({
            'display': 'grid',
            'grid-template-columns': '1fr 2fr 1fr',
            'width': '200%',
            'height': '100%',
          }),
          animation: Animation(
            keyframes: [
              Keyframe(
                offset: 0,
                style: Style({'transform': 'translateX(-100%)'}),
              ),
              Keyframe(
                offset: 1,
                style: Style({'transform': 'translateX(50%)'}),
              )
            ],
            duration: Duration(milliseconds: 2000),
            easing: Easing(0.4, 0, 0.2, 1),
            iterations: double.infinity,
          ),
        ),
      ],
      style: Style({
        'width': '100%',
        'overflow': 'hidden',
        'height': '4px',
      }),
    );
  }
}
