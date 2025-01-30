import 'package:flutter_account/model/transaction.dart';
import 'package:flutter/foundation.dart';

class TransactionProvider with ChangeNotifier {
  List<Transaction> transactions = [
    Transaction(title: 'มังงะ', amount: 1000 ,date: DateTime(2025, 1, 2, 9, 30)),
    Transaction(title: 'เวย์', amount: 200, date: DateTime(2025, 1, 12, 14, 0)),
    Transaction(title: 'รองเท้า', amount: 1500, date: DateTime(2025, 1, 6, 18, 15)),
    Transaction(title: 'กระเป๋า', amount: 1000, date: DateTime(2025, 1, 7, 8, 0)),
    Transaction(title: 'กางเกง', amount: 300, date: DateTime(2025, 1, 20, 20, 45))
  ];

  List<Transaction> getTransaction() {
    return transactions;
  }

  void addTransaction(Transaction transaction) {
    transactions.add(transaction);
  }
}
