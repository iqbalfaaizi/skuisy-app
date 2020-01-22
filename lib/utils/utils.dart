class Val {
  static String ValidateEmail(String val) {
    RegExp exp = new RegExp (
        r"^[\w-.]+@([\w-]+.)+[\w-]{2,4}$",
        caseSensitive: false,
        multiLine: false,
    );
    
    if (val.isEmpty){
      return "Email cannot be empty";
    } else if (exp.hasMatch(val.trim()) == false) {
      return "Invalid email format";
    }

    //return (val != null && val != "") ? null : "Email cannot be empty";
  }

  static String ValidatePassword(String val) {
    RegExp exp = new RegExp(
      r"^(?=.*\d).{6,16}$",
      multiLine: false,
    );

    if (val.isEmpty){
      return "Password cannot be empty";
    } else if (exp.hasMatch(val.trim()) == false) {
      return "Must be 6-16 digits and at least one numeric digit";
    }
    //return (val != null && val != "") ? null : "Password cannot be empty";
  }

  static String ValidateAmount(String val) {
    if (val.isEmpty) {
      return "Amount can\'t be empty";
    } else if (int.parse(val) < 1000) {
      return "Amount can\'t less than Rp.1,000,-";
    } else if (int.parse(val) > 100000000) {
      return "Amount can\'t more than Rp.100,000,000,-";
    }
  }

  static String ValidateCardExp(String val) {
    RegExp exp = new RegExp(r"^(0[1-9]|1[0-2])[0-9][0-9]$");
    if (exp.hasMatch(val) == false) {
      return "Please input valid date";
    }
  }
  static String ValidateTextField(String val) {
    if (val.isEmpty){
      return "This field cannot be empty";
    }
  }

  static String ValidatePhone(String val) {
    RegExp exp = new RegExp(
      r"^[0-9]{8,15}$",
      multiLine: false,
    );

    if (val.isEmpty){
      return "This field cannot be empty";
    } else if (exp.hasMatch(val.trim()) == false) {
      return "Must be 8-15 digits and only numeric digit";
    }
  }
}