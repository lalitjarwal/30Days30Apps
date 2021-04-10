import 'package:flutter/material.dart';

class CreateBlog extends StatefulWidget {
  @override
  _CreateBlogState createState() => _CreateBlogState();
}

class _CreateBlogState extends State<CreateBlog> {
  String authorName, title, desc;

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Flutter",
              style: TextStyle(fontSize: 22),
            ),
            Text(
              "Blog",
              style: TextStyle(fontSize: 22, color: Colors.blue),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Blog Uploaded')));
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.file_upload)),
          )
        ],
      ),
      body: _isLoading
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : Container(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Add a photo')));
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          height: 170,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6)),
                          width: MediaQuery.of(context).size.width,
                          child: Icon(
                            Icons.add_a_photo,
                            color: Colors.black45,
                          ),
                        )),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            decoration:
                                InputDecoration(hintText: "Author Name"),
                            onChanged: (val) {
                              authorName = val;
                            },
                          ),
                          TextField(
                            decoration: InputDecoration(hintText: "Title"),
                            onChanged: (val) {
                              title = val;
                            },
                          ),
                          TextField(
                            decoration: InputDecoration(hintText: "Desc"),
                            onChanged: (val) {
                              desc = val;
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
