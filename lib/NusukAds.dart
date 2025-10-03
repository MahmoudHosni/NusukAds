import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

final String nusukAdsAr = "assets/images/NusukGameAR.svg";
final String nusukAdsEn = "assets/images/NusukGameEn.svg";

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
           Align(alignment: Alignment.topLeft,child:  IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => { openUrl(linkUrl) },
            ),),
            SvgPicture.asset(langCode=='ar'? nusukAdsAr : nusukAdsEn ,fit: BoxFit.cover,),
          ],
        )
      ),
    );
  }

  void openUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      // can't launch url, there is some error
      throw "Could not launch $url";
    }
  }
}