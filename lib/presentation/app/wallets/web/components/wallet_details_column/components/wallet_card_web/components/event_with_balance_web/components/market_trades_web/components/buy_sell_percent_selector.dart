import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/exchange/exchange_state_provider.dart';
import 'package:user_app/application/trade/market_percet_provider.dart';
import 'package:user_app/application/trade/tranding_tab_provider.dart';
import 'package:user_app/application/wallets/user_balances_state_notifier.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/market_trades_web/components/order_selector_item.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/rate_convert/create_order_convert.dart';

class BuySellPercentSelectorWeb extends HookConsumerWidget {
  const BuySellPercentSelectorWeb({
    super.key,
    required this.toControllerInitValue,
    required this.fromControllerInitValue,
    required this.active,
    required this.withTradingBalance,
  });

  final TextEditingController toControllerInitValue;
  final TextEditingController fromControllerInitValue;
  final ValueNotifier<bool> active;
  final bool withTradingBalance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final marketPercentState = ref.read(marketPercentProviderProvider.notifier);
    final marketPercentWatch = ref.watch(marketPercentProviderProvider);

    final exchangeDataWatch = ref.watch(exchangeStateNotifierProvider);
    var tradingTabWatch = ref.watch(tradingTabProvider);

    final userBalance = ref.watch(userBalancesStateNotifierProvider);

    var convertedValue = tradingTabWatch == 1
        ? createOrderConvert(
            market: exchangeDataWatch.activeMarket,
            currencyFrom: exchangeDataWatch.selectedFromCurrency.id,
            currencyTo: exchangeDataWatch.selectedToCurrency.id,
            amount: withTradingBalance
                ? userBalance
                    .firstWhere((element) =>
                        element.id == exchangeDataWatch.selectedFromCurrency.id)
                    .advancedTradingBalance!
                : (userBalance
                        .firstWhere((element) =>
                            element.id ==
                            exchangeDataWatch.selectedFromCurrency.id)
                        .advancedTradingBalance! +
                    userBalance
                        .firstWhere((element) =>
                            element.id ==
                            exchangeDataWatch.selectedFromCurrency.id)
                        .balance!),
          )
        : createOrderConvert(
            market: exchangeDataWatch.activeMarket,
            currencyFrom: exchangeDataWatch.selectedToCurrency.id,
            currencyTo: exchangeDataWatch.selectedFromCurrency.id,
            amount: withTradingBalance
                ? userBalance
                    .firstWhere((element) =>
                        element.id == exchangeDataWatch.selectedToCurrency.id)
                    .advancedTradingBalance!
                : (userBalance
                        .firstWhere((element) =>
                            element.id ==
                            exchangeDataWatch.selectedToCurrency.id)
                        .advancedTradingBalance! +
                    userBalance
                        .firstWhere((element) =>
                            element.id ==
                            exchangeDataWatch.selectedToCurrency.id)
                        .balance!),
          );

