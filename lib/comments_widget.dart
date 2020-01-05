import 'package:comments/misc/insets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'model.dart';

class CommentsWidget extends StatelessWidget {
  CommentsWidget(this.comments, {Key key}) : super(key: key);
  final List<Comment> comments;

  @override
  Widget build(BuildContext context) {
    if (comments?.isNotEmpty ?? false)
      return ListView.builder(itemCount: comments.length,
        itemBuilder: (context, idx) => CommentWidget(comments[idx], timeline: idx == 1)
      );
    return Center(child: CircularProgressIndicator());
  }
}

class CommentWidget extends StatelessWidget {

  final Comment comment;
  final bool timeline;
  CommentWidget(this.comment, {this.timeline});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Table(
      columnWidths: {0: IntrinsicColumnWidth(), 1: IntrinsicColumnWidth()},
      children: [
        TableRow(
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.fill,
                child: Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4.0),
                      child: Image.network(comment.user.avatar, width: 46,),
                    ),
                    if (timeline ?? false)
                      Expanded(child:
                      Padding(padding: 4.insets.vert,
                        child: VerticalDivider(width: 1, color: Colors.grey),
                      ),
                      ),
                  ],
                ),
              ),
              TableCell(
                child: SizedBox(width: 10,),
              ),
              TableCell(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(text: comment.user.name, style: textTheme.subhead.copyWith(fontWeight: FontWeight.bold)),
                              TextSpan(text: " "),
                              TextSpan(text: comment.date, style: textTheme.subtitle.apply(color: textTheme.caption.color.withAlpha(125))),
                            ]
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(comment.message, style: textTheme.subhead,),
                      Transform.translate(
                          offset: Offset(-30, -8),
                          child: FlatButton(
                            onPressed: () { },
                            padding: 0.insets.horz,
                            child: Text("Reply", style: textTheme.caption.apply(color: textTheme.caption.color.withAlpha(125))),
                          )
                      ),
                      if (comment.replies?.isNotEmpty ?? false)
                        Column(
                          children: comment.replies.map((c) => CommentWidget(c, timeline: c.user.id == "ell")).toList(growable: false)//timeline: idx == 1)),
                        )
                    ]
                ),
              )
            ]
        )
      ],
    );
  }

}
