import 'model.dart';

class CommentsSource {
  static List<Comment> get data => _comments;
}

final Map<String, User> _users = {
  "mat": User(id: "mat", name: "Matt", avatar: "https://pm1.narvii.com/7347/e0499ad9fe2bd858297d998eeb84cbbc3a28dcdbr1-242-248v2_128.jpg"),
  "ell": User(id: "ell", name: "Elliot Fu", avatar: "http://www.web-soluces.net/webmaster/avatar/OsustuffOrg-AvatarMaker-Garcon.jpg"),
  "joe": User(id: "joe", name: "Joe Henderson", avatar: "https://b.thumbs.redditmedia.com/cyvZncBjYQXebbul-abNjTfVlSwkAvTXXH50do8ILSA.png"),
  "jen": User(id: "jen", name: "Jenny Hess", avatar: "https://avatarfiles.alphacoders.com/165/165929.jpg"),
};

final _comments = [
  Comment(id: "abd78a5", user: _users["mat"],
      date: "Today at 5:42PM", message: "How artistic!"),
  Comment(id: "0faf345", user: _users["ell"],
      date: "Yesterday at 12:30AM", message: "This has been very useful for my research! Thanks as well!",
      replies: [
        Comment(id: "f7f7ba6", user: _users["jen"],
            date: "Just now", message: "Elliot you are always so right :)")
      ]
  ),
  Comment(id: "12dda76", user: _users["joe"],
      date: "5 days ago", message: "Dude, this is awesome. Thanks so much"),
];