    double amountFrom = tradingTabWatch == 1
        ? convertedValue
        : (withTradingBalance
            ? userBalance
                .firstWhere((element) =>
                    element.id == exchangeDataWatch.selectedToCurrency.id)
                .advancedTradingBalance!
            : (userBalance
                    .firstWhere((element) =>
                        element.id == exchangeDataWatch.selectedToCurrency.id)
                    .balance! +
                userBalance
                    .firstWhere((element) =>
                        element.id == exchangeDataWatch.selectedToCurrency.id)
                    .advancedTradingBalance!));
    double amountTo = tradingTabWatch == 1
        ? (withTradingBalance
            ? userBalance
                .firstWhere((element) =>
                    element.id == exchangeDataWatch.selectedFromCurrency.id)
                .advancedTradingBalance!
            : (userBalance
                    .firstWhere((element) =>
                        element.id == exchangeDataWatch.selectedFromCurrency.id)
                    .balance! +
                userBalance
                    .firstWhere((element) =>
                        element.id == exchangeDataWatch.selectedFromCurrency.id)
                    .advancedTradingBalance!))
        : convertedValue;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Tooltip(
          message: 'Use 25% of available balance'.hardcoded,
          verticalOffset: -60.h,
          child: OrderSelectorItemWeb(
            title: '25%',
            onTap: () async {
              active.value = !active.value;
              marketPercentState.state = 1;
              if (tradingTabWatch == 1) {
                toControllerInitValue.text =
                    '≈ ${numberFormatWithPrecision(exchangeDataWatch.selectedFromCurrency.precision).format(amountTo * 0.25)}';

                fromControllerInitValue.text = (amountFrom * 0.25)
                    .toStringAsFixed(exchangeDataWatch
                        .activeMarket.trading_amount_precision);
              } else {
                fromControllerInitValue.text = (amountFrom * 0.25)
                    .toStringAsFixed(exchangeDataWatch
                        .activeMarket.trading_amount_precision);

                toControllerInitValue.text =
                    '≈ ${numberFormatWithPrecision(exchangeDataWatch.selectedFromCurrency.precision).format(amountTo * 0.25)}';
              }
            },
            active: marketPercentWatch == 1,
          ),
        ),
        Tooltip(
          message: 'Use 50% of available balance'.hardcoded,
          verticalOffset: -60.h,
          child: OrderSelectorItemWeb(
            title: '50%',
            onTap: () {
              active.value = !active.value;
              marketPercentState.state = 2;
              if (tradingTabWatch == 1) {
                toControllerInitValue.text =
                    '≈ ${numberFormatWithPrecision(exchangeDataWatch.selectedFromCurrency.precision).format(amountTo * 0.5)}';

                fromControllerInitValue.text = (amountFrom * 0.5)
                    .toStringAsFixed(exchangeDataWatch
                        .activeMarket.trading_amount_precision);
              } else {
                fromControllerInitValue.text = (amountFrom * 0.5)
                    .toStringAsFixed(exchangeDataWatch
                        .activeMarket.trading_amount_precision);

                toControllerInitValue.text =
                    '≈ ${numberFormatWithPrecision(exchangeDataWatch.selectedFromCurrency.precision).format(amountTo * 0.5)}';
              }
            },
            active: marketPercentWatch == 2,
          ),
        ),
        Tooltip(
          message: 'Use 75% of available balance'.hardcoded,
          verticalOffset: -60.h,
          child: OrderSelectorItemWeb(
            title: '75%',
            onTap: () {
              active.value = !active.value;
              marketPercentState.state = 3;
              if (tradingTabWatch == 1) {
                toControllerInitValue.text =
                    '≈ ${numberFormatWithPrecision(exchangeDataWatch.selectedFromCurrency.precision).format(amountTo * 0.75)}';

                fromControllerInitValue.text = (amountFrom * 0.75)
                    .toStringAsFixed(exchangeDataWatch
                        .activeMarket.trading_amount_precision);
              } else {
                fromControllerInitValue.text = (amountFrom * 0.75)
                    .toStringAsFixed(exchangeDataWatch
                        .activeMarket.trading_amount_precision);

                toControllerInitValue.text =
                    '≈ ${numberFormatWithPrecision(exchangeDataWatch.selectedFromCurrency.precision).format(amountTo * 0.75)}';
              }
            },
            active: marketPercentWatch == 3,
          ),
        ),
        Tooltip(
          message: 'Use all available balance'.hardcoded,
          verticalOffset: -60.h,
          child: OrderSelectorItemWeb(
            title: '100%',
            onTap: () {
              active.value = !active.value;
              marketPercentState.state = 4;

              if (tradingTabWatch == 1) {
                toControllerInitValue.text =
                    '≈ ${numberFormatWithPrecision(exchangeDataWatch.selectedFromCurrency.precision).format(amountTo * 1)}';

                fromControllerInitValue.text = (amountFrom * 1).toStringAsFixed(
                    exchangeDataWatch.activeMarket.trading_amount_precision);
              } else {
                fromControllerInitValue.text = (amountFrom * 1).toStringAsFixed(
                    exchangeDataWatch.activeMarket.trading_amount_precision);

                toControllerInitValue.text =
                    '≈ ${numberFormatWithPrecision(exchangeDataWatch.selectedFromCurrency.precision).format(amountTo * 1)}';
              }
            },
            active: marketPercentWatch == 4,
          ),
        ),
      ],
    );
  }
}
