import 'dart:math';
import 'package:bwind/Model/EmailResponse.dart';
import 'package:bwind/Model/Userbase.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class Email{

  static Future<EmailResponse> sendMail(String email) async {
    if(await Userbase.isEmailRegistered(email)) {
      String username = 'mrkingmoradiya@gmail.com'; //Email
      String password = 'libvygktmttbftgv'; //App Password
      String OTP = generateOTP();

      final smtpServer = gmail(username, password);

      final message = Message()
        ..from = Address(username, 'Bwind')
        ..recipients.add(email)
        ..subject = 'Password Reset'
      // ..text = 'Your Bwind app reset password OTP is $OTP'
        ..html = "<h1>Password Reset</h1>\n<p>Your Bwind app reset password OTP is $OTP</p>";
      try {
        final sendReport = await send(message, smtpServer);
        return EmailResponse(
            data: OTP,
            msg: "Email Sent",
            code: true
        );
      } on MailerException catch (e) {
        print('Message not sent.');
        print(e);
        return EmailResponse(
            data: null,
            msg: "Somting is wrong",
            code: false
        );
      }
    }else{
      return EmailResponse(
          data: null,
          msg: "Email not registered",
          code: false
      );
    }
  }

  static String generateOTP(){
    var random = new Random();
    int OTP = random.nextInt(900000) + 100000;
    return OTP.toString();
  }
}