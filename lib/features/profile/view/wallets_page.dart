import 'package:flutter/material.dart';
import 'package:ozare/features/profile/view/add_wallet_page.dart';

import '../widgets/widgets.dart';

final List<Wallet> wallets = [
  Wallet(
    name: 'Coinbase',
    iconPath: 'assets/images/coinbase_logo.png',
    key: 'Wallet A',
  ),
  Wallet(
    name: 'Sollet',
    iconPath: 'assets/images/sollet_logo.png',
    key: 'Wallet B',
  ),
  Wallet(
    name: 'Solflare',
    iconPath: 'assets/images/solflare_logo.png',
    key: 'Wallet C',
  ),
  Wallet(
    name: 'Ambire',
    iconPath: 'assets/images/ambire_logo.png',
    key: 'Wallet D',
  ),
  Wallet(
    name: 'Slope',
    iconPath: 'assets/images/slope_logo.png',
    key: 'Wallet E',
  ),
];

class PaymentsPage extends StatelessWidget {
  const PaymentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBarProfileSection.singlePage(
          title: 'Wallets',
          appBarAction: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddWallet()));
            },
            child: const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white30,
              child: Icon(Icons.add, color: Colors.white),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => WalletTile(
              wallet: wallets[index],
            ),
            itemCount: wallets.length,
          ),
        )
      ],
    );
  }
}

class Wallet {
  final String name;
  final String iconPath;
  final String key;

  Wallet({
    required this.name,
    required this.iconPath,
    required this.key,
  });
}
