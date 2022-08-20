import 'package:dawn/dawn.dart';

class Divider extends StatelessWidget {
  const Divider({super.key});

  @override
  Widget build(final BuildContext context) {
    return const Container(
      [],
      style: Style({
        'height': '1px',
        'width': '100%',
        'background': 'rgb(255 255 255 / 0.08)'
      }),
    );
  }
}
