
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_search_app/pages/resault_page.dart';




class SearchPage extends StatelessWidget {
  var _categoryNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: Text('Photo Search By WAS'),
        centerTitle: true,
      ),
      body: Material(
        color: Colors.white,
        child: Center(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(30),
              ),
              Image.asset(
                'assets/images/photobay.png',
                width: 200,
                height: 200,
              ),
              ListTile(
                title: TextFormField(
                  controller: _categoryNameController,
                  decoration: InputDecoration(
                    labelText: 'Enter a Category !! ',
                    hintText: 'eg: dogs , bikes , cats ...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  ),
                ),
                subtitle: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Material(
                      color: Colors.purpleAccent,
                      elevation: 5,
                      borderRadius: BorderRadius.circular(25),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context){
                                  return ResultPage(_categoryNameController.text);
                                }
                            ),
                          );
                        },
                        child: Text(
                          'Search',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}