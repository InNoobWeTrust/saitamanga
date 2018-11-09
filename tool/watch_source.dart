import 'dart:io' show Process, stdout, stderr;

void main() {
  Process.start(
    'pub',
    [
      'run',
      'build_runner',
      'watch',
      '--delete-conflicting-outputs',
      '--low-resources-mode',
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
