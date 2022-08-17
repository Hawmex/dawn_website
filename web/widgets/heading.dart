import 'package:dawn/dawn.dart';

class Heading extends StatelessWidget {
  final String value;

  const Heading(this.value, {super.key});

  @override
  Widget build(final BuildContext context) {
    return Text(
      value,
      style: const Style({
        'font-size': '20px',
        'font-variation-settings': '"wght" 600',
      }),
    );
  }
}
