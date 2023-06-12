// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_web3_provider/ethereum.dart';
import 'package:flutter_web3_provider/flutter_web3_provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key}); // Agregamos key porque es medio obligatorio (en realidad vs studio me lo tiraba como error)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Fondo
      body: SafeArea( // Safe area para q no se enchastre todo
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                '¡Te damos la bienvenida a tu to-do list!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inter',
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Para comenzar, guardamos tu información de forma decentralizada, así que necesitamos que conectes tu wallet',
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Inter',
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () async {
                  final web3 =
                      Web3Provider(await Web3Provider.connectToMetaMask()); // Error acá, hay que chequear las dependencias
                  // Código para conectarse a la wallet
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                child: const Text(
                  'Conectar mi wallet',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Inter',
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
