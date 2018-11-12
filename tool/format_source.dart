import 'dart:io' show Process, stdout, stderr, Directory, Platform;

void main() async {
  await Process.start(
    'dartfmt',
    [
      '-w',
      '--fix',
      Directory.fromUri(Platform.script).parent.parent.absolute.path
    ],
  ).then(
    (process) {
      stdout.addStream(process.stdout);
      stderr.addStream(process.stderr);
      process.exitCode.then(
        print,
      );
    },
  );
}
