import 'package:flutter/material.dart';
import 'package:gemapp/pages/previewlisting.dart';
import 'package:gemapp/widgets/BigBlackButton.dart';
import 'package:gemapp/widgets/text_field.dart';
import 'package:flutter_sticky_widgets/flutter_sticky_widgets.dart';
class FillDetailsScreen extends StatefulWidget {
  final ImageProvider<Object>? image;
  final String category;

  FillDetailsScreen({required this.image, required this.category});

  @override
  _FillDetailsState createState() => _FillDetailsState();
}

class _FillDetailsState extends State<FillDetailsScreen>{


  List<DropTextField> fields = [DropTextField(name: "Description"),DropTextField(name:"Color"),DropTextField(name:"Size"),DropTextField(name:"Packaging")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(width:327,height:310, child:Image(image: widget.image as ImageProvider<Object>)), //TODO make it sticky
            SizedBox(height:20),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: fields.length,
              itemBuilder: (BuildContext context, int index){
                return fields[index];
              },
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: (){
                TextEditingController cont = TextEditingController();
                showDialog( 
                  context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      title: Text("Field Name"),
                      content: Column(children: [TextField(controller: cont)],),
                      actions:[
                        TextButton(
                          child: Text("Add"),
                          onPressed: (){
                            setState(() {
                              fields.add(DropTextField(name: cont.text));
                            });
                            Navigator.pop(context);
                          }
                        ),
                      ]
                    );
                  }
                );
              }, 
              child: Text("Add Field", 
              style: TextStyle(color: const Color.fromARGB(255, 0, 0, 00))), 
              style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(100, 200, 200, 200))
            ),
            SizedBox(height: 30),
            bigBlackButton(name: "Confirm", 
            action: (){
                      var dict = {};
                      for(DropTextField d in fields){
                        dict[d.getName()] = d.get();
                      }
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => FinalReviewScreen(image:widget.image,category:widget.category, details:dict),));
                    }
            ),
          ],
        ),
      ),
    );
  }
}