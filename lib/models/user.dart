class User {
  late int id;
  late String nickname;

  User({required this.id, required this.nickname});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nickname = json['nickname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nickname'] = this.nickname;
    return data;
  }
}
