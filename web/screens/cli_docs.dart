import 'package:dawn/dawn.dart';

import '../utils/syntax_highlighting.dart';
import '../widgets/code_block.dart';
import '../widgets/content.dart';
import '../widgets/heading.dart';
import '../widgets/inline_code.dart';
import '../widgets/screen.dart';
import '../widgets/section.dart';
import '../widgets/top_bar.dart';

class CliDocs extends StatelessWidget {
  const CliDocs({super.key});

  @override
  Widget build(final BuildContext context) {
    return const Screen([
      TopBar(title: 'CLI Docs'),
      Content([
        Section([
          Heading('Introduction'),
          Text(
            'Dawn CLI provides the basic commands needed to create, '
            'develop, and compile your Dawn app.',
          ),
        ]),
        Section([
          Heading('Global Options'),
          Text('These options are globally available in the Dawn CLI.'),
          Container([
            InlineCode('-h'),
            Text(', '),
            InlineCode('--help'),
            Text(': Print this usage information.'),
          ]),
        ]),
        Section([
          Heading('Available Commands'),
          Text('Two main commands are provided.'),
          Container([
            InlineCode('create <app_name>'),
            Text(': Sets up a new Dawn app.'),
          ]),
          Container([
            InlineCode('compile'),
            Text(': Compiles '),
            InlineCode('/web'),
            Text(' directory contents.'),
          ]),
        ]),
        Section([
          Heading('Compile Options'),
          Container([
            Text('The '),
            InlineCode('compile'),
            Text(' command has several options available.'),
          ]),
          Container([
            InlineCode('-m'),
            Text(', '),
            InlineCode('--mode'),
            Text(': Compilation mode.'),
          ]),
          Container(
            [
              Container([
                InlineCode('dev'),
                Text(' (default): Development mode.'),
              ]),
              Container([
                InlineCode('prod'),
                Text(': Production mode.'),
              ]),
            ],
            style: Style({
              'display': 'flex',
              'flex-flow': 'column',
              'padding-left': '32px',
              'gap': '8px'
            }),
          ),
          Container([
            InlineCode('-s'),
            Text(', '),
            InlineCode('--[no-]serve'),
            Text(': Run a local server.'),
          ]),
          Container([
            InlineCode('-p'),
            Text(', '),
            InlineCode('--port'),
            Text(': Local server port (defaults to '),
            InlineCode('5500'),
            Text(').'),
          ]),
        ]),
        Section([
          Heading('Example'),
          CodeBlock(
            'dawn compile --serve --port 5501 --mode prod',
            language: Language.powershell,
          ),
          Text('Or:'),
          CodeBlock(
            'dawn compile -s -p 5501 -m prod',
            language: Language.powershell,
          ),
        ]),
      ]),
    ]);
  }
}
