import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/get.dart';

class Namazpage extends StatefulWidget {
  const Namazpage({super.key});

  @override
  State<Namazpage> createState() => _NamazpageState();
}

class _NamazpageState extends State<Namazpage> {
  List<dynamic> NV = [];

  List<dynamic> NVimges = [
    "assets/images/6599957.png",
    "assets/images/3951777.png",
    "assets/images/1150199.png",
    "assets/images/4067469.png",
    "assets/images/3951784.png",
    "assets/images/8507192.png",
  ];
  @override
  initState() {
    super.initState();
    Getd().namaz().then((value) {
      setState(() {
        NV = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Namaz Vakitleri")),
      body:
          NV.isEmpty
              ? const Center(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(),
                ),
              )
              : Column(
                children: [
                  Container(
                    child: const Image(
                      image: AssetImage(
                        "assets/images/d4f7a4ffa1f8089eaa81b2f00a9e4e34.jpg",
                      ),
                      height: 180,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Expanded(
                    child: ListView.builder(
                      itemCount: NV.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            child: Image(image: AssetImage(NVimges[index])),
                          ),
                          title: Text(
                            NV[index]['vakit'],
                            style: const TextStyle(fontSize: 24),
                          ),
                          trailing: Text(
                            NV[index]['saat'],
                            style: const TextStyle(fontSize: 18),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
    );
  }
}
