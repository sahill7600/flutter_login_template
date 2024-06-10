import  'dart:developer' as lg;

class Logger {
  static final Logger _logger = new Logger._internal();

  static Logger get() {
    return _logger;
  }

  Logger._internal();

  void log(Object object) {
    if (!const bool.fromEnvironment("dart.vm.product")) {
       //print("Lokaly Biz : $object");
      lg.log("Lokaly Biz : $object");
    }
  }
}
