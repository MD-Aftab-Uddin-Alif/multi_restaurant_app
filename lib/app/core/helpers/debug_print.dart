import 'dart:developer';
import 'package:multi_restaurant_app/package_routes.dart';

class DP {
  // Debug Print
  static void localLogWriter(String text, {bool isError = false}) {
    if (isError) {
      Logger().t(text, error: 'localLogWriter');
    }
  }

  //? Ex. 'User input: $userInput' grey color
  static void debug(
    String msg,
    String functionName, {
    bool forcePrint = false,
  }) {
    try {
      if (AppConstant.isAllDebugging || AppConstant.isDebugging || forcePrint) {
        Logger().d(functionName, error: msg);
        if (AppConstant.showLog) {
          log(msg);
        }
      }
    } catch (e) {
      Logger()
          .e(e.toString(), error: 'Debugging Error in DP for $functionName');
    }
  }

  //? Ex. 'User logged in successfully' blue color
  static void status(
    String msg,
    String functionName, {
    bool forcePrint = false,
  }) {
    try {
      if (AppConstant.isAllDebugging || AppConstant.isStatus || forcePrint) {
        Logger().t(functionName, error: msg);
      }
    } catch (e) {
      Logger().e(e.toString(),
          error: 'Status Showing Error in DP for $functionName');
    }
  }

  //? Ex. 'Database connection timed out' orange color
  static void warning(String msg, String functionName) {
    try {
      if (AppConstant.isWarning) {
        Logger().w(functionName, error: msg);
      }
    } catch (e) {
      Logger().e(e.toString(), error: 'Warning Error in DP for $functionName');
    }
  }

  //? Ex. 'File not found: $filePath' red color
  static void error(String msg, String functionName) {
    try {
      if (AppConstant.isError) {
        Logger().e(functionName, error: msg);
      }
    } catch (e) {
      Logger().e(e.toString(), error: 'Error Error in DP for $functionName');
    }
  }

  //? Ex. 'File not found: $filePath' pink color
  static void fatal(String msg, String functionName) {
    try {
      if (AppConstant.isError) {
        Logger().f(functionName, error: msg);
      }
    } catch (e) {
      Logger().e(e.toString(), error: 'Fatal Error in DP for $functionName');
    }
  }

  static void listValues<T>(dynamic list, {bool forcePrint = false}) {
    //do not delete it's need to be modified
    try {
      if (AppConstant.isDebuggingList && AppConstant.isDebugging ||
          AppConstant.isAllDebugging) {
        for (var object in list) {
          // Convert the map to a JSON string
          var jsonString = json.encode(object.toJson());
          print(jsonString);
        }
      }
    } catch (e) {
      print('${e.toString()} in listValues');
    }
  }
}

void dPrint(String msg) {
  try {
    // if (AppConstant.isDebugging) {
    //   if (AppConstant.showLog) {
    //     var logger = Logger();

    //     logger.d(msg);
    //   } else {
    //     print(msg);
    //   }
    // }
  } catch (e) {
    if (AppConstant.showLog) {
    } else {
      print('${e.toString()} in dPrint');
    }
  }
}

void dPrintRxListValues<T>(dynamic list, {bool forcePrint = false}) {
  //do not delete it's need to be modified
  try {
    if (AppConstant.isDebuggingList && AppConstant.isDebugging) {
      for (var object in list) {
        // Convert the map to a JSON string
        var jsonString = json.encode(object.toJson());
        if (AppConstant.showLog) {
        } else {
          print(jsonString);
        }
      }
    }
  } catch (e) {
    if (AppConstant.showLog) {
    } else {
      print('${e.toString()} in dPrintRxListValues');
    }
  }
}

void dPrintRxObjectValues<T>(dynamic object) {
  //do not delete it's need to be modified
  try {
    if (AppConstant.isDebuggingObj && AppConstant.isDebugging) {
      // Convert the map to a JSON string
      var jsonString = json.encode(object.toJson());
      if (AppConstant.showLog) {
      } else {
        print(jsonString);
      }
    }
  } catch (e) {
    if (AppConstant.showLog) {
    } else {
      print('${e.toString()} in dPrintRxObjectValues');
    }
  }
}
