class Validator {
  //name
  static String? validateName({required String name}) {
    if (name.isEmpty) {
      return "name can't be empty";
    }
    return null;
  }

  //address
  static String? validateAddress({required String address}) {
    if (address.isEmpty) {
      return "name can't be empty";
    }
    return null;
  }

  //Mobile Number
  static String? validateMobile({required String mobile}) {
    if (mobile.isEmpty) {
      return "name can't be empty";
    }
    return null;
  }
}
