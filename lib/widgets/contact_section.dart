import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portafolio/constants/colors.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      width: double.maxFinite,
      color: CustomColor.scaffoldBg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Contact",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),

          const SizedBox(height: 20),

          // Contenedor para alinear los contactos (Telegram y Gmail)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Primer Contacto: Telegram
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    "assets/icons/telegram.svg",
                    width: 30,
                    height: 30,
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    "@Alexander_Naranjo",
                    style: TextStyle(
                      fontSize: 18,
                      color: CustomColor.whitePrimary,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: SvgPicture.asset(
                      "assets/icons/gmail.svg",
                      width: 30,
                      height: 30,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    "alex980413@gmail.com",
                    style: TextStyle(
                      fontSize: 18,
                      color: CustomColor.whitePrimary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
