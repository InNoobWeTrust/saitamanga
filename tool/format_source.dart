import 'dart:io' show Process, stdout, stderr;

void main() {
  Process.start('dartfmt', [
    '-w',
    '.',
  ]).then((process) {
    stdout.addStream(process.stdout);
    stderr.addStream(process.stderr);
    process.exitCode.then(print);
  });
}
