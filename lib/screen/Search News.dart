import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Models/Future_function.dart';
import 'package:provider/provider.dart';

import '../provider/Api.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextFormField(
        controller: _passwordController,
        decoration: InputDecoration(
          hintText: "Search News Here",
          border: OutlineInputBorder(),
          prefixIcon: IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {
              showSearch(context: context, delegate: SearchNews());
            },
          ),
        ),
      ),
    );
  }
}

class SearchNews extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    final dataCall =
        Provider.of<ApiResponse>(context, listen: false).searchNews();
    return FutureBuilder(
      future: dataCall,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Expanded(
            child: SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    child: ListTile(
                      title: Image.network(
                          "${snapshot.data['articles'][index]['urlToImage']}"),
                      subtitle: Text(
                          "${snapshot.data['articles'][index]['title']} \n${snapshot.data['articles'][index]['content']}"),
                      isThreeLine: true,
                    ),
                  );
                },
              ),
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

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureFunction();
  }
}
