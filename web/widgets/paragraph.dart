import 'package:dawn/dawn.dart';

class Paragraph extends StatelessWidget {
  final List<Widget> children;

  const Paragraph(this.children, {super.key, super.ref});

  @override
  Widget build(final BuildContext context) => Container(children);
}
