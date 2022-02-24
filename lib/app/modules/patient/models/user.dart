class User {
  final String id;
  final String name;
  final String email;

  User(this.id, this.name, this.email);

  User.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'] as String,
        name = json['name'],
        email = json['email'];

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'id': id,
        'name': name,
        'email': email,
      };
}

// // class Users {
// //   int? id;
// //   String? username;
// //   List<Message>? message;

// //   Users({this.id, this.username, this.message});

// //   Users.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     username = json['name'];
// //     message = json['message'];
// //     if (json['message'] != null) {
// //       message = <Message>[];
// //       json['message'].forEach((v) {
// //         message?.add(Message.fromJson(v));
// //       });
// //     }
// //   }

// //   Map<String, dynamic> toJson() {
// //     final data = <String, dynamic>{};
// //     data['id'] = id;
// //     data['name'] = username;
// //     data['message'] = message;
// //     if (message != null) {
// //       data['message'] = message?.map((v) => v.toJson()).toList();
// //     }
// //     return data;
// //   }
// // }


// // class User {
// //   Users? users;

// //   User({this.users});

// //   User.fromJson(Map<String, dynamic> json) {
// //     users = json['users'] != null ? Users?.fromJson(json['users']) : null;
// //   }

// //   Map<String, dynamic> toJson() {
// //     final data = <String, dynamic>{};
// //     if (users != null) {
// //       data['users'] = users?.toJson();
// //     }
// //     return data;
// //   }
// // }

// class Users {
//   String? username;
//   String? userid;
//   Messages? messages;

//   Users({this.username, this.userid, this.messages});

//   Users.fromJson(Map<String, dynamic> json) {
//     username = json['username'];
//     userid = json['userid'];
//     messages =
//         json['messages'] != null ? Messages?.fromJson(json['messages']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['username'] = username;
//     data['userid'] = userid;
//     if (messages != null) {
//       data['messages'] = messages?.toJson();
//     }
//     return data;
//   }
// }

// class Messages {
//   DateTime? datetime;
//   String? text;
//   String? sendID;
//   String? recevieID;

//   Messages({this.datetime, this.text, this.sendID, this.recevieID});

//   Messages.fromJson(Map<dynamic, dynamic> json) {
//     datetime = DateTime.parse(json['date'] as String);
//     text = json['text'];
//     sendID = json['sendID'];
//     recevieID = json['recevieID'];
//   }

//   Map<dynamic, dynamic> toJson() {
//     final data = <dynamic, dynamic>{};
//     data['datetime'] = datetime;
//     data['text'] = text;
//     data['sendID'] = sendID;
//     data['recevieID'] = recevieID;
//     return data;
//   }
// }
