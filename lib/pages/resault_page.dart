import 'package:flutter/material.dart';
import 'package:photo_search_app/src/api_client.dart';


class ResultPage extends StatefulWidget {

  final String searchText;

  ResultPage(this.searchText);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: Text('Photo Search By WAS'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getPics(widget.searchText),
        builder: (context, snapShot) {
          Map data = snapShot.data;
          if (snapShot.hasError) {
            print(snapShot.error);
            return Text(
              'Failed to get response from the server !!',
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 22),
            );
          } else if (snapShot.hasData) {
            return Center(
              child: ListView.builder(
                itemCount: 10 ,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      constraints: BoxConstraints.tightFor(width: 0 , height: 200),
                          child: ListTile(
                            contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                            title: Image.network(
                                '${data['hits'][index]['largeImageURL']}' ,
                              fit: BoxFit.fitWidth ,
                            ),
                          ),
                    ),
                  );
                },
              ),
            );
          } else if (!snapShot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        },
      ),
    );
  }
}
