import 'package:dawn/dawn.dart';

class Screen extends StatelessWidget {
  final List<Widget> children;

  const Screen(this.children, {super.key});

  @override
  Widget build(final BuildContext context) {
    return Container(
      children,
      style: const Style({
        'min-height': '100vh',
        'display': 'grid',
        'grid-template-rows': 'max-content 1fr',
        'overflow': 'hidden',
        'background': '#1d2737',
        'color': '#1d2737',
      }),
    );
  }
}
