import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';

class ListCeHuaDel extends StatefulWidget {
  const ListCeHuaDel();
  @override
  ListCeHuaDelState createState() => ListCeHuaDelState();
}

class Model {
  String id = UniqueKey().toString();
  int index = 0;

  @override
  String toString() {
    return index.toString();
  }
}

class ListCeHuaDelState extends State<ListCeHuaDel> {
  SwipeActionController controller = SwipeActionController();
  List<Model> list = [];
  @override
  void initState() {
    super.initState();
    list = List.generate(30, (index) {
      return Model()..index = index;
    });
    controller = SwipeActionController(selectedIndexPathsChangeCallback:
        (changedIndexPaths, selected, currentCount) {
      print(
          'cell at ${changedIndexPaths.toString()} is/are ${selected ? 'selected' : 'unselected'} ,current selected count is $currentCount');

      setState(() {});
    });
  }

  Widget bottomBar() {
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: CupertinoButton.filled(
                  padding: EdgeInsets.only(),
                  child: Text('open cell at 2'),
                  onPressed: () {
                    controller.openCellAt(
                        index: 2, trailing: true, animated: true);
                  }),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: CupertinoButton.filled(
                  padding: EdgeInsets.only(),
                  child: Text('switch edit mode'),
                  onPressed: () {
                    controller.toggleEditingMode();
                  }),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomBar(),
      appBar: AppBar(
        title: Text("侧滑删除"),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _item(context, index);
        },
      ),
    );
  }

  Widget _item(BuildContext ctx, int index) {
    return SwipeActionCell(
      controller: controller,
      index: index,
      key: ValueKey(list[index]),

      ///animation default value below...
      normalAnimationDuration: 500,
      deleteAnimationDuration: 400,
      performsFirstActionWithFullSwipe: true,
      trailingActions: [
        SwipeAction(
            title: "delete",
            nestedAction: SwipeNestedAction(title: "confirm"),
            onTap: (handler) async {
              await handler(true);

              list.removeAt(index);
              setState(() {});
            }),
        SwipeAction(title: "action2", color: Colors.grey, onTap: (handler) {}),
      ],
      leadingActions: [
        SwipeAction(
            title: "delete",
            onTap: (handler) async {
              await handler(true);
              list.removeAt(index);
              setState(() {});
            }),
        SwipeAction(
            title: "action3", color: Colors.orange, onTap: (handler) {}),
      ],
      child: GestureDetector(
        onTap: () {
          Scaffold.of(ctx)
            ..showSnackBar(SnackBar(
              content: Text(
                'tap',
              ),
              duration: const Duration(seconds: 1),
            ));
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text("This is index of ${list[index]}",
              style: TextStyle(fontSize: 25)),
        ),
      ),
    );
  }
}
