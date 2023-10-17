class PaymentCard{
  String cardHolderName;
  String cardNumber;
  DateTime expiryDate;
  int cvv;

  PaymentCard({required this.cardHolderName, required this.cardNumber, required this.expiryDate, required this.cvv});

  Map<String , dynamic> toMap(){
    return {
      "cardHolderName" : this.cardHolderName,
      "cardNumber" : this.cardNumber,
      "expiryDate" : this.expiryDate,
      "cvv" : this.cvv
    };
  }
}

class CardResponse{
  PaymentCard? card;
  String msg;
  bool code;

  CardResponse({this.card, required this.msg, required this.code});
}