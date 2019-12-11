/// example JSON data format
//{
  //"id": "JS",
  //"account_No": "409000362497",
  //"date": "2015-07-16",
  //"WITHDRAWAL_AMT": "250",
  //"DEPOSIT_AMT": "2015",
  //"BALANCE_AMT": "250000"
//}

class TransactionCard {
  final String id;
  final String account_No;
  final String date;
  final String WITHDRAWAL_AMT;
  final String DEPOSIT_AMT;
  final String BALANCE_AMT;

  TransactionCard(this.id, this.account_No, this.date, this.WITHDRAWAL_AMT, this.DEPOSIT_AMT, this.BALANCE_AMT );

  TransactionCard.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        account_No = json['account_No'],
        date = json['date'],
        WITHDRAWAL_AMT = json['WITHDRAWAL_AMT'],
        DEPOSIT_AMT = json['DEPOSIT_AMT'],
        BALANCE_AMT = json['BALANCE_AMT'];

  Map<String, dynamic> toJson() =>
    {
      'id': id,
      'account_No': account_No,
      'date': date,
      'WITHDRAWAL_AMT': WITHDRAWAL_AMT,
      'DEPOSIT_AMT': DEPOSIT_AMT,
      'BALANCE_AMT': BALANCE_AMT,
    };
}
