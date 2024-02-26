import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/platform/platform_utils.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:http/http.dart' as https;

abstract class IGlobalActionsInterface {
  Future<GlobalConfigData> readGlobalConfig();
  Future<void> openLink({required String url});
}

class GlobalActionsGeneral extends IGlobalActionsInterface {
  GlobalActionsGeneral();

  @override
  Future<GlobalConfigData> readGlobalConfig() async {
    final String contents =
        await rootBundle.loadString('assets/config.json', cache: false);
    final Map<String, dynamic> urlApi = json.decode(contents);

    var globalConfigBox =
        await Hive.openBox<GlobalConfigData>(Constants.globalConfig);
    var userConfigBox =
        await Hive.openBox<UserConfigData>(Constants.userConfig);

    

    var debugConfig = '{"url":"dev.wizwiz.io","terms_and_conditions_url":"","google_auth":{"enabled":true,"client_id":"608998656846-j3mg02tkkto8hiv7e7udps6klv89hc6k.apps.googleusercontent.com"},"withTradingBalance":false,"enabled_trading_page":true,"enabledStaking":true,"enabledPhoneVerificationStep":false,"enabledReferrals":true,"enabledLoginCaptcha":true,"enabled_wallet_page":true,"enabled_non_custodial_exchange_page":true,"enabled_non_custodial_wallet_connect":false,"enabledBuySell":true,"orderBookMiddle":true,"enabledSpread":true,"withInstantBuy":true,"withInstantSell":true,"enabledSellWithdrawZeroBalance":true,"enabledSumSubKYC":true}';

    
    var url = Uri.parse("https://${urlApi['url']}/static/config.json");
    final responseConfigData = await https.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*'
      },
    );

  final configData = json.decode(responseConfigData.body);

  if (responseConfigData.statusCode == 200) {
    final configData = json.decode(responseConfigData.body);
    // Now configData contains the actual response from the API
    // Use configData as needed in your code
    print('Config data loaded successfully: $configData');
  } else {
    // Handle the error, e.g., log or show an error message
    print('Failed to load config data. Status code: ${responseConfigData.statusCode}');
    // You can add additional error handling here
    // For example, set default values or show an error message to the user
    final configData = json.decode(debugConfig);

    print('Using default config data: $configData');
  }


    final globalConfigData = GlobalConfigData(
      url: configData['url'],
      termsAndConditionsUrl: configData['terms_and_conditions_url'] ?? '',
      enabledNonCustodialWalletConnect:
          configData['enabled_non_custodial_wallet_connect'] ?? false,
      enabledTradingPage: configData['enabled_trading_page'] ?? true,
      googleAuthClientId: configData['google_auth']['client_id'] ?? '',
      enabledNonCustodialExchangePage:
          configData['enabled_non_custodial_exchange_page'] ?? false,
      withTradingBalance: configData['withTradingBalance'] ?? false,
      enabledBuySell: configData['enabledBuySell'] ?? true,
      enabledStaking: configData['enabledStaking'] ?? false,
      enabledPhoneVerificationStep:
          configData['enabledPhoneVerificationStep'] ?? false,
      enabledReferrals: configData['enabledReferrals'] ?? false,
      enabledLoginCaptcha: configData['enabledLoginCaptcha'] ?? true,
      orderBookMiddle: configData['orderBookMiddle'] ?? true,
      enabledSpread: configData['enabledSpread'] ?? true,
      withInstantBuy: configData['withInstantBuy'] ?? true,
      withInstantSell: configData['withInstantSell'] ?? true,
      enabledSellWithdrawZeroBalance:
          configData['enabledSellWithdrawZeroBalance'] ?? true,
    );
    var userData = UserConfigData(
      userId: null,
      token: null,
      selectedMarketId: null,
      userName: '',
    );

    await userConfigBox.add(userData);
    await globalConfigBox.add(globalConfigData);

    return globalConfigData;
  }

  @override
  Future<void> openLink({required String url}) async {
    PlatformUtils.openLink(url);
  }
}
