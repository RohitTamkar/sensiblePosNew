import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => StartScreenWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => StartScreenWidget(),
          routes: [
            FFRoute(
              name: WelcomeScreenWidget.routeName,
              path: WelcomeScreenWidget.routePath,
              builder: (context, params) => WelcomeScreenWidget(),
            ),
            FFRoute(
              name: WiFiSettingWidget.routeName,
              path: WiFiSettingWidget.routePath,
              builder: (context, params) => WiFiSettingWidget(),
            ),
            FFRoute(
              name: SettingHomepageWidget.routeName,
              path: SettingHomepageWidget.routePath,
              builder: (context, params) => SettingHomepageWidget(),
            ),
            FFRoute(
              name: ResetDataWidget.routeName,
              path: ResetDataWidget.routePath,
              builder: (context, params) => ResetDataWidget(),
            ),
            FFRoute(
              name: CategoryReportWidget.routeName,
              path: CategoryReportWidget.routePath,
              builder: (context, params) => CategoryReportWidget(),
            ),
            FFRoute(
              name: SubscriptionNewWidget.routeName,
              path: SubscriptionNewWidget.routePath,
              builder: (context, params) => SubscriptionNewWidget(),
            ),
            FFRoute(
              name: ShiftEndNewWidget.routeName,
              path: ShiftEndNewWidget.routePath,
              builder: (context, params) => ShiftEndNewWidget(),
            ),
            FFRoute(
              name: BillReportNewWidget.routeName,
              path: BillReportNewWidget.routePath,
              builder: (context, params) => BillReportNewWidget(),
            ),
            FFRoute(
              name: AppSettingWidget.routeName,
              path: AppSettingWidget.routePath,
              builder: (context, params) => AppSettingWidget(),
            ),
            FFRoute(
              name: ReportScreenNewWidget.routeName,
              path: ReportScreenNewWidget.routePath,
              asyncParams: {
                'tax': getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => ReportScreenNewWidget(
                billDetails: params.getParam(
                  'billDetails',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'INVOICE'],
                ),
                doc: params.getParam(
                  'doc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftDetail: params.getParam(
                  'shiftDetail',
                  ParamType.JSON,
                ),
                tax: params.getParam<TaxMasterRecord>(
                  'tax',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: GSTReportWidget.routeName,
              path: GSTReportWidget.routePath,
              builder: (context, params) => GSTReportWidget(),
            ),
            FFRoute(
              name: PrintOptionsWidget.routeName,
              path: PrintOptionsWidget.routePath,
              builder: (context, params) => PrintOptionsWidget(),
            ),
            FFRoute(
              name: PaymentScreenWidget.routeName,
              path: PaymentScreenWidget.routePath,
              builder: (context, params) => PaymentScreenWidget(),
            ),
            FFRoute(
              name: SystemUpdateWidget.routeName,
              path: SystemUpdateWidget.routePath,
              builder: (context, params) => SystemUpdateWidget(),
            ),
            FFRoute(
              name: AddProductWidget.routeName,
              path: AddProductWidget.routePath,
              builder: (context, params) => AddProductWidget(),
            ),
            FFRoute(
              name: AddCustomerWidget.routeName,
              path: AddCustomerWidget.routePath,
              builder: (context, params) => AddCustomerWidget(),
            ),
            FFRoute(
              name: LoginPageSettingWidget.routeName,
              path: LoginPageSettingWidget.routePath,
              builder: (context, params) => LoginPageSettingWidget(),
            ),
            FFRoute(
              name: TodaySummerReportNewWidget.routeName,
              path: TodaySummerReportNewWidget.routePath,
              asyncParams: {
                'shift':
                    getDocList(['OUTLET', 'SHIFT'], ShiftRecord.fromSnapshot),
              },
              builder: (context, params) => TodaySummerReportNewWidget(
                shift: params.getParam<ShiftRecord>(
                  'shift',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: FsqrWidget.routeName,
              path: FsqrWidget.routePath,
              builder: (context, params) => FsqrWidget(
                json: params.getParam(
                  'json',
                  ParamType.JSON,
                ),
                orderId: params.getParam(
                  'orderId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ProductWiseReportWidget.routeName,
              path: ProductWiseReportWidget.routePath,
              builder: (context, params) => ProductWiseReportWidget(),
            ),
            FFRoute(
              name: BillWidget.routeName,
              path: BillWidget.routePath,
              builder: (context, params) => BillWidget(
                docRef: params.getParam(
                  'docRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'INVOICE'],
                ),
              ),
            ),
            FFRoute(
              name: TableScreenWidget.routeName,
              path: TableScreenWidget.routePath,
              builder: (context, params) => TableScreenWidget(),
            ),
            FFRoute(
              name: DayWiseShiftReportWidget.routeName,
              path: DayWiseShiftReportWidget.routePath,
              builder: (context, params) => DayWiseShiftReportWidget(),
            ),
            FFRoute(
              name: FullScreenQRWidget.routeName,
              path: FullScreenQRWidget.routePath,
              builder: (context, params) => FullScreenQRWidget(),
            ),
            FFRoute(
              name: FullScreenBillWidget.routeName,
              path: FullScreenBillWidget.routePath,
              builder: (context, params) => FullScreenBillWidget(),
            ),
            FFRoute(
              name: PrinterSelectionScreenWidget.routeName,
              path: PrinterSelectionScreenWidget.routePath,
              builder: (context, params) => PrinterSelectionScreenWidget(
                docHeaderRef: params.getParam(
                  'docHeaderRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'HEADER'],
                ),
              ),
            ),
            FFRoute(
              name: FSBillWidget.routeName,
              path: FSBillWidget.routePath,
              builder: (context, params) => FSBillWidget(),
            ),
            FFRoute(
              name: BarcodePrintingWidget.routeName,
              path: BarcodePrintingWidget.routePath,
              builder: (context, params) => BarcodePrintingWidget(),
            ),
            FFRoute(
              name: UpdateProductWidget.routeName,
              path: UpdateProductWidget.routePath,
              builder: (context, params) => UpdateProductWidget(
                productRef: params.getParam(
                  'productRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'PRODUCT'],
                ),
              ),
            ),
            FFRoute(
              name: EditCustomerWidget.routeName,
              path: EditCustomerWidget.routePath,
              builder: (context, params) => EditCustomerWidget(
                custRef: params.getParam(
                  'custRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'PARTY'],
                ),
              ),
            ),
            FFRoute(
              name: AppSettingNewWidget.routeName,
              path: AppSettingNewWidget.routePath,
              builder: (context, params) => AppSettingNewWidget(),
            ),
            FFRoute(
              name: LoadingScreenWidget.routeName,
              path: LoadingScreenWidget.routePath,
              asyncParams: {
                'appSettingDoc': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => LoadingScreenWidget(
                shiftDoc: params.getParam(
                  'shiftDoc',
                  ParamType.JSON,
                ),
                userDoc: params.getParam(
                  'userDoc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                appSettingDoc: params.getParam(
                  'appSettingDoc',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: DigitalOrderWidget.routeName,
              path: DigitalOrderWidget.routePath,
              builder: (context, params) => DigitalOrderWidget(),
            ),
            FFRoute(
              name: RegularAppSettingWidget.routeName,
              path: RegularAppSettingWidget.routePath,
              builder: (context, params) => RegularAppSettingWidget(),
            ),
            FFRoute(
              name: LoginPageWidget.routeName,
              path: LoginPageWidget.routePath,
              builder: (context, params) => LoginPageWidget(
                deviceDocId: params.getParam(
                  'deviceDocId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: EditBillWidget.routeName,
              path: EditBillWidget.routePath,
              asyncParams: {
                'appsetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
                'tax': getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => EditBillWidget(
                billRef: params.getParam(
                  'billRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'INVOICE'],
                ),
                appsetting: params.getParam(
                  'appsetting',
                  ParamType.Document,
                ),
                tax: params.getParam<TaxMasterRecord>(
                  'tax',
                  ParamType.Document,
                  isList: true,
                ),
                shift: params.getParam(
                  'shift',
                  ParamType.JSON,
                ),
              ),
            ),
            FFRoute(
              name: ImsInwardOutwardWidget.routeName,
              path: ImsInwardOutwardWidget.routePath,
              builder: (context, params) => ImsInwardOutwardWidget(),
            ),
            FFRoute(
              name: ImsProductionWidget.routeName,
              path: ImsProductionWidget.routePath,
              builder: (context, params) => ImsProductionWidget(),
            ),
            FFRoute(
              name: ProductAndListWidget.routeName,
              path: ProductAndListWidget.routePath,
              builder: (context, params) => ProductAndListWidget(
                billDetails: params.getParam(
                  'billDetails',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'INVOICE'],
                ),
                doc: params.getParam(
                  'doc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftDetails: params.getParam(
                  'shiftDetails',
                  ParamType.JSON,
                ),
              ),
            ),
            FFRoute(
              name: ImsServiceWidget.routeName,
              path: ImsServiceWidget.routePath,
              builder: (context, params) => ImsServiceWidget(),
            ),
            FFRoute(
              name: GoodsReceivedWidget.routeName,
              path: GoodsReceivedWidget.routePath,
              builder: (context, params) => GoodsReceivedWidget(),
            ),
            FFRoute(
              name: ImsOpeningStockWidget.routeName,
              path: ImsOpeningStockWidget.routePath,
              builder: (context, params) => ImsOpeningStockWidget(),
            ),
            FFRoute(
              name: StartScreenWidget.routeName,
              path: StartScreenWidget.routePath,
              builder: (context, params) => StartScreenWidget(),
            ),
            FFRoute(
              name: ProductSaleTestingWidget.routeName,
              path: ProductSaleTestingWidget.routePath,
              builder: (context, params) => ProductSaleTestingWidget(),
            ),
            FFRoute(
              name: CategorySaleReportWidget.routeName,
              path: CategorySaleReportWidget.routePath,
              builder: (context, params) => CategorySaleReportWidget(),
            ),
            FFRoute(
              name: OnboardingScreenWidget.routeName,
              path: OnboardingScreenWidget.routePath,
              builder: (context, params) => OnboardingScreenWidget(),
            ),
            FFRoute(
              name: ProductAndListWINWidget.routeName,
              path: ProductAndListWINWidget.routePath,
              builder: (context, params) => ProductAndListWINWidget(
                billDetails: params.getParam(
                  'billDetails',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'INVOICE'],
                ),
                doc: params.getParam(
                  'doc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftDetails: params.getParam(
                  'shiftDetails',
                  ParamType.JSON,
                ),
              ),
            ),
            FFRoute(
              name: WelcomeScreenNewWidget.routeName,
              path: WelcomeScreenNewWidget.routePath,
              builder: (context, params) => WelcomeScreenNewWidget(),
            ),
            FFRoute(
              name: LoginPageNewWidget.routeName,
              path: LoginPageNewWidget.routePath,
              builder: (context, params) => LoginPageNewWidget(
                billDetails: params.getParam(
                  'billDetails',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'INVOICE'],
                ),
                doc: params.getParam(
                  'doc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftDetails: params.getParam(
                  'shiftDetails',
                  ParamType.JSON,
                ),
              ),
            ),
            FFRoute(
              name: LoadingScreenNewWidget.routeName,
              path: LoadingScreenNewWidget.routePath,
              asyncParams: {
                'appSettingDoc': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => LoadingScreenNewWidget(
                shiftDoc: params.getParam(
                  'shiftDoc',
                  ParamType.JSON,
                ),
                userDoc: params.getParam(
                  'userDoc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                appSettingDoc: params.getParam(
                  'appSettingDoc',
                  ParamType.Document,
                ),
                outletRef: params.getParam(
                  'outletRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET'],
                ),
              ),
            ),
            FFRoute(
              name: ProductAndListNewWidget.routeName,
              path: ProductAndListNewWidget.routePath,
              asyncParams: {
                'taxcollection':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => ProductAndListNewWidget(
                billDetails: params.getParam(
                  'billDetails',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'INVOICE'],
                ),
                doc: params.getParam(
                  'doc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftDetails: params.getParam(
                  'shiftDetails',
                  ParamType.JSON,
                ),
                taxcollection: params.getParam<TaxMasterRecord>(
                  'taxcollection',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: UpdateProductNewWidget.routeName,
              path: UpdateProductNewWidget.routePath,
              builder: (context, params) => UpdateProductNewWidget(
                hivekey: params.getParam(
                  'hivekey',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: AddProductNewPosWidget.routeName,
              path: AddProductNewPosWidget.routePath,
              builder: (context, params) => AddProductNewPosWidget(),
            ),
            FFRoute(
              name: ShiftEndNew2Widget.routeName,
              path: ShiftEndNew2Widget.routePath,
              builder: (context, params) => ShiftEndNew2Widget(),
            ),
            FFRoute(
              name: EditBillNewWidget.routeName,
              path: EditBillNewWidget.routePath,
              builder: (context, params) => EditBillNewWidget(
                billRef: params.getParam(
                  'billRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'INVOICE'],
                ),
              ),
            ),
            FFRoute(
              name: PrintSettingkioskWidget.routeName,
              path: PrintSettingkioskWidget.routePath,
              builder: (context, params) => PrintSettingkioskWidget(),
            ),
            FFRoute(
              name: KioskPaymentWidget.routeName,
              path: KioskPaymentWidget.routePath,
              asyncParams: {
                'appsettings': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
                'taxcollection':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => KioskPaymentWidget(
                doc: params.getParam(
                  'doc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftdetails: params.getParam(
                  'shiftdetails',
                  ParamType.JSON,
                ),
                qrJson: params.getParam(
                  'qrJson',
                  ParamType.JSON,
                ),
                paytmOrderId: params.getParam(
                  'paytmOrderId',
                  ParamType.String,
                ),
                isPaytm: params.getParam(
                  'isPaytm',
                  ParamType.bool,
                ),
                appsettings: params.getParam(
                  'appsettings',
                  ParamType.Document,
                ),
                taxcollection: params.getParam<TaxMasterRecord>(
                  'taxcollection',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: KioskCartWidget.routeName,
              path: KioskCartWidget.routePath,
              asyncParams: {
                'appsetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
                'taxcollection':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => KioskCartWidget(
                doc: params.getParam(
                  'doc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftdetails: params.getParam(
                  'shiftdetails',
                  ParamType.JSON,
                ),
                appsetting: params.getParam(
                  'appsetting',
                  ParamType.Document,
                ),
                taxcollection: params.getParam<TaxMasterRecord>(
                  'taxcollection',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: BarcodePrintingCopyWidget.routeName,
              path: BarcodePrintingCopyWidget.routePath,
              builder: (context, params) => BarcodePrintingCopyWidget(),
            ),
            FFRoute(
              name: AboutUsWidget.routeName,
              path: AboutUsWidget.routePath,
              builder: (context, params) => AboutUsWidget(),
            ),
            FFRoute(
              name: KioskBillScreenWidget.routeName,
              path: KioskBillScreenWidget.routePath,
              asyncParams: {
                'appsetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
                'taxcollection':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => KioskBillScreenWidget(
                doc: params.getParam(
                  'doc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftdoc: params.getParam(
                  'shiftdoc',
                  ParamType.JSON,
                ),
                billdetails: params.getParam(
                  'billdetails',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'INVOICE'],
                ),
                appsetting: params.getParam(
                  'appsetting',
                  ParamType.Document,
                ),
                taxcollection: params.getParam<TaxMasterRecord>(
                  'taxcollection',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: DummytestWidget.routeName,
              path: DummytestWidget.routePath,
              builder: (context, params) => DummytestWidget(),
            ),
            FFRoute(
              name: DemoWidget.routeName,
              path: DemoWidget.routePath,
              builder: (context, params) => DemoWidget(),
            ),
            FFRoute(
              name: ImsDashboardCopyWidget.routeName,
              path: ImsDashboardCopyWidget.routePath,
              builder: (context, params) => ImsDashboardCopyWidget(),
            ),
            FFRoute(
              name: ResponsePageWidget.routeName,
              path: ResponsePageWidget.routePath,
              asyncParams: {
                'doc': getDoc(['OUTLET', 'QR_TRANSACTIONS'],
                    QrTransactionsRecord.fromSnapshot),
                'appsetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
                'taxcoollectipon':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => ResponsePageWidget(
                doc: params.getParam(
                  'doc',
                  ParamType.Document,
                ),
                shiftdetails: params.getParam(
                  'shiftdetails',
                  ParamType.JSON,
                ),
                appsetting: params.getParam(
                  'appsetting',
                  ParamType.Document,
                ),
                taxcoollectipon: params.getParam<TaxMasterRecord>(
                  'taxcoollectipon',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: KioskWelcomeWidget.routeName,
              path: KioskWelcomeWidget.routePath,
              builder: (context, params) => KioskWelcomeWidget(),
            ),
            FFRoute(
              name: KioskDineParcelWidget.routeName,
              path: KioskDineParcelWidget.routePath,
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
                'taxcollection':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => KioskDineParcelWidget(
                userdoc: params.getParam(
                  'userdoc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftdoc: params.getParam(
                  'shiftdoc',
                  ParamType.JSON,
                ),
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
                taxcollection: params.getParam<TaxMasterRecord>(
                  'taxcollection',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: KioskAdvertisingWidget.routeName,
              path: KioskAdvertisingWidget.routePath,
              asyncParams: {
                'appsetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
                'taxcollection':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => KioskAdvertisingWidget(
                userDoc: params.getParam(
                  'userDoc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftdoc: params.getParam(
                  'shiftdoc',
                  ParamType.JSON,
                ),
                appsetting: params.getParam(
                  'appsetting',
                  ParamType.Document,
                ),
                taxcollection: params.getParam<TaxMasterRecord>(
                  'taxcollection',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: KioskLoginWidget.routeName,
              path: KioskLoginWidget.routePath,
              builder: (context, params) => KioskLoginWidget(
                billDetails: params.getParam(
                  'billDetails',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'INVOICE'],
                ),
                doc: params.getParam(
                  'doc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftDetails: params.getParam(
                  'shiftDetails',
                  ParamType.JSON,
                ),
              ),
            ),
            FFRoute(
              name: KioskSplashScreenWidget.routeName,
              path: KioskSplashScreenWidget.routePath,
              builder: (context, params) => KioskSplashScreenWidget(),
            ),
            FFRoute(
              name: LoadingScreenkiosknewWidget.routeName,
              path: LoadingScreenkiosknewWidget.routePath,
              asyncParams: {
                'appSettingDoc': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => LoadingScreenkiosknewWidget(
                shiftDoc: params.getParam(
                  'shiftDoc',
                  ParamType.JSON,
                ),
                userDoc: params.getParam(
                  'userDoc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                appSettingDoc: params.getParam(
                  'appSettingDoc',
                  ParamType.Document,
                ),
                outletRef: params.getParam(
                  'outletRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET'],
                ),
              ),
            ),
            FFRoute(
              name: LabeltestWidget.routeName,
              path: LabeltestWidget.routePath,
              builder: (context, params) => LabeltestWidget(),
            ),
            FFRoute(
              name: KotOrderScreenWidget.routeName,
              path: KotOrderScreenWidget.routePath,
              asyncParams: {
                'appsetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => KotOrderScreenWidget(
                appsetting: params.getParam(
                  'appsetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: SplashScreenWindowsWidget.routeName,
              path: SplashScreenWindowsWidget.routePath,
              builder: (context, params) => SplashScreenWindowsWidget(),
            ),
            FFRoute(
              name: WindowsLoginWidget.routeName,
              path: WindowsLoginWidget.routePath,
              builder: (context, params) => WindowsLoginWidget(),
            ),
            FFRoute(
              name: TokenDisplayWidget.routeName,
              path: TokenDisplayWidget.routePath,
              builder: (context, params) => TokenDisplayWidget(),
            ),
            FFRoute(
              name: AppSettingNewPosWidget.routeName,
              path: AppSettingNewPosWidget.routePath,
              builder: (context, params) => AppSettingNewPosWidget(),
            ),
            FFRoute(
              name: MiniKioskDineParcelWidget.routeName,
              path: MiniKioskDineParcelWidget.routePath,
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
                'taxcollection':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => MiniKioskDineParcelWidget(
                userdoc: params.getParam(
                  'userdoc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftdoc: params.getParam(
                  'shiftdoc',
                  ParamType.JSON,
                ),
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
                taxcollection: params.getParam<TaxMasterRecord>(
                  'taxcollection',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: KioskDineParcelCopyWidget.routeName,
              path: KioskDineParcelCopyWidget.routePath,
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
                'taxcollection':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => KioskDineParcelCopyWidget(
                userdoc: params.getParam(
                  'userdoc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftdoc: params.getParam(
                  'shiftdoc',
                  ParamType.JSON,
                ),
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
                taxcollection: params.getParam<TaxMasterRecord>(
                  'taxcollection',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: MiniKioskTokenWidget.routeName,
              path: MiniKioskTokenWidget.routePath,
              builder: (context, params) => MiniKioskTokenWidget(),
            ),
            FFRoute(
              name: MKPrinterSettingWidget.routeName,
              path: MKPrinterSettingWidget.routePath,
              builder: (context, params) => MKPrinterSettingWidget(),
            ),
            FFRoute(
              name: ResponsePageCopyWidget.routeName,
              path: ResponsePageCopyWidget.routePath,
              asyncParams: {
                'doc': getDoc(['OUTLET', 'QR_TRANSACTIONS'],
                    QrTransactionsRecord.fromSnapshot),
                'appsetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
                'taxcoollectipon':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => ResponsePageCopyWidget(
                doc: params.getParam(
                  'doc',
                  ParamType.Document,
                ),
                shiftdetails: params.getParam(
                  'shiftdetails',
                  ParamType.JSON,
                ),
                appsetting: params.getParam(
                  'appsetting',
                  ParamType.Document,
                ),
                taxcoollectipon: params.getParam<TaxMasterRecord>(
                  'taxcoollectipon',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: PhonePeQrWidget.routeName,
              path: PhonePeQrWidget.routePath,
              builder: (context, params) => PhonePeQrWidget(
                data: params.getParam(
                  'data',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: BillingGroceryNewWidget.routeName,
              path: BillingGroceryNewWidget.routePath,
              asyncParams: {
                'taxDetails':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
                'paymentMode': getDocList(
                    ['PAYMENT_MODE'], PaymentModeRecord.fromSnapshot),
              },
              builder: (context, params) => BillingGroceryNewWidget(
                shiftdetail: params.getParam(
                  'shiftdetail',
                  ParamType.JSON,
                ),
                taxDetails: params.getParam<TaxMasterRecord>(
                  'taxDetails',
                  ParamType.Document,
                  isList: true,
                ),
                userref: params.getParam(
                  'userref',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                paymentMode: params.getParam<PaymentModeRecord>(
                  'paymentMode',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: KioskPaymentCopyWidget.routeName,
              path: KioskPaymentCopyWidget.routePath,
              builder: (context, params) => KioskPaymentCopyWidget(
                data: params.getParam(
                  'data',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: KioskChoosePaymentModeWidget.routeName,
              path: KioskChoosePaymentModeWidget.routePath,
              asyncParams: {
                'appSettings': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
                'taxcollection':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => KioskChoosePaymentModeWidget(
                doc: params.getParam(
                  'doc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftdetails: params.getParam(
                  'shiftdetails',
                  ParamType.JSON,
                ),
                appSettings: params.getParam(
                  'appSettings',
                  ParamType.Document,
                ),
                taxcollection: params.getParam<TaxMasterRecord>(
                  'taxcollection',
                  ParamType.Document,
                  isList: true,
                ),
                qrJson: params.getParam(
                  'qrJson',
                  ParamType.JSON,
                ),
                paytmOrderId: params.getParam(
                  'paytmOrderId',
                  ParamType.String,
                ),
                isPaytm: params.getParam(
                  'isPaytm',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: CashResponsePageWidget.routeName,
              path: CashResponsePageWidget.routePath,
              asyncParams: {
                'appsetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
                'taxcoollectipon':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => CashResponsePageWidget(
                shiftdetails: params.getParam(
                  'shiftdetails',
                  ParamType.JSON,
                ),
                appsetting: params.getParam(
                  'appsetting',
                  ParamType.Document,
                ),
                taxcoollectipon: params.getParam<TaxMasterRecord>(
                  'taxcoollectipon',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: CreditPaymentPageWidget.routeName,
              path: CreditPaymentPageWidget.routePath,
              builder: (context, params) => CreditPaymentPageWidget(),
            ),
            FFRoute(
              name: CustomerLedgerreportWidget.routeName,
              path: CustomerLedgerreportWidget.routePath,
              builder: (context, params) => CustomerLedgerreportWidget(),
            ),
            FFRoute(
              name: ProductAndListNewCopyWidget.routeName,
              path: ProductAndListNewCopyWidget.routePath,
              asyncParams: {
                'taxcollection':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => ProductAndListNewCopyWidget(
                billDetails: params.getParam(
                  'billDetails',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'INVOICE'],
                ),
                doc: params.getParam(
                  'doc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftDetails: params.getParam(
                  'shiftDetails',
                  ParamType.JSON,
                ),
                taxcollection: params.getParam<TaxMasterRecord>(
                  'taxcollection',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: CategoryReportnewWidget.routeName,
              path: CategoryReportnewWidget.routePath,
              builder: (context, params) => CategoryReportnewWidget(),
            ),
            FFRoute(
              name: PurchaseOrderWidget.routeName,
              path: PurchaseOrderWidget.routePath,
              asyncParams: {
                'taxDetails':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
                'paymentMode': getDocList(
                    ['PAYMENT_MODE'], PaymentModeRecord.fromSnapshot),
              },
              builder: (context, params) => PurchaseOrderWidget(
                shiftdetail: params.getParam(
                  'shiftdetail',
                  ParamType.JSON,
                ),
                taxDetails: params.getParam<TaxMasterRecord>(
                  'taxDetails',
                  ParamType.Document,
                  isList: true,
                ),
                userref: params.getParam(
                  'userref',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                paymentMode: params.getParam<PaymentModeRecord>(
                  'paymentMode',
                  ParamType.Document,
                  isList: true,
                ),
                purchase: params.getParam(
                  'purchase',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: PurchaseOrderListWidget.routeName,
              path: PurchaseOrderListWidget.routePath,
              builder: (context, params) => PurchaseOrderListWidget(),
            ),
            FFRoute(
              name: EditPurchaseOrderWidget.routeName,
              path: EditPurchaseOrderWidget.routePath,
              asyncParams: {
                'taxDetails':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
                'paymentMode': getDocList(
                    ['PAYMENT_MODE'], PaymentModeRecord.fromSnapshot),
              },
              builder: (context, params) => EditPurchaseOrderWidget(
                shiftdetail: params.getParam(
                  'shiftdetail',
                  ParamType.JSON,
                ),
                taxDetails: params.getParam<TaxMasterRecord>(
                  'taxDetails',
                  ParamType.Document,
                  isList: true,
                ),
                userref: params.getParam(
                  'userref',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                paymentMode: params.getParam<PaymentModeRecord>(
                  'paymentMode',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: CreditPaymentpurchaseWidget.routeName,
              path: CreditPaymentpurchaseWidget.routePath,
              builder: (context, params) => CreditPaymentpurchaseWidget(),
            ),
            FFRoute(
              name: KioskCustomerInfoWidget.routeName,
              path: KioskCustomerInfoWidget.routePath,
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
                'taxcollection':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => KioskCustomerInfoWidget(
                userdoc: params.getParam(
                  'userdoc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftdoc: params.getParam(
                  'shiftdoc',
                  ParamType.JSON,
                ),
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
                taxcollection: params.getParam<TaxMasterRecord>(
                  'taxcollection',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: WeightscalesettingWidget.routeName,
              path: WeightscalesettingWidget.routePath,
              builder: (context, params) => WeightscalesettingWidget(),
            ),
            FFRoute(
              name: ProductAndListlaundrybillingWidget.routeName,
              path: ProductAndListlaundrybillingWidget.routePath,
              asyncParams: {
                'taxcollection':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => ProductAndListlaundrybillingWidget(
                billDetails: params.getParam(
                  'billDetails',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'INVOICE'],
                ),
                doc: params.getParam(
                  'doc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftDetails: params.getParam(
                  'shiftDetails',
                  ParamType.JSON,
                ),
                taxcollection: params.getParam<TaxMasterRecord>(
                  'taxcollection',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: TestWidgetWidget.routeName,
              path: TestWidgetWidget.routePath,
              builder: (context, params) => TestWidgetWidget(),
            ),
            FFRoute(
              name: CreditPaymentPageCopyWidget.routeName,
              path: CreditPaymentPageCopyWidget.routePath,
              builder: (context, params) => CreditPaymentPageCopyWidget(),
            ),
            FFRoute(
              name: KioskChoosePaymentModeCopyWidget.routeName,
              path: KioskChoosePaymentModeCopyWidget.routePath,
              asyncParams: {
                'appSettings': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
                'taxcollection':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => KioskChoosePaymentModeCopyWidget(
                doc: params.getParam(
                  'doc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftdetails: params.getParam(
                  'shiftdetails',
                  ParamType.JSON,
                ),
                appSettings: params.getParam(
                  'appSettings',
                  ParamType.Document,
                ),
                taxcollection: params.getParam<TaxMasterRecord>(
                  'taxcollection',
                  ParamType.Document,
                  isList: true,
                ),
                qrJson: params.getParam(
                  'qrJson',
                  ParamType.JSON,
                ),
                paytmOrderId: params.getParam(
                  'paytmOrderId',
                  ParamType.String,
                ),
                isPaytm: params.getParam(
                  'isPaytm',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: KioskCartdineinparcelWidget.routeName,
              path: KioskCartdineinparcelWidget.routePath,
              asyncParams: {
                'appsetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
                'taxcollection':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => KioskCartdineinparcelWidget(
                doc: params.getParam(
                  'doc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftdetails: params.getParam(
                  'shiftdetails',
                  ParamType.JSON,
                ),
                appsetting: params.getParam(
                  'appsetting',
                  ParamType.Document,
                ),
                taxcollection: params.getParam<TaxMasterRecord>(
                  'taxcollection',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: XyzBillingWidget.routeName,
              path: XyzBillingWidget.routePath,
              asyncParams: {
                'taxcollection':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => XyzBillingWidget(
                billDetails: params.getParam(
                  'billDetails',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'INVOICE'],
                ),
                doc: params.getParam(
                  'doc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftDetails: params.getParam(
                  'shiftDetails',
                  ParamType.JSON,
                ),
                taxcollection: params.getParam<TaxMasterRecord>(
                  'taxcollection',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: ProductComboBillingWidget.routeName,
              path: ProductComboBillingWidget.routePath,
              asyncParams: {
                'taxcollection':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => ProductComboBillingWidget(
                billDetails: params.getParam(
                  'billDetails',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'INVOICE'],
                ),
                doc: params.getParam(
                  'doc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftDetails: params.getParam(
                  'shiftDetails',
                  ParamType.JSON,
                ),
                taxcollection: params.getParam<TaxMasterRecord>(
                  'taxcollection',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: KioskCardPaymentWidget.routeName,
              path: KioskCardPaymentWidget.routePath,
              asyncParams: {
                'appsettings': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
                'taxcollection':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => KioskCardPaymentWidget(
                doc: params.getParam(
                  'doc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftdetails: params.getParam(
                  'shiftdetails',
                  ParamType.JSON,
                ),
                qrJson: params.getParam(
                  'qrJson',
                  ParamType.JSON,
                ),
                paytmOrderId: params.getParam(
                  'paytmOrderId',
                  ParamType.String,
                ),
                isPaytm: params.getParam(
                  'isPaytm',
                  ParamType.bool,
                ),
                appsettings: params.getParam(
                  'appsettings',
                  ParamType.Document,
                ),
                taxcollection: params.getParam<TaxMasterRecord>(
                  'taxcollection',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: AddRecipeWidget.routeName,
              path: AddRecipeWidget.routePath,
              builder: (context, params) => AddRecipeWidget(
                itemlist: params.getParam(
                  'itemlist',
                  ParamType.DataStruct,
                  isList: false,
                  structBuilder: RecipeItemListStruct.fromSerializableMap,
                ),
              ),
            ),
            FFRoute(
              name: AddRecipeCopyWidget.routeName,
              path: AddRecipeCopyWidget.routePath,
              builder: (context, params) => AddRecipeCopyWidget(
                itemlist: params.getParam(
                  'itemlist',
                  ParamType.DataStruct,
                  isList: false,
                  structBuilder: RecipeItemListStruct.fromSerializableMap,
                ),
              ),
            ),
            FFRoute(
              name: AddRecipeTESTWidget.routeName,
              path: AddRecipeTESTWidget.routePath,
              builder: (context, params) => AddRecipeTESTWidget(
                itemlist: params.getParam(
                  'itemlist',
                  ParamType.DataStruct,
                  isList: false,
                  structBuilder: RecipeItemListStruct.fromSerializableMap,
                ),
              ),
            ),
            FFRoute(
              name: SelectpaymentModeWidget.routeName,
              path: SelectpaymentModeWidget.routePath,
              builder: (context, params) => SelectpaymentModeWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
