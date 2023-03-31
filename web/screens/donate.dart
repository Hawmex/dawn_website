import 'package:dawn/dawn.dart';

import '../widgets/button.dart';
import '../widgets/code.dart';
import '../widgets/content.dart';
import '../widgets/heading.dart';
import '../widgets/paragraph.dart';
import '../widgets/screen.dart';
import 'cookbook.dart' deferred as cookbook;

class Donate extends StatelessWidget {
  const Donate({super.key, super.ref});

  @override
  Widget build(final BuildContext context) {
    return Screen(
      drawerActiveItemIndex: 5,
      previous: Button.extendedNormalText(
        icon: 'chevron_left',
        text: 'Cookbook',
        onTap: (final details) => Navigator.pushRouteLazily(
          loader: cookbook.loadLibrary,
          builder: (final context) => cookbook.Cookbook(),
        ),
      ),
      content: const Content([
        Heading.h1(Text('Donate')),
        Paragraph([Text('You can donate to support me in developing Dawn.')]),
        Heading.h6(Code.inline('BTC')),
        Code.block('bc1qsrzrs5ajewzgq6vk2ruhu8l774udspnpdqd8w2'),
        Heading.h6(Code.inline('ETH')),
        Code.block('0x421B7049B17D3a85Ed7501D9FBd2eb3bEFA7b39e'),
        Heading.h6(Code.inline('USDT (TRC20)')),
        Code.block('TEdM59aYLxpZhXd26Smeg7TccPouzcoZ13'),
        Heading.h6(Code.inline('USDT (ERC20)')),
        Code.block('0x421B7049B17D3a85Ed7501D9FBd2eb3bEFA7b39e'),
      ]),
    );
  }
}
