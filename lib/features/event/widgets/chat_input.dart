import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ozare/consts.dart';

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
          SvgPicture.asset(
            'assets/icons/face.svg',
            color: Colors.grey,
          ),

          const SizedBox(width: 8),
          // Text Field
          Expanded(
            child: SizedBox(
              height: 52,
              child: TextField(
                cursorColor: primary2Color,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                    left: 12,
                    top: 8,
                    bottom: 10,
                  ),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/attach.svg',
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 22),
                      SvgPicture.asset(
                        'assets/icons/send.svg',
                        color: primary2Color,
                      ),
                      const SizedBox(width: 22),
                    ],
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey[200]!,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Write your message',
                  hintStyle: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey[300]!,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: primary2Color,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
