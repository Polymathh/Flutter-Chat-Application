import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getMessages(){
    return _firestore.collection('messages').orderBy('timestamp').snapshots();
  }

  Future<void>sendMessage(String message, String senderId) async{
    await _firestore.collection('messages').add({
      'text': message,
      'senderId': senderId,
      'timestamp': FieldValue.serverTimestamp(),
      'read': false,
    });
  }
}