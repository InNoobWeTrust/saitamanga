class Option {
  final Set<String> inputLabels;
  final Map<String, Map<String, String>> singleOptions;
  final Map<String, Map<String, String>> multipleOptions;

  Map<String, String> _input = new Map<String, String>();
  Map<String, int> _singleChoice = new Map<String, int>();
  Map<String, Set<int>> _multipleChoices = new Map<String, Set<int>>();
}
