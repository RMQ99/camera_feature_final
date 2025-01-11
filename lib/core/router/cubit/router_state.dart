// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'router_cubit.dart';

abstract class RouterState extends Equatable {
  @override
  List<Object> get props => [];
}

class RouterInitial extends RouterState {}

class OpenHomeScreen extends RouterState {}

class OpenTransactionsScreen extends RouterState {}

class OpenTransferBalanceScreen extends RouterState {}

// class OpenConfirmTransferBalanceScreen extends RouterState {
//   double amount;
//   UserDetails userDetails;
//   OpenConfirmTransferBalanceScreen({
//     required this.amount,
//     required this.userDetails,
//   });
//   @override
//   List<Object> get props => [amount, userDetails];
// }

// class OpenSuccessTransferBalanceScreen extends RouterState {
//   double amount;
//   UserDetails userDetails;
//   OpenSuccessTransferBalanceScreen({
//     required this.amount,
//     required this.userDetails,
//   });
//   @override
//   List<Object> get props => [amount, userDetails];
// }

class OpenRechargeMeterScreen extends RouterState {}

class OpenNewRechargeMeterScreen extends RouterState {}

// ignore: must_be_immutable
class OpenConfirmRechargeMeterScreen extends RouterState {
  double amount;
  String meter;
  String meterType;
  bool isSaveMeter;
  OpenConfirmRechargeMeterScreen({
    required this.amount,
    required this.meter,
    required this.meterType,
    required this.isSaveMeter,
  });
  @override
  List<Object> get props => [amount, meter, meterType, isSaveMeter];
}

// ignore: must_be_immutable
class OpenConfirmNewRechargeMeterScreen extends RouterState {
  double amount;
  String meter;
  String meterType;
  bool isSaveMeter;
  OpenConfirmNewRechargeMeterScreen({
    required this.amount,
    required this.meter,
    required this.meterType,
    required this.isSaveMeter,
  });
  @override
  List<Object> get props => [amount, meter, meterType, isSaveMeter];
}

// ignore: must_be_immutable
class OpenSuccessRechargeMeterScreen extends RouterState {
  double amount;
  String meter;
  OpenSuccessRechargeMeterScreen({
    required this.amount,
    required this.meter,
  });
  @override
  List<Object> get props => [amount, meter];
}

// class OpenSuccessNewRechargeMeterScreen extends RouterState {
//   double amount;
//   String meter;
//   RechargeBill rechargeBill;
//   OpenSuccessNewRechargeMeterScreen({
//     required this.amount,
//     required this.meter,
//     required this.rechargeBill,
//   });
//   @override
//   List<Object> get props => [amount, meter, rechargeBill];
// }

class OpenPayCleanBillsScreen extends RouterState {}

// ignore: must_be_immutable
class OpenConfirmPayCleanBillsScreen extends RouterState {
  String meter;
  String meterType;
  bool isSaveMeter;
  OpenConfirmPayCleanBillsScreen({
    required this.meter,
    required this.meterType,
    required this.isSaveMeter,
  });
  @override
  List<Object> get props => [meter, meterType, isSaveMeter];
}

class OpenContactEmergencyScreen extends RouterState {}

class OpenHelpSymbolsScreen extends RouterState {}
