import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'router_state.dart';

class RouterCubit extends Cubit<RouterState> {
  RouterCubit() : super(RouterInitial());

  void openHomeScreen() {
    emit(RouterInitial());
    emit(OpenHomeScreen());
  }

  void openTransactionsScreen() {
    emit(RouterInitial());
    emit(OpenTransactionsScreen());
  }

  void openTransferBalanceScreen() {
    emit(RouterInitial());
    emit(OpenTransferBalanceScreen());
  }

  // void openConfirmTransferBalanceScreen(
  //     double amount, UserDetails userDetails) {
  //   emit(RouterInitial());
  //   emit(OpenConfirmTransferBalanceScreen(
  //       amount: amount, userDetails: userDetails));
  // }

  // void openSuccessTransferBalanceScreen(
  //     double amount, UserDetails userDetails) {
  //   emit(RouterInitial());
  //   emit(OpenSuccessTransferBalanceScreen(
  //       amount: amount, userDetails: userDetails));
  // }

  void openRechargeMeterScreen() {
    emit(RouterInitial());
    emit(OpenRechargeMeterScreen());
  }

  void openNewRechargeMeterScreen() {
    emit(RouterInitial());
    emit(OpenNewRechargeMeterScreen());
  }

  void openConfirmRechargeMeterScreen(
      double amount, String meter, String meterType, bool isSaveMeter) {
    emit(RouterInitial());
    emit(OpenConfirmRechargeMeterScreen(
        amount: amount,
        meter: meter,
        meterType: meterType,
        isSaveMeter: isSaveMeter));
  }

  void openConfirmNewRechargeMeterScreen(
      double amount, String meter, String meterType, bool isSaveMeter) {
    emit(OpenConfirmNewRechargeMeterScreen(
        amount: amount,
        meter: meter,
        meterType: meterType,
        isSaveMeter: isSaveMeter));
  }

  void openSuccessRechargeMeterScreen(double amount, String meter) {
    emit(RouterInitial());
    emit(OpenSuccessRechargeMeterScreen(amount: amount, meter: meter));
  }

  // void openSuccessNewRechargeMeterScreen(
  //     double amount, String meter, RechargeBill rechargeBill) {
  //   emit(RouterInitial());
  //   emit(OpenSuccessNewRechargeMeterScreen(
  //       amount: amount, meter: meter, rechargeBill: rechargeBill));
  // }

  void openPayCleanBillsScreen() {
    emit(RouterInitial());
    emit(OpenPayCleanBillsScreen());
  }

  void openConfirmPayCleanBillsScreen(
      String meter, String meterType, bool isSaveMeter) {
    emit(RouterInitial());
    emit(OpenConfirmPayCleanBillsScreen(
        meter: meter, meterType: meterType, isSaveMeter: isSaveMeter));
  }

  void openContactEmergencyScreen() {
    emit(RouterInitial());
    emit(OpenContactEmergencyScreen());
  }

  void openHelpSymbolsScreen() {
    emit(RouterInitial());
    emit(OpenHelpSymbolsScreen());
  }
}
