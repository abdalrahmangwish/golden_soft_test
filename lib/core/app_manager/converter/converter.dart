class Converter {
  static double toValidateDouble(dynamic value) {
    if (value is double) {
      return value;
    } else if (value is num) {
      return value.toDouble();
    } else if (value is int) {
      return value.toDouble();
    } else {
      final temp = double.tryParse(value.toString());
      if (temp != null) {
        return temp;
      } else {
        return 0;
      }
    }
  }

  static int toValidateInt(dynamic value) {
    if (value is int) {
      return value;
    } else if (value is double) {
      return value.toInt();
    } else if (value is num) {
      return value.toInt();
    } else {
      final temp = int.tryParse(value.toString());
      if (temp != null) {
        return temp;
      } else {
        return 0;
      }
    }
  }
  static Map<String, dynamic>? toValidateMap(dynamic value) {
    if (value is Map<String, dynamic>) {
      return value;
    } else {
      return {};
    }
  }
  static String toValidateString(dynamic value) {
    if (value == null) {
      return '';
    } else {
      return value.toString();
    }
  }

  static bool fromIntToBool(dynamic value) {
    if (value is int) {
      return value != 0;
    } else {
      return false;
    }
  }
}
