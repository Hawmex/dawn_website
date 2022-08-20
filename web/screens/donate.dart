import 'package:dawn/dawn.dart';

import '../widgets/code_block.dart';
import '../widgets/content.dart';
import '../widgets/heading.dart';
import '../widgets/inline_code.dart';
import '../widgets/screen.dart';
import '../widgets/section.dart';
import '../widgets/top_bar.dart';

class Donate extends StatelessWidget {
  const Donate({super.key});

  @override
  Widget build(final BuildContext context) {
    return const Screen([
      TopBar(title: 'Donate'),
      Content([
        Section([Heading('Support Me In Developing Dawn')]),
        Section([
          Container([InlineCode('BTC'), Text(' address:')]),
          CodeBlock('bc1qsrzrs5ajewzgq6vk2ruhu8l774udspnpdqd8w2'),
        ]),
        Section([
          Container([InlineCode('ETH'), Text(' address:')]),
          CodeBlock('0x421B7049B17D3a85Ed7501D9FBd2eb3bEFA7b39e'),
        ]),
        Section([
          Container([InlineCode('USDT (TRC20)'), Text(' address:')]),
          CodeBlock('TEdM59aYLxpZhXd26Smeg7TccPouzcoZ13'),
        ]),
        Section([
          Container([InlineCode('USDT (ERC20)'), Text(' address:')]),
          CodeBlock('0x421B7049B17D3a85Ed7501D9FBd2eb3bEFA7b39e'),
        ]),
      ]),
    ]);
  }
}
