import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCHn--TDGwHgXh1kGuAYHQ8o--CluPhU4o",
            authDomain: "immersion-chat-bot-09jxq9.firebaseapp.com",
            projectId: "immersion-chat-bot-09jxq9",
            storageBucket: "immersion-chat-bot-09jxq9.firebasestorage.app",
            messagingSenderId: "468661835566",
            appId: "1:468661835566:web:085532d26613f6c5b0ccbf"));
  } else {
    await Firebase.initializeApp();
  }
}
