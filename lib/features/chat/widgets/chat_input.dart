import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  const ChatInput({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 66,
      width: size.width,
      child: Row(
        children: [
          // Smile Icon
          Icon(
            Icons.tag_faces,
            color: Colors.grey[600],
          ),

          const SizedBox(width: 8),
          // Text Field
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type a message',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey[300]!,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
