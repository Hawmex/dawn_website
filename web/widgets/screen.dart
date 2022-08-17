import 'package:dawn/dawn.dart';

class Screen extends StatelessWidget {
  final List<Widget> children;

  const Screen(this.children, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      children,
      style: const Style({
        'background': '#1d2737',
        'color': 'white',
        'min-height': '100vh',
        'display': 'flex',
        'overflow': 'hidden',
        'justify-content': 'space-between',
        'flex-flow': 'column',
        'align-items': 'center',
      }),
    );
  }
}
