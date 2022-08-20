import 'package:dawn/dawn.dart';

class InlineCode extends StatelessWidget {
  final String value;

  const InlineCode(this.value, {super.key});

  @override
  Widget build(final BuildContext context) {
    return Text(
      value,
      style: const Style({
        'font-family': '"FiraCodeVF"',
        'font-size': '12px',
        'line-height': '16px',
        'background': '#0f192a',
        'font-variation-settings': '"wght" 500',
        'color': 'white',
        'white-space': 'nowrap',
        'padding': '4px 8px',
        'width': 'max-content',
        'border-radius': '8px',
      }),
    );
  }
}
