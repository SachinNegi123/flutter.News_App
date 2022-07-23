import 'package:flutter/material.dart';

import '../Models/Future_function.dart';

class BreakingNews extends StatefulWidget {
  @override
  State<BreakingNews> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: FutureFunction());
  }
}
