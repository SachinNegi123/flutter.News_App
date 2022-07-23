import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'provider/Api.dart';
import 'screen/Home_page.dart';

void main() {
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ApiResponse(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.deepPurple),
        home: HomePage(),
      ),
    );
  }
}
