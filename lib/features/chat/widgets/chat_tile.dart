import 'package:flutter/material.dart';
import 'package:ozare/consts.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 1, 1, 1),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: size.width * 0.4,
                  child: Row(
                    children: const [
                      // User Avatar
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: primary1Color,
                        child: CircleAvatar(
                          radius: 24,
                          backgroundImage: AssetImage('assets/images/user.png'),
                        ),
                      ),

                      // User Name
                      SizedBox(width: 8),
                      Text(
                        'Tomer',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                width: size.width * 0.2,
                child: const Center(
                  child: Text(
                    "4 TON",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.2,
                child: Center(
                  child: Image.asset(
                    'assets/images/token.png',
                    height: 28,
                  ),
                ),
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
