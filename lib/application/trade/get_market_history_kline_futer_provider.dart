import 'package:ferry/ferry.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/save_chart_time_state_notifire.dart';
import 'package:user_app/domain/trade/chart_request.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/get_wallet_history_kline.data.gql.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/get_wallet_history_kline.var.gql.dart';
import 'package:user_app/infrastructure/user/user_service.dart';

final getMarketHistoryKlineFutureProvider = FutureProvider.autoDispose.family<
    OperationResponse<GWalletHistoryKlineData, GWalletHistoryKlineVars>,
    ChartRequest>(
  (ref, request) async {
    IUserService service = UserService();

    final chartTimeStateWatch = ref.watch(chartTimeStateProvider);

    getDataNowWithSubtract(Duration subtractValue) {
      return DateTime.now()
              .subtract(subtractValue)
              .toUtc()
              .millisecondsSinceEpoch ~/
          1000;
    }

    timeFrom() {
      if (chartTimeStateWatch == '15m') {
        return getDataNowWithSubtract(const Duration(minutes: 15));
      } else if (chartTimeStateWatch == '1h') {
        return getDataNowWithSubtract(const Duration(hours: 1));
      } else if (chartTimeStateWatch == '1d') {
        return getDataNowWithSubtract(const Duration(days: 1));
      } else if (chartTimeStateWatch == '1w') {
        return getDataNowWithSubtract(const Duration(days: 7));
      } else if (chartTimeStateWatch == '1M') {
        return getDataNowWithSubtract(const Duration(days: 30));
      }
    }

    getInterval() {
      if (chartTimeStateWatch == '15m') {
        return '1m';
      } else if (chartTimeStateWatch == '1h') {
        return '5m';
      } else if (chartTimeStateWatch == '1d') {
        return '30m';
      } else if (chartTimeStateWatch == '1w') {
        return '2h';
      } else if (chartTimeStateWatch == '1M') {
        return '12h';
      }
    }

    OperationResponse<GWalletHistoryKlineData, GWalletHistoryKlineVars>
        marketKlineResponse = await service.getWalletHistoryKline(
      request.marketId,
      getInterval()!,
      timeFrom()!,
      DateTime.now().toUtc().millisecondsSinceEpoch ~/ 1000,
    );

    return marketKlineResponse;
  },
);
