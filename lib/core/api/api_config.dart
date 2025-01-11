class ApiConfig {
  static const String baseUrl =
      'https://oxygen-app-backend-faf3452b123c.herokuapp.com/v1/';

  static const String getUser = 'users/me'; //! GET
  static const String updateUser = 'users/me'; //! PATCH
  static const String deleteUser = 'users/me'; //! DELETE
  static const String signInWithPhoneAndPassword = 'users/login'; //! POST

  // Products
  static const String getAllProduct = 'products'; //! GET
  static const String getProductSpecified = 'products/'; //! GET
  static const String checkproduct = 'products'; //! GET
  static const String createProduct = 'products'; //! POST
  static const String updateProduct = 'products/'; //! PATCH

  // Hotels
  static const String getAllHotel = 'hotels'; //! GET
  static const String getHotelSpecified = 'hotels/'; //! GET
  static const String getHotelHome = 'reports/hotel-home/'; //! GET

  // Orders
  static const String getAllOrder = 'orders'; //! GET
  static const String getOrderSpecified = 'orders/'; //! GET
  static const String assignOrder = 'orders/'; //! GET
  static const String leaveOrder = 'orders/'; //! GET
  static const String createOrder = 'orders'; //! POST
  static const String addOrderItem = 'orders/'; //! POST
  static const String updateOrder = 'orders/'; //! PATCH
  static const String updateOrderItem = 'orders/'; //! PATCH
  static const String deleteOrderItem = 'orders/'; //! DELETE
  static const String printOrder = 'orders/'; //! DELETE

  // Incomes
  static const String getAllIncome = 'received-orders'; //! GET
  static const String getIncomeSpecified = 'received-orders/'; //! GET
  static const String assignIncome = 'received-orders/'; //! GET
  static const String leaveIncome = 'received-orders/'; //! GET
  static const String createIncome = 'received-orders'; //! POST
  static const String addIncomeItem = 'received-orders/'; //! POST
  static const String updateIncome = 'received-orders/'; //! PATCH
  static const String updateIncomeItem = 'received-orders/'; //! PATCH
  static const String deleteIncomeItem = 'received-orders/'; //! DELETE
  static const String printIncome = 'received-orders/'; //! DELETE

  /// Media

  static const String createMedia = 'media/create'; //! POST

  static const String register = 'users'; //! POST
  static const String login = 'users/me'; //! POST
  static const String googleSignIn = 'sessions/sessions/google'; //! POST
  static const String refreshToken = 'sessions/refresh'; //! POST
  static const String logout = 'sessions/destroy'; //! POST

  static const String getHotelById = ''; //! GET
  static const String getHotelsBySearchText = ''; //! GET
  static const String getConfigs = 'config'; //! GET

  static const String changePassword = 'users/me/change-password'; //! POST

  static const String resetPassword = 'auth/reset-password'; //! POST
  static const String forgotPassword = 'auth/forgot-password'; //! POST

  static const String getTransactions = 'credit-transactions'; //! GET
  static const int hotelsPaginationPageSize = 10;
  static const int productsPaginationPageSize = 100;
  static const String transactionsPaginationOrderColumn = 'createdAt';
  static const String transactionsPaginationOrderDirection = 'desc';

  static const String transfer = 'credit-transactions/transfer'; //! POST

  static const String getUserDetails = 'users'; //! GET

  static const String rechargeMeter =
      'credit-transactions/recharge-meter'; //! POST
  static const String newRechargeMeter =
      'credit-transactions/credit-token'; //! POST
  static const String rechargeBalance =
      'credit-transactions/recharge-balance'; //! POST

  static const String getMonthBills = 'credit-transactions/list-bills'; //! GET
  static const String payMonthBill = 'credit-transactions/pay-bills'; //! POST

  static const String getAds = 'ads'; //! GET
  static const int adsPaginationPageSize = 5;
  static const String adsPaginationOrderColumn = 'createdAt';
  static const String adsPaginationOrderDirection = 'desc';

  static const String saveFCMToken = 'users/device-tokens'; //! POST

  static const String getAppConfig = 'config'; //! GET

  static const String getResellers = 'users/resellers'; //! GET
  static const int resellersPaginationPageSize = 7;
  static const String resellersPaginationOrderColumn = 'createdAt';
  static const String resellersPaginationOrderDirection = 'desc';

  static const String getCompanyServiceCenters =
      'company-service-centers'; //! GET
  static const int companyServiceCentersPaginationPageSize = 15;
  static const String companyServiceCentersPaginationOrderColumn = 'createdAt';
  static const String companyServiceCentersPaginationOrderDirection = 'desc';
}
