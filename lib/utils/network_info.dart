import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker connectionChecker =
      InternetConnectionChecker();

  @override
  InternetConnectionChecker get networkInfo => connectionChecker;
}

abstract class NetworkInfo {
  InternetConnectionChecker get networkInfo;
}