import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      title: 'Material App',
      home: ReorderableViewPage(),
    );
  }
}

class ReorderableViewPage extends StatefulWidget {
  final List<String> item = [
    "Apple ",
    "Banana",
    "Carot",
    "Dog",
    "Elephant",
    "Flower",
    "Gun",
    "Hut",
    "Ink",
    "Jack",
    "Knight"
  ];
  @override
  _ReorderableViewPageState createState() => _ReorderableViewPageState();
}

class _ReorderableViewPageState extends State<ReorderableViewPage> {
  void reorderData(int oldindex, int newindex) {
    setState(() {
      if (newindex > oldindex) {
        newindex -= 1;
      }
      final items = widget.item.removeAt(oldindex);
      widget.item.insert(newindex, items);
    });
  }

  void sorting() {
    setState(() {
      widget.item.sort();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Reorderable ListView In Flutter",
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.sort_by_alpha),
              tooltip: "Sort",
              onPressed: sorting),
        ],
      ),
      body: ReorderableListView(
        padding: const EdgeInsets.all(12.0),
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          for (final items in widget.item)
            Card(
              color: Colors.blueGrey,
              key: ValueKey(items),
              elevation: 2,
              child: ListTile(
                title: Text(
                  items,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.autorenew,
                  color: Colors.black,
                ),
              ),
            ),
        ],
        onReorder: reorderData,
      ),
    );
  }
}
