import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('购物车'),
          centerTitle: true,
          backgroundColor: Colors.red,
          brightness: Brightness.dark,
          leading: IconButton(
            icon:Icon(Icons.menu),
            onPressed: (){
              Scaffold.of(context).openDrawer();
            },
          ),
          // 后置控件
          actions: <Widget>[
            // 按钮1
            IconButton(
              icon:Icon(Icons.search),
              onPressed: (){

              },
            ),
            // 按钮2
            IconButton(
              icon:Icon(Icons.settings),
              onPressed: (){

              },
            )
          ],
        ),
        body:ListView(
          children:<Widget>[
            Container(
              height:180,
              color:Colors.blue,
            ),
            Container(
              height:180,
              color:Colors.orange,
            ),
            Container(
              height:180,
              color:Colors.green,
            ),
            Card(
              child:Column(
                children:<Widget>[
                  Container(
                    child:Image( image: NetworkImage( "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4")),
                    padding:const EdgeInsets.only(left:15,right:15,top:15),
                  ),
                  Container(
                    child:Text('图片描述',style: new TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic,color:Colors.white)),
                    margin:const EdgeInsets.all(15),
                  )
                ],
              ),
              color:Colors.orange,
              margin:const EdgeInsets.only(left:15,right:15,top:15),

              elevation: 5,//阴影
          ),
          Card(
              child:Column(
                children:<Widget>[
                  Container(
                    child:Image( image: NetworkImage( "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4")),
                    padding:const EdgeInsets.only(left:15,right:15,top:15),
                  ),
                  Container(
                    child:Text('图片描述',style: new TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic,color:Colors.white)),
                    margin:const EdgeInsets.all(15),
                  )
                ],
              ),
              color:Colors.red,
              margin:const EdgeInsets.only(left:15,right:15,top:15),
              elevation: 5,//阴影
            ),
            Card(
              child:Column(
                children:<Widget>[
                  Container(
                    child:Image( image: NetworkImage( "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4")),
                    padding:const EdgeInsets.only(left:15,right:15,top:15),
                  ),
                  Container(
                    child:Text('图片描述',style: new TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic,color:Colors.white)),
                    margin:const EdgeInsets.all(15),
                  )
                ],
              ),
              color:Colors.orange,
              margin:const EdgeInsets.only(left:15,right:15,top:15),
              elevation: 5,//阴影
            ),
          ],
        )
      ),
    );
  }
}
