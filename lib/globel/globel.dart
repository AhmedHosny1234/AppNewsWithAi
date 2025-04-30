import 'package:flutter/material.dart';

late Size mq;

final apikeynews = 'apikey 21QLpOQWo9Dc6gQxfrNtHO:3BHPI38FB0kGru6LZ5MOea';
final String AiApi = 'AIzaSyDC_C7yuE_a0p8j9Xriga1_Tbq9_SN6S9k';

final Promet =
    """Sen bu sohbette bir haber özetleme yardımcısısın. Görevin, sana sunacağım haberleri veya başlıkları doğru ve öz bir şekilde özetlemek ve ardından haberdeki temel noktaları kısaca anlatmaktır.

Sana bir haber veya başlık sunduğumda (İşte haber):
1. **Haberin Özeti:** Haber içinde geçen en önemli bilgileri içeren kısa ve öz bir özet sun.
2. **Haber Hakkında Konuşma:** Haberin ana temasını ve en dikkat çekici olaylarını kısa ve anlaşılır bir şekilde ifade et.

**Önemli Talimat:** Sana sunduğum haberle ilgili **detaylı veya spesifik hiçbir soruya doğrudan cevap verme**. Bu tür sorulara karşılık olarak sadece haberin genel özetini ve ana hatlarını tekrar belirt ve daha fazla ayrıntı veremeyeceğini nazikçe ifade et.


Tüm cevaplarında profesyonel, nesnel ve bilgilendirici bir üslup sürdürmeye özen göster.
İşte haber:
""";

final s =
    """Sana haberler dışındaki herhangi bir soru sorarsam veya başka konularda konuşmanı istersem, kesinlikle şu cevabı vermelisin: "Ben sadece haberleri özetlemek ve onlar hakkında konuşmak için buradayım." veya "Bu sohbetin amacı sadece size sunulan haberleri özetlemek ve ana hatlarını belirtmektir.""";

final String HuggingFace = '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';
String getElapsedTime(DateTime pastTime) {
  DateTime now = DateTime.now().toUtc();

  Duration difference = now.difference(pastTime);

  if (difference.inMinutes < 60) {
    return "${difference.inMinutes} dakika önce";
  } else {
    return "${difference.inHours} saat önce";
  }
}

final List<Map<String, dynamic>> Category_list = [
  {"name": "General", "name_tr": "Genel", "icon": Icons.article},
  {"name": "World", "name_tr": "Dünya", "icon": Icons.public},
  {"name": "Sport", "name_tr": "Spor", "icon": Icons.sports_soccer},
  {"name": "economy", "name_tr": "ekonomi", "icon": Icons.business},
  {"name": "Technology", "name_tr": "Teknoloji", "icon": Icons.devices},
  {"name": "Health", "name_tr": "Sağlık", "icon": Icons.local_hospital},
  {"name": "Entertainment", "name_tr": "Eğlence", "icon": Icons.movie},
  {"name": "Magazine", "name_tr": "dergi", "icon": Icons.newspaper},
];

bool isDarkMode1 = true;
