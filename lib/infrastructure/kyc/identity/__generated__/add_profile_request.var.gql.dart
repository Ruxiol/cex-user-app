// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'add_profile_request.var.gql.g.dart';

abstract class GAddProfileVars
    implements Built<GAddProfileVars, GAddProfileVarsBuilder> {
  GAddProfileVars._();

  factory GAddProfileVars([Function(GAddProfileVarsBuilder b) updates]) =
      _$GAddProfileVars;

  String get first_name;
  String get last_name;
  String get birth;
  String get address;
  String get city;
  String get country;
  String get postcode;
  static Serializer<GAddProfileVars> get serializer =>
      _$gAddProfileVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAddProfileVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAddProfileVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAddProfileVars.serializer,
        json,
      );
}
