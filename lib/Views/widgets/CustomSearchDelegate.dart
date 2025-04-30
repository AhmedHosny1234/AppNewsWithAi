import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = ""; // يمسح النص داخل شريط البحث
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // يغلق البحث
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(child: Text(" Search : $query"));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions =
        ["Apple", "Banana", "Cherry", "Date", "Eggfruit"]
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            query = suggestions[index];
            showResults(context);
          },
        );
      },
    );
  }
}
