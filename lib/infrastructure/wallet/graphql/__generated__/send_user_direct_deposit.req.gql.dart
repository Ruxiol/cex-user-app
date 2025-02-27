// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/send_user_direct_deposit.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/send_user_direct_deposit.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/send_user_direct_deposit.var.gql.dart'
    as _i3;

part 'send_user_direct_deposit.req.gql.g.dart';

abstract class GsendUserDirectDepositReq
    implements
        Built<GsendUserDirectDepositReq, GsendUserDirectDepositReqBuilder>,
        _i1.OperationRequest<_i2.GsendUserDirectDepositData,
            _i3.GsendUserDirectDepositVars> {
  GsendUserDirectDepositReq._();

  factory GsendUserDirectDepositReq(
          [Function(GsendUserDirectDepositReqBuilder b) updates]) =
      _$GsendUserDirectDepositReq;

  static void _initializeBuilder(GsendUserDirectDepositReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'sendUserDirectDeposit',
    )
    ..executeOnListen = true;

  @override
  _i3.GsendUserDirectDepositVars get vars;
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
  _i2.GsendUserDirectDepositData? Function(
    _i2.GsendUserDirectDepositData?,
    _i2.GsendUserDirectDepositData?,
  )? get updateResult;
  @override
  _i2.GsendUserDirectDepositData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GsendUserDirectDepositData? parseData(Map<String, dynamic> json) =>
      _i2.GsendUserDirectDepositData.fromJson(json);

  static Serializer<GsendUserDirectDepositReq> get serializer =>
      _$gsendUserDirectDepositReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GsendUserDirectDepositReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GsendUserDirectDepositReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GsendUserDirectDepositReq.serializer,
        json,
      );
}
