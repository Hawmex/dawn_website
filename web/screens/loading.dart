import 'package:dawn/dawn.dart';

import '../widgets/content.dart';
import '../widgets/screen.dart';
import '../widgets/theme.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(final BuildContext context) {
    return ConsumerBuilder<Theme>((final context, final store) {
      return Screen(
        content: Content([
          Container(
            [],
            style: Style({
              'display': 'flex',
              'align-self': 'center',
              'margin': 'auto',
              'width': '48px',
              'height': '48px',
              'border-radius': '50%',
              'border': '4px solid transparent',
              'border-right-color': store.secondaryColor.toString(),
            }),
            animation: Animation(
              keyframes: const [
                Keyframe(
                  offset: 1,
                  style: Style({'transform': 'rotate(360deg)'}),
                )
              ],
              duration: store.longDuration,
              iterations: double.infinity,
            ),
          ),
        ]),
      );
    });
  }
}
