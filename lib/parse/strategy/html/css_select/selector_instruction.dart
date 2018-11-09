import 'dart:convert' show JsonEncoder;

import 'package:json_annotation/json_annotation.dart'
    show JsonSerializable, JsonKey;

part 'selector_instruction.g.dart';

/// Instruction on how to select the right HTML Node
@JsonSerializable(
  includeIfNull: false,
  nullable: false,
)
class SelectorInstruction {
  final String selector;
  final String attribute;
  @JsonKey(
    name: "alternate_attribute",
  )
  final String alternateAttribute;

  SelectorInstruction(
    this.selector,
    this.attribute,
    this.alternateAttribute,
  );

  factory SelectorInstruction.fromJson(Map<String, dynamic> json) =>
      _$SelectorInstructionFromJson(json);

  Map<String, dynamic> toJson() => _$SelectorInstructionToJson(this);

  @override
  String toString() => JsonEncoder.withIndent('  ').convert(this.toJson());
}
