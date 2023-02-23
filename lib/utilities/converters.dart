/// converts values of type int to double
/// intended to use while parsing json values where type will be dynamic
/// returns value of type double
intToDouble(dynamic val) {
  if (val.runtimeType == double) {
    return val;
  } else if (val.runtimeType == int) {
    return val.toDouble();
  } else {
    throw Exception("value is not of type 'int' or 'double' got type '${val.runtimeType}'");
  }
}

 String formatTimeZoneOffset(int offsetSeconds) {
      // Convert offset from seconds to hours
      double offsetHours = offsetSeconds / 3600;
      // Format offset as a string with +/- sign
      String formattedOffset = offsetHours >= 0
          ? '+${offsetHours.toStringAsFixed(1)}'
          : offsetHours.toStringAsFixed(1);
      // Return formatted offset string
      return 'GMT$formattedOffset';
    }