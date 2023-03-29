import 'package:dawn/dawn.dart';

class Heading extends StatelessWidget {
  final Widget child;
  final int level;

  const Heading.h1(this.child, {super.key, super.ref}) : level = 1;
  const Heading.h2(this.child, {super.key, super.ref}) : level = 2;
  const Heading.h3(this.child, {super.key, super.ref}) : level = 3;
  const Heading.h4(this.child, {super.key, super.ref}) : level = 4;
  const Heading.h5(this.child, {super.key, super.ref}) : level = 5;
  const Heading.h6(this.child, {super.key, super.ref}) : level = 6;

  @override
  Widget build(final BuildContext context) {
    return Container(
      [child],
      style: Style({
        'font-size': '${2 * (7 - level) + 16}px',
        'line-height': '1.5',
        'font-variation-settings': '"wght" ${40 * (7 - level) + 360}',
        'display': 'block',
        'margin-block-start': '${2 * (7 - level) + 4}px',
      }),
    );
  }
}
