import 'package:esteh7/BookModel.dart';
import 'package:flutter/material.dart';

import 'package:esteh7/BookService.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter ru

        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const BookPage(),
    );
  }
}

class BookPage extends StatefulWidget {
  const BookPage({Key? key}) : super(key: key);
  @override
  State<BookPage> createState() => _BookPageState();
  //_BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Buku'),
      ),
      body: FutureBuilder<List<BookModel>>(
          future: BookServices.getBooksFromJSON(),
          builder: (context, snapshoot) {
            if (snapshoot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: snapshoot.data!.length,
                  itemBuilder: (context, index) {
                    final book = snapshoot.data![index];
                    return ListTile(
                      title: Text(book.judul),
                      subtitle: Text(
                        'Jumlah halaman : ${book.halaman}',
                      ),
                      trailing: book.isBestSeller
                          ? Chip(
                              label: Text(
                                'Best Seller',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                              backgroundColor: Colors.blue)
                          : const SizedBox.shrink(),
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
