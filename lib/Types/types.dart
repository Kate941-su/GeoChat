enum EmitEventType {
  sendMsg('sendMsg');

  const EmitEventType(this.eventName);

  final String eventName;
}

enum MessageUserType {
  ownMsg('ownMsg'),
  otherMsg('otherMsg');

  const MessageUserType(this.messageTypeName);

  final String messageTypeName;
}
