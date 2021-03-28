import 'package:flutter/material.dart';
import 'package:nasa_photo_of_the_day/model.dart';

class NasaHome extends StatefulWidget {
  @override
  _NasaHomeState createState() => _NasaHomeState();
}

class _NasaHomeState extends State<NasaHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NASA Photo of the Day'),
      ),
      body: FutureBuilder(
          future: fetchData(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                print(snapshot.data.toString());
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            children: [
                              Text(
                                'Title: ',
                                textScaleFactor: 1.5,
                                style: TextStyle(color: Colors.blue),
                              ),
                              Text(snapshot.data.title),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue),
                                borderRadius: BorderRadius.circular(12)),
                            child: Image.network(snapshot.data.url)),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            children: [
                              Text(
                                'Date: ',
                                style: TextStyle(color: Colors.blue),
                                textScaleFactor: 1.5,
                              ),
                              Text(snapshot.data.date)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Detail: ',
                            textScaleFactor: 1.50,
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                        Description(snapshot.data.explaination)
                      ],
                    ),
                  ),
                );
              } else
                return Center(child: CircularProgressIndicator());
            } else
              return Center(child: CircularProgressIndicator());
          }),
    );
  }
}

class Description extends StatefulWidget {
  final String data;
  Description(this.data);
  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  bool _showButton = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              child: Text(
            widget.data,
            overflow: _showButton ? TextOverflow.ellipsis : null,
          )),
          _showButton
              ? IconButton(
                  icon: Icon(Icons.arrow_drop_down),
                  onPressed: () {
                    setState(() {
                      _showButton = !_showButton;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.arrow_drop_up),
                  onPressed: () {
                    setState(() {
                      _showButton = !_showButton;
                    });
                  },
                ),
        ],
      ),
    );
  }
}