import 'dart:async';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:ozare/common/dialogs/alert_dialog.dart';
import 'package:ozare/features/profile/repository/tonkeeper_repository.dart';
import 'package:url_launcher/url_launcher.dart';

final List<Map<String, dynamic>> wallets = [
  {
    'name': "Wallet",
    'iconPath': "assets/images/wallet.png",
  },
  {
    'name': "TON Wallet",
    'iconPath': "assets/images/tonwallet.png",
  },
  {
    'name': "Tonkeeper",
    'iconPath': "assets/images/tonkeeper.png",
  },
  {
    'name': "Coin98",
    'iconPath': "assets/images/coin98.png",
  },
];

class AddWallet extends StatefulWidget {
  const AddWallet({super.key});

  @override
  State<AddWallet> createState() => _AddWalletState();
}

class _AddWalletState extends State<AddWallet> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // _sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          'Add New Wallet',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Which Wallet\nyou want to add?",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: wallets
                  .map(
                    (wallet) => WalletSelector(
                  name: wallet['name'],
                  iconPath: wallet['iconPath'],
                ),
              )
                  .toList(),
            ),
          ),
        ]),
      ),
    );
  }
}

class WalletSelector extends StatelessWidget {
  const WalletSelector({
    super.key,
    required this.name,
    required this.iconPath,
  });

  final String name;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () async {
        if (name.toLowerCase() == 'TON Wallet'.toLowerCase() ||
            name.toLowerCase() == 'Tonkeeper'.toLowerCase()) {
          var url = Uri.parse(
              'https://tonapi.io/login?return_url=https://ozare.page.link/?link=https://ozare-e8ed6.firebaseapp.com&apn=com.example.ozare');
          // var url = Uri.parse(
          //     'https://tonapi.io/login?return_url=https://ozare.page.link/walletAuth');
          if (await canLaunchUrl(url)) {
            launchUrl(url, mode: LaunchMode.externalApplication);
            FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
              showAlertDialog(context: context, title: 'Success', content: 'Wallet connected successfully');
              print(dynamicLinkData.link.toString());
            }).onError((error) {
            });
          }
        }
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: size.width * 0.4,
              height: size.width * 0.28,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[200],
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  name,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 12,
            child: Image.asset(
              iconPath,
              height: size.width * 0.24,
            ),
          ),
        ],
      ),
    );
  }
}
