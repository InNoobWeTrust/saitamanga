class Option {
  final Set<String> inputLabels;
  final Map<String, Map<String, String>> singleOptions;
  final Map<String, Map<String, String>> multipleOptions;

  Map<String, String> _inputs = new Map<String, String>();
  Map<String, String> get inputs => _inputs;
  Map<String, int> _singleChoices = new Map<String, int>();
  Map<String, int> get singleChoices => _singleChoices;
  Map<String, Set<int>> _multipleChoices = new Map<String, Set<int>>();
  Map<String, Set<int>> get multipleChoices => _multipleChoices;

  Option({this.inputLabels, this.singleOptions, this.multipleOptions});

  void _checkKeys(Iterable<String> acceptableKeys, Iterable<String> keys) {
    switch (keys.length > acceptableKeys.length) {
      case true:
        throw Exception('Unaccepted labels: more labels than expected!');
        break;
      default:
        Iterable unknownKeys =
            keys.where((key) => !acceptableKeys.contains(key));
        if (unknownKeys.isNotEmpty)
          throw Exception('Unknown label(s): ${unknownKeys.toString()}');
        break;
    }
  }

  void _checkChoices(Map<String, Map> optionMap, Map<String, dynamic> choices) {
    switch (choices.values.first.runtimeType) {
      case int:
        MapEntry firstNegative = choices.entries.firstWhere(
            (entry) => (entry.value as int) < 0,
            orElse: () => null);
        if (firstNegative != null)
          throw Exception('Choices contain negative value(s)');
        for (MapEntry<String, int> choice in choices.entries) {
          if (choice.value >= optionMap[choice.key].length)
            throw Exception('Invalid choice, out of range: $choice');
        }
        break;
      case Set:
        MapEntry firstNegative = choices.entries.firstWhere(
            (entry) =>
                (entry.value as Set<int>).any((choiceNum) => choiceNum <= 0),
            orElse: () => null);
        if (firstNegative != null)
          throw Exception('Choices contain negative value(s)');
        for (MapEntry<String, Set<int>> choiceSet in choices.entries) {
          int length = optionMap[choiceSet.key].length;
          if (choiceSet.value.any((choiceNum) => choiceNum >= length))
            throw Exception('Invalid choices, out of range: $choiceSet');
        }
        break;
      default:
        throw Exception('Wrong usage of _checkChoices() function');
    }
  }

  Option setInputs(Map<String, String> inputs) {
    if (this.inputLabels == null) throw Exception('inputLabels not yet set!');
    _checkKeys(this.inputLabels, inputs.keys);
    return this.._inputs = inputs;
  }

  Option setInput(String name, String input) => setInputs({name: input});

  Option setSingleChoices(Map<String, int> singleChoices) {
    if (this.singleOptions == null)
      throw Exception('singleOptions not yet set!');
    _checkKeys(this.singleOptions.keys, singleChoices.keys);
    _checkChoices(this.singleOptions, singleChoices);
    return this.._singleChoices = singleChoices;
  }

  Option setSingleChoice(String name, int choice) =>
      setSingleChoices({name: choice});

  Option setMultipleChoices(Map<String, Set<int>> multipleChoices) {
    if (this.multipleOptions == null)
      throw Exception('multipleOptions not yet set!');
    _checkKeys(this.multipleOptions.keys, multipleChoices.keys);
    _checkChoices(this.multipleOptions, multipleChoices);
    return this.._multipleChoices = multipleChoices;
  }

  Option setMultipleChoice(String name, Set<int> choices) =>
      setMultipleChoices({name: choices});
}
