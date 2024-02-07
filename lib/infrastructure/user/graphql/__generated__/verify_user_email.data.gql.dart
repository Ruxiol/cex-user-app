// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'verify_user_email.data.gql.g.dart';

abstract class GVerifyEmailTokenData
    implements Built<GVerifyEmailTokenData, GVerifyEmailTokenDataBuilder> {
  GVerifyEmailTokenData._();

  factory GVerifyEmailTokenData(
          [Function(GVerifyEmailTokenDataBuilder b) updates]) =
      _$GVerifyEmailTokenData;

  static void _initializeBuilder(GVerifyEmailTokenDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get verifyEmail;
  static Serializer<GVerifyEmailTokenData> get serializer =>
      _$gVerifyEmailTokenDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GVerifyEmailTokenData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GVerifyEmailTokenData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GVerifyEmailTokenData.serializer,
        json,
      );
}
