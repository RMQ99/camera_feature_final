class ErrorMessage {
  static const String server = 'an_error_occurred';
  static const String unauthenticated = 'an_error_occurred';
  static const String invalidRequestBody = 'an_error_occurred';
  static const String accountAlreadyTaken = 'الحساب مسجل مسبقاً';
  static const String emailPasswordNotMatch =
      'البريد الإلكتروني وكلمة المرور غير متطابقتين';
  static const String incorrectPassword = 'كلمة المرور الحالية غير صحيحة';
  static const String emailNotExist = 'البريد الإلكتروني غير مسجل مسبقاً';
  static const String offline = 'لا يوجد اتصال في الإنترنت!';
  static const String cardNotFound =
      'البطاقة التي تريد شحن الرصيد منها غير موجودة';
  static const String meterNotFound = 'عداد الكهرباء الذي تود شحنه غير موجود';
  static const String receiverNotFound = 'المستلم الذي ادخلته غير موجود';
  static const String userNotFound = 'رقم الحساب الذي ادحلته غير موجود';
  static const String insufficientBalance = 'ليس لديك رصيد كافي';
  static const String invalidEmail = 'invalid_user_for_email';
  static const String wrongPassword = 'wrong_password';
  static const String anErrorOccurred = 'an_error_occurred';
  static const String noOrderItemsAdded = 'no_order_items_added';
  static const String someOrderItemsQuantityZero =
      'some_order_items_quantity_zero';
  static const String noIncomeItemsAdded = 'no_income_items_added';
  static const String someIncomeItemsQuantityZero =
      'some_income_items_quantity_zero';
  static const String productAlreadyExist = 'product_already_exist_in_items';
  static const String barcodeProductNotFound = 'barcode_product_not_found';
  static const String noConfigFound = 'no_config_found';
  static const String accountDisabled = 'account_disabled';
  static const String invalidCredentials = 'invalid_credentials';
  static const String printOrder = 'error_print_order';
  static const String printIncome = 'error_print_income';

  static const String googleSignIn = 'حدث خطأ اثناء تسجيل الدخول بواسطة غوغل';

  static const String cleanBillsShouldPaidBefore = 'يجب دفع رسوم النظافة أولا';
  static const String allMonthBillsPaidException =
      'لا يوجد رسوم نظافة مستحقة الدفع لهذا العداد';
  static const String monthBillPaidBeforeException =
      'رسوم النظافة لهذا الشهر مدفوعة من قبل';
}

class DoneMessage {
  static const String register = 'تم إنشاء الحساب بنجاح';
  static const String deleted = 'تم حذف المنتج';
  static const String login = 'مرحباً بك';
  static const String updateUser = 'تم تعديل المعلومات بنجاح';
  static const String resetPassword = 'تم تغيير كلمة المرور بنجاح';
  static const String changePassword = 'تم تغيير كلمة المرور بنجاح';
  static const String completeRegister = 'ادخل معلوماتك لتسجيل الحساب';
  // static const String rechargeBalance = 'تم شحن الرصيد بنجاح';
  // static const String rechargeMeter = 'تم شحن عداد الكهرباء بنجاح';
  // static const String transfer = 'تم تحويل الرصيد بنجاح';
}
