// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_deposit_wallet_payment_interface.var.gql.g.dart';

abstract class GGetDepositWalletPaymentInterfaceVars
    implements
        Built<GGetDepositWalletPaymentInterfaceVars,
            GGetDepositWalletPaymentInterfaceVarsBuilder> {
  GGetDepositWalletPaymentInterfaceVars._();

  factory GGetDepositWalletPaymentInterfaceVars(
          [Function(GGetDepositWalletPaymentInterfaceVarsBuilder b) updates]) =
      _$GGetDepositWalletPaymentInterfaceVars;

  String get id;
  static Serializer<GGetDepositWalletPaymentInterfaceVars> get serializer =>
      _$gGetDepositWalletPaymentInterfaceVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetDepositWalletPaymentInterfaceVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetDepositWalletPaymentInterfaceVars? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetDepositWalletPaymentInterfaceVars.serializer,
        json,
      );
}
