
class Validator {
  static String? validateName({required String name}) {
    if (name.isEmpty) {
      return "required";
    } else if (name.length > 15) {
      return "nameBig";
    } else if (name.length < 3) {
      return "nameSmall";
    }

    return null;
  }

  // static String? validatePhone({required String phone}) {
  //   final egyptPhoneRegex = RegExp(r'^(010|011|012|015)[0-9]{8}$');
  //   if (phone.isEmpty) {
  //     return S.current.required;
  //   } else if (phone.trim().length != 11) {
  //     return S.current.phoneBig;
  //   } else if (!egyptPhoneRegex.hasMatch(phone)) {
  //     return S.current.phoneError;
  //   }
  //   return null;
  // }

  static String? validateEmail({required String email}) {
    if (email.isEmpty) {
      return "required";
    }
    RegExp emailRegExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!emailRegExp.hasMatch(email)) {
      return "emailError";
    }
    return null;
  }

  static String? validatePass({required String password}) {
    RegExp passwordRegex =
        RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W]).{8,}$');
    if (password.isEmpty) {
      return "required";
    } else if (!passwordRegex.hasMatch(password)) {
      return "passwordError";
    }
    return null;
  }

  static String? validatePassConf(
      {required String conPass, required String passController}) {
    if (conPass.isEmpty) {
      return "required";
    }
    if (conPass != passController) {
      return "not same password";
    }
    return null;
  }

  static String? validateOtp({required String otp}) {
    if (otp.isEmpty) {
      return "required";
    }
    return null;
  }

  // static String? validateMessage({required String message}) {
  //   if (message.isEmpty) {
  //     return S.current.messageError;
  //   }
  //   return null;
  // }
}
