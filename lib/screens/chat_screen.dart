import 'package:flutter/material.dart';
import 'package:yes_no_app/widgets/buddy_message_bubble.dart';
import 'package:yes_no_app/widgets/field_box.dart';
import 'package:yes_no_app/widgets/my_message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://static.wikia.nocookie.net/doblaje/images/c/cb/SpongeBob.png/revision/latest?cb=20220925230116&path-prefix=es',
            ),
          ),
        ),
        title: const Text('Bob 😎'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return index % 2 == 0
                      ? const MyMessageBubble()
                      : const BuddyMessageBubble();
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: FieldBox(),
            )
          ],
        ),
      ),
    );
  }
}
