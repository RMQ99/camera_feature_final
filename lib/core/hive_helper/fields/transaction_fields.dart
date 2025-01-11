class TransactionFields {
  static const int id = 0;
  static const int type = 1;
  static const int amount = 2;
  static const int userId = 3;
  static const int meter = 4;
  static const int reason = 5;
  static const int activationCode = 6;
  static const int createdAt = 7;
  static const int updatedAt = 8;
  static const int sender = 9;
  static const int receiver = 10;
  static const int handleObject = 11;
  static const int rechargeBill = 12;
  static const int bill = 13;
}

class TransactionTypeFields {
  static const int rechargeBalance = 0;
  static const int rechargeMeterRefund = 1;
  static const int rechargeMeter = 2;
  static const int transferOut = 3;
  static const int transferIn = 4;
  static const int transferProfit = 5;
}
