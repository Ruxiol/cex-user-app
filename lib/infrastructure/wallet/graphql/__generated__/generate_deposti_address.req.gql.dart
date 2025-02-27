// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/generate_deposti_address.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/generate_deposti_address.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/generate_deposti_address.var.gql.dart'
    as _i3;

part 'generate_deposti_address.req.gql.g.dart';

abstract class GGenerateDepositAddressReq
    implements
        Built<GGenerateDepositAddressReq, GGenerateDepositAddressReqBuilder>,
        _i1.OperationRequest<_i2.GGenerateDepositAddressData,
            _i3.GGenerateDepositAddressVars> {
  GGenerateDepositAddressReq._();

  factory GGenerateDepositAddressReq(
          [Function(GGenerateDepositAddressReqBuilder b) updates]) =
      _$GGenerateDepositAddressReq;

  static void _initializeBuilder(GGenerateDepositAddressReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GenerateDepositAddress',
    )
    ..executeOnListen = true;

  @override
  _i3.GGenerateDepositAddressVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );

  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GGenerateDepositAddressData? Function(
    _i2.GGenerateDepositAddressData?,
    _i2.GGenerateDepositAddressData?,
  )? get updateResult;
  @override
  _i2.GGenerateDepositAddressData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGenerateDepositAddressData? parseData(Map<String, dynamic> json) =>
      _i2.GGenerateDepositAddressData.fromJson(json);

  static Serializer<GGenerateDepositAddressReq> get serializer =>
      _$gGenerateDepositAddressReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGenerateDepositAddressReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGenerateDepositAddressReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGenerateDepositAddressReq.serializer,
        json,
      );
}
