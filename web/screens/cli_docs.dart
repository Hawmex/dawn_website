import 'package:dawn/dawn.dart';

import '../widgets/button.dart';
import '../widgets/code.dart';
import '../widgets/content.dart';
import '../widgets/heading.dart';
import '../widgets/screen.dart';
import '../widgets/section.dart';
import '../widgets/top_bar.dart';

class CliDocs extends StatelessWidget {
  const CliDocs({super.key});

  @override
  Widget build(final BuildContext context) {
    return Screen([
      TopBar(
        title: 'CLI Docs',
        trailing: [
          Button('Back', onTap: (final event) => context.pop(), solid: true),
        ],
      ),
      const Content([
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
            Code('-h', inline: true),
            Text(', '),
            Code('--help', inline: true),
            Text(': Print this usage information.'),
          ]),
        ]),
        Section([
          Heading('Available Commands'),
          Text('Two main commands are provided.'),
          Container([
            Code('create [app_name]', inline: true),
            Text(': Sets up a new Dawn app.'),
          ]),
          Container([
            Code('compile', inline: true),
            Text(': Compiles '),
            Code('/web', inline: true),
            Text(' directory contents.'),
          ]),
        ]),
        Section([
          Heading('Compile Options'),
          Container([
            Text('The '),
            Code('compile', inline: true),
            Text(' command has several options available.'),
          ]),
          Container([
            Code('-m', inline: true),
            Text(', '),
            Code('--mode', inline: true),
            Text(': Compilation mode.'),
          ]),
          Container(
            [
              Container([
                Code('dev', inline: true),
                Text(' (default): Development mode.'),
              ]),
              Container([
                Code('prod', inline: true),
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
            Code('-s', inline: true),
            Text(', '),
            Code('--[no-]serve', inline: true),
            Text(': Run a local server.'),
          ]),
          Container([
            Code('-p', inline: true),
            Text(', '),
            Code('--port', inline: true),
            Text(': Local server port (defaults to '),
            Code('5500', inline: true),
            Text(').'),
          ]),
        ]),
        Section([
          Heading('Example'),
          Code('dawn compile --server --port 5501 --mode prod'),
          Text('Or:'),
          Code('dawn compile -s -p 5501 -m prod'),
        ]),
      ]),
    ]);
  }
}
