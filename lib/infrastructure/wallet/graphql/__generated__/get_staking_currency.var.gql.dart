// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_staking_currency.var.gql.g.dart';

abstract class GGetStakingCurrencyVars
    implements Built<GGetStakingCurrencyVars, GGetStakingCurrencyVarsBuilder> {
  GGetStakingCurrencyVars._();

  factory GGetStakingCurrencyVars(
          [Function(GGetStakingCurrencyVarsBuilder b) updates]) =
      _$GGetStakingCurrencyVars;

  String get id;
  static Serializer<GGetStakingCurrencyVars> get serializer =>
      _$gGetStakingCurrencyVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetStakingCurrencyVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetStakingCurrencyVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetStakingCurrencyVars.serializer,
        json,
      );
}
