import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/get.dart';
import 'package:flutter_application_1/globel/globel.dart';
import 'package:get/get_utils/src/extensions/export.dart';

class Havadurumu extends StatefulWidget {
  const Havadurumu({super.key});

  @override
  State<Havadurumu> createState() => _HavadurumuState();
}

class _HavadurumuState extends State<Havadurumu> {
  List<dynamic> hd = [];

  @override
  void initState() {
    super.initState();

    Getd().fetchusers().then((value) {
      setState(() {
        hd = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          isDarkMode1
              ? Color.fromARGB(255, 12, 46, 80)
              : const Color(0xFF629BF2),

      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text("Hava".tr, style: TextStyle(color: Colors.white)),
        backgroundColor:
            isDarkMode1
                ? Color.fromARGB(255, 12, 46, 80)
                : const Color(0xFF629BF2),
      ),

      body:
          hd.isEmpty
              ? const Center(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(),
                ),
              )
              : SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "Mersin",
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Hava2".tr,
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    SizedBox(
                      height: 210,
                      width: 240,
                      child: Stack(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Image.network(hd[0]['icon'], scale: 3),
                          ),
                          Container(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "${hd[0]['degree'].substring(0, 4)}°",
                              style: const TextStyle(
                                fontSize: 85,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      width: double.infinity,
                      height: mq.height * 0.14,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),

                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${"Hava3".tr} ${hd[0]['description']}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                "${"Hava4".tr} ${hd[0]['humidity']}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                "${"Hava5".tr}  ${hd[0]['min']}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                "${"Hava6".tr} ${hd[0]['max']} °C.",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 80),
                            child: Column(
                              children: [
                                const Icon(
                                  Icons.nights_stay_sharp,
                                  size: 65,
                                  color: Colors.white,
                                ),
                                Text(
                                  "${hd[0]['night'].substring(0, 4)}°C",
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      alignment: Alignment.centerLeft,
                      child: Text("Hava7".tr, style: TextStyle(fontSize: 21)),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 400,
                      child: ListView.builder(
                        itemCount: hd.length,

                        itemBuilder: (context, index) {
                          if (index < hd.length - 1) {
                            index += 1;
                          }
                          return ListTile(
                            leading: CircleAvatar(
                              child: Image.network(hd[index]['icon']),
                            ),

                            title: Text(
                              hd[index]['day'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            subtitle: Text(
                              hd[index]['description'],
                              style: const TextStyle(color: Colors.white),
                            ),
                            trailing: Column(
                              children: [
                                Text(
                                  "${hd[index]['degree'].substring(0, 4)}°",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                  ),
                                ),
                                Text(
                                  "${"Hava4".tr} ${hd[index]['humidity']}%",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
    );
  }
}
