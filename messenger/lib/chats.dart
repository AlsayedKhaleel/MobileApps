class MessengerChat {
  String? name;
  String? messageContent;
  String? messageType;
  String? arrivalTime;
  String? imageUrl;
  bool? isonline;

  MessengerChat(this.name, this.messageContent, this.arrivalTime, this.imageUrl);
  
  MessengerChat.fromJason(Map<String, dynamic> chat) {
    name = chat["name"];
    messageType = chat["messageType"];
    messageContent = chat["messageContent"];
    arrivalTime = chat["arrivalTime"];
    imageUrl = chat["imageUrl"];
    isonline = chat["isonline"];
  }
}