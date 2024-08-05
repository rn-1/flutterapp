import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gemapp/widgets/BigBlackButton.dart';


class Categorizer extends StatefulWidget{  
  final onCompletion;
  Categorizer({required this.onCompletion});

  @override
  _CategorizerState createState() => _CategorizerState();
}

class _CategorizerState extends State<Categorizer>{

  final TextEditingController cat_controller = TextEditingController();


  void insert(String content) {
    var text = cat_controller.text;
    var pos = cat_controller.selection.start;
    print(pos);
    cat_controller.value = TextEditingValue(
      text: text.substring(0 ,((pos==-1) ? 0 : pos)) + content + text.substring((pos==-1) ? 0 : pos),
      selection: TextSelection.collapsed(offset: pos + content.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Container(
          width: 327,
          height:503,
          child:
            ExpansionTile(
              shape: RoundedRectangleBorder(),
              textColor: Colors.black,
              title:Text("Category"), // TODO a container for me please.
              children:[
                TextField(controller: cat_controller),
                SizedBox(),
                ListView( // TODO replace with listview generator based on retrieved categories or available database.
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children:[
                    ElevatedButton(
                      onPressed: (){insert("/Branch");},
                      child: Text("Example/Category", textAlign: TextAlign.left, style: TextStyle(color: Colors.black) ),
                    ),
                  ]
                ),
                
              ],
              childrenPadding: EdgeInsets.symmetric(vertical:9,horizontal:9),
              backgroundColor: Color.fromARGB(255, 217, 217, 217),
            )
          ),
        bigBlackButton(action: () => widget.onCompletion(cat_controller.text), name: "Confirm")
      ]
    );
  }
}