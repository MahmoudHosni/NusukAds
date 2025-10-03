import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NusukAds extends StatelessWidget{
  final String linkUrl;
  final String langCode;

  const NusukAds({super.key,required this.linkUrl, required this.langCode});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 300,width: 280,
      child: Center(
        child: Stack(
          children: [
            SvgPicture.asset(langCode=='ar'?"assets/images/NusukGameAR.svg":"assets/images/NusukGameEN.svg",fit: BoxFit.contain,width: double.infinity,),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => {},
            ),
          ],
        )
      ),
    );
  }
}