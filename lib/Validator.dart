class Validator{

  static validateUserame({required String username}){
    if(username.isEmpty){
      return "Username can\'t be empty";
    }
    else{
      return null;
    }
  }

  static validateEmail({required String email}){

    RegExp emailRegExp = RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if(email.isEmpty){
      return "Email can\'t be empty";
    }
    else if(!emailRegExp.hasMatch(email)){
      return "Enter valid value";
    }else{
      return null;
    }
  }

  static validatePassword({required String password}){
    if(password.isEmpty){
      return "Password can\'t be empty";
    }else if(password.length < 6){
      return "Enter password with atleast 6 characters";
    }else{
      return null;
    }
  }

  static validateOTP({required String digit}){
    if(digit.isEmpty){
      return "";
    }else{
      return null;
    }
  }

  static bool isEmptyOTP(String first,String second,String third,String fourth,String fifth, String sixth){
    if(first.isEmpty){
      return true;
    }else if(second.isEmpty){
      return true;
    }else if(third.isEmpty){
      return true;
    }else if(fourth.isEmpty){
      return true;
    }else if(first.isEmpty){
      return true;
    }else if(sixth.isEmpty){
      return true;
    }else{
      return false;
    }
  }

  static validateGender({required String gender}) {
    if(gender.isEmpty){
      return "Gender can't be null";
    }else if(gender != "Male" && gender != "Female" && gender != "Other" && gender != "male" && gender != "female" && gender != "other"){
      return "Gender must be Male, Femail or Other";
    }else{
      return null;
    }
  }

  static validateDOB({required String DOB}) {
    if(DOB.isEmpty){
      return "DOB can't be null";
    }else{
      return null;
    }
  }

  static validateCardHolderName({required String cardHolderName}){
    if(cardHolderName.isEmpty){
      return "Card holder name can\'t be empty";
    }
    else{
      return null;
    }
  }

  static validateCardNumber({required String cardNumber}){
    if(cardNumber.isEmpty){
      return "Card number can\'t be empty";
    }
    else if(cardNumber.length < 19 || cardNumber.length > 19 ){
      return "Enter valid card number";
    }
    else{
      return null;
    }
  }

  static validateCerdExpiry({required String expiryDate}) {
    if(expiryDate.isEmpty){
      return "Expiry date can'\t be null";
    }else{
      return null;
    }
  }

  static validateCVV({required String CVV}) {
    if(CVV.isEmpty){
      return "CVV can'\t be null";
    }else if(CVV.length < 3 || CVV.length > 3){
      return "Enter valid CVV";
    }
    else{
      return null;
    }
  }

}