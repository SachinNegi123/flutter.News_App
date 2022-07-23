import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/Api.dart';

class FutureFunction extends StatefulWidget {
  const FutureFunction({Key key}) : super(key: key);

  @override
  State<FutureFunction> createState() => _FutureFunctionState();
}

class _FutureFunctionState extends State<FutureFunction> {
  @override
  Widget build(BuildContext context) {
    final dataCall = Provider.of<ApiResponse>(context, listen: false).getNews();
    return FutureBuilder(
      future: dataCall,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            child: ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: ListTile(
                    title: Text(
                        "${snapshot.data['articles'][index]['urlToImage']}"),
                    subtitle: Text(
                        "${snapshot.data['articles'][index]['title']} \n${snapshot.data['articles'][index]['content']}"),
                    isThreeLine: true,
                  ),
                );
              },
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("No Data Found"));
        } else if (snapshot.data.length == null) {
          return Center(child: Text("Invadil data"));
        }
        return (Center(
          child: CircularProgressIndicator(),
        ));
      },
    );
  }
}
