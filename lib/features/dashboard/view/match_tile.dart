import 'package:flutter/material.dart';

class MatchTile extends StatelessWidget {
  const MatchTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 110,
      width: size.width * 0.8,
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/images/bg.png'),
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.6), BlendMode.hardLight),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 16,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Time Reamining',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Text(
            '15:30',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/logo1.png',
                      height: 66,
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'St. Germain',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                "2 : 1",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/logo2.png',
                      height: 66,
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Man Utd',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
