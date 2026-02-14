class WhatsAppChat {
  String? name;
  String? messageContent;
  String? messageType;
  String? arrivalTime;
  String? imageUrl;

  WhatsAppChat(this.name, this.messageContent, this.arrivalTime, this.imageUrl);
  
  WhatsAppChat.fromJason(Map<String, dynamic> chat) {
    name = chat["name"];
    messageType = chat["messageType"];
    messageContent = chat["messageContent"];
    arrivalTime = chat["arrivalTime"];
    imageUrl = chat["imageUrl"];
  }
}