import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeChild extends StatelessWidget {
// const Image(
//   image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
// )
// Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg')

  @override
  Widget build(BuildContext context) {
    //横向布局
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: InkWell(
              //利用InkWell组件包裹其他组件,则拥有了点击事件
              onTap: () {
                print('点击了');
              },
              child: Container(
                //所有组件垂直居中
                alignment: Alignment.center,
                height: 40,
                padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Text(
                      '高考加油',
                      style: TextStyle(color: Colors.black38, fontSize: 12),
                    )
                  ],
                ),
              )),
        ),
      ],
    );
  }
}
