import 'package:dawn/dawn.dart';

class Paragraph extends StatelessWidget {
  final List<Widget> children;

  const Paragraph(this.children, {super.key});

  @override
  Widget build(final BuildContext context) => Container(children);
}
