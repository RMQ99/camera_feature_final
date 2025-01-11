String? requiredValidator(dynamic value) {
  String txt = value as String;
  if (txt.isEmpty) {
    return 'هذا الحقل مطلوب';
  }
  return null;
}

String? emailValidator(dynamic value) {
  String txt = value as String;
  if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(txt)) {
    return 'يرجى إدخال عنوان بريد الكتروني صالح';
  }
  return null;
}

String? phoneValidator(dynamic value) {
  // if (!RegExp(r'^(\+0?1\s)?((\d{3})|(\(\d{3}\)))?(\s|-)\d{3}(\s|-)\d{4}$')
  //     .hasMatch(txt)) {
  //   return 'يرجى إدخال رقم هاتف صالح';
  // }
  return null;
}

String? passwordValidator(dynamic value) {
  String txt = value as String;
  if (txt.length < 8) {
    return 'يجب أن تكون كلمة المرور 8 محارف أو أكثر';
  }
  return null;
}

String? passwordsMatchValidator(dynamic value, dynamic value2) {
  String txt = value as String;
  String txt2 = value2 as String;
  if (txt != txt2) {
    return 'كلمتا المرور غير متطابقتين';
  }
  return null;
}
