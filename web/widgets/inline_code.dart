import 'package:dawn/dawn.dart';

class InlineCode extends StatelessWidget {
  final String value;

  const InlineCode(this.value, {super.key});

  @override
  Widget build(final BuildContext context) {
    return Text(
      value,
      style: const Style({
        'font-family': 'FiraCodeVF',
        'font-size': '12px',
        'background': '#0f192a',
        'font-variation-settings': '"wght" 500',
        'color': 'white',
        'padding': '2px 4px',
        'line-height': '20px',
        'width': 'max-content',
        'display': 'inline-block',
        'border-radius': '4px',
      }),
    );
  }
}
