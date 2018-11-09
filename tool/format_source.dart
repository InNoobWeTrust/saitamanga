import 'dart:io' show Process, stdout, stderr, Directory;

void main() {
  Process.start('dartfmt', [
    '-w',
    Directory.current.parent.absolute.path,
  ]).then((process) {
    stdout.addStream(process.stdout);
    stderr.addStream(process.stderr);
    process.exitCode.then(print);
  });
}
