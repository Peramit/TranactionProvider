  import 'package:flutter/material.dart';
  import 'package:flutter_account/model/transaction.dart';
  import 'package:flutter_account/provider/transactionProvider.dart';
  import 'formScreen.dart';
  import 'package:provider/provider.dart';

  void main() {
    runApp(const MyApp());
  }

  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) {
            return TransactionProvider();
          })
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 58, 89, 183)),
            useMaterial3: true,
          ),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        ),
      );
    }
  }

  class MyHomePage extends StatefulWidget {
    const MyHomePage({super.key, required this.title});

    final String title;

    @override
    State<MyHomePage> createState() => _MyHomePageState();
  }

  class _MyHomePageState extends State<MyHomePage> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
            actions: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  // การนำทางไปยัง FormScreen
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const FormScreen(); // เปิดหน้าจอ FormScreen
                  }));
                },
              ),
            ],
          ),
          body: Consumer(
            builder: (context, TransactionProvider provider, Widget? child) {
              return ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, int index) {
                    Transaction data = provider.transactions[index];
                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.all(8),
                      child: ListTile(
                        title: Text('รายการที่ ${index +1} : ${data.title}'),
                        subtitle: Text('วันที่บันทึก : ${data.date.toString()}'),
                        leading: CircleAvatar(
                          child: FittedBox(
                            child: Text(data.amount.toString()),
                          ),
                        ),
                      ),
                    );
                  });
            },
          ));
    }
  }