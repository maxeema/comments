import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'comments_widget.dart';
import 'misc/insets.dart';
import 'model.dart';

class CommentsPage extends StatelessWidget {
  CommentsPage(this.data, {Key key}) : super(key: key);

  final List<Comment> data; // Just stub for now

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Comments", style: Theme.of(context).textTheme.subhead.copyWith(fontWeight: FontWeight.bold)),
          SizedBox(height: 4,),
          Divider(height: 1, color: Colors.grey,),
          SizedBox(height: 16,),
          Expanded(
            child: CommentsWidget(data),
          ),
          SizedBox(height: 16,),
          SizedBox(
            height: 75,
            child: TextField(
              expands: true,
              minLines: null, maxLines: null,
              decoration: InputDecoration(
                filled: true, fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.withAlpha(150))),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
          ),
          SizedBox(height: 10,),
          RaisedButton(
            padding: 0.insets.all,
            onPressed: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: 8.insets.all,
                  child: Icon(Icons.edit),
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(20),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(4), bottomLeft: Radius.circular(4)),
                  ),
                ),
                Container(
                  padding: 12.insets.horz,
                  child: Text("Add Reply", style: TextStyle(fontWeight: FontWeight.bold),)
                )
              ],
            ),
//              label:
          ),
        ],
      ),
    );
  }
}