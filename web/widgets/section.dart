import 'package:dawn/dawn.dart';

class Section extends StatelessWidget {
  final List<Widget> children;

  const Section(this.children, {super.key});

  @override
  Widget build(final BuildContext context) {
    return Container(
      children,
      style: const Style({
        'display': 'flex',
        'flex-flow': 'column',
        'gap': '16px',
      }),
    );
  }
}
