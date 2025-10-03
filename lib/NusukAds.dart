import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final String nusukAdsAr = "assets/images/NusukGameAR.png";
final String nusukAdsEn = "assets/images/NusukGameEn.png";

class NusukAds extends StatelessWidget{
  final String linkUrl;
  final String langCode;

  const NusukAds({super.key,required this.linkUrl, required this.langCode});

  @override
  Widget build(BuildContext context) {
    return Material(color: Colors.yellow,child: InkWell(child: SizedBox(
      height: 420,width: 300,
      child:  Stack(
          children: [
             Padding(
                padding: const EdgeInsets.only(left: 7.0,top: 8),
                child: Image.asset(langCode == 'ar'? nusukAdsAr : nusukAdsEn, fit: BoxFit.fill, width: 290, height: 390),
              ),
            Positioned(
              top: 8.0,
              left: 7.0,
              child: Material(
                borderRadius: BorderRadius.circular(18),
                elevation: 2,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.black,
                  child: IconButton(
                    icon: const Icon(Icons.close, size: 16),
                    color: Colors.white,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ),
            ),


          ],
        )
    ),onTap: () async => await openUrl(linkUrl),));
  }

  Future<void> openUrl(String url) async {
    try {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        debugPrint('Could not launch $url');
      }
    } catch (e) {
      debugPrint('Error launching url: $e');
    }
  }
}