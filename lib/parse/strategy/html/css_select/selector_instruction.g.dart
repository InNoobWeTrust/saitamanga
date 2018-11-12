// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selector_instruction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelectorInstruction _$SelectorInstructionFromJson(Map<String, dynamic> json) {
  return SelectorInstruction(json['selector'] as String,
      json['attribute'] as String, json['alternate_attribute'] as String);
}

Map<String, dynamic> _$SelectorInstructionToJson(
        SelectorInstruction instance) =>
    <String, dynamic>{
      'selector': instance.selector,
      'attribute': instance.attribute,
      'alternate_attribute': instance.alternateAttribute
    };
