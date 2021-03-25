import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderAppBar extends StatelessWidget {
  final Function callBack;
  HeaderAppBar(this.callBack);

  @override
  Widget build(BuildContext context) {
    //横向布局
    return Row(
      children: <Widget>[
        Expanded(
          flex: 0,
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black38,
            onPressed: () {
              print('点击左侧');
            },
          ),
        ),
        //因为它是左右占比结构,所以使用Expanded 的flex
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
                //带有弧度的边框,有背景色
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: Colors.black12,
                        width: 1,
                        style: BorderStyle.solid)),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Row(
                      //常用于Row和Column控件
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.search, color: Colors.black38),
                        SizedBox(width: 10), //常用于两个组件之间的分隔
                        Text(
                          '高考加油',
                          style: TextStyle(color: Colors.black38, fontSize: 12),
                        )
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(Icons.picture_in_picture),
                        color: Colors.black38,
                        onPressed: () {
                          print('点击center图标');
                        },
                      ),
                    )
                  ],
                ),
              )),
        ),
        Expanded(
          flex: 0,
          child: InkWell(
            onTap: () {
              this.callBack('大家好');
            },
            child: IconButton(
              icon: Icon(Icons.menu),
              color: Colors.black38,
              onPressed: () {
                this.callBack('大家好');
                print('点击右边图标');
              },
            ),
          ),
        ),
      ],
    );
  }
}
