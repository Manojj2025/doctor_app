class Message {
  final String text;
  final DateTime date;
  final String sendID;
  final String receiveID;

  Message(this.text, this.date, this.sendID, this.receiveID);

  Message.fromJson(Map<dynamic, dynamic> json)
      : date = DateTime.parse(json['date'] as String),
        text = json['text'] as String,
        sendID = json['sendID'],
        receiveID = json['receiveID'];

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'date': date.toString(),
        'text': text,
        'sendID': sendID,
        'receiveID': receiveID,
      };
}
