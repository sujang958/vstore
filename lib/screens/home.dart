import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int timeToNext = -1;

  void _calculateTimeToNext() {
    final now = DateTime.now().toUtc();
    final nextChange = now.hour >= 0
        ? DateTime.utc(now.year, now.month, now.day + 1, 0)
        : DateTime.utc(now.year, now.month, now.day, 0);

    setState(() {
      timeToNext =
          (nextChange.millisecondsSinceEpoch - now.millisecondsSinceEpoch);
    });
  }

  @override
  void initState() {
    Timer timer = Timer.periodic(const Duration(milliseconds: 500), ((timer) {
      _calculateTimeToNext();
    }));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "VStores",
                    style: TextStyle(
                      fontSize: 34.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffff4655),
                    ),
                  ),
                  IconButton(
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      enableFeedback: false,
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.add_circled))
                ],
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
              Text(
                // utc am 1:00 change
                "Next Change: ${(timeToNext / 1000 / 60 / 60).floor()}:${(timeToNext / 1000 / 60 % 60).floor()}:${(timeToNext / 1000 % 60).floor()}",
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 16.0)),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  children: [
                    Dismissible(
                      key: Key("fff"),
                      background: Container(
                        color: Colors.red[800],
                        child: const Center(
                          child: Text("Delete"),
                        ),
                      ),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 12.0),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 0.8, color: Colors.white))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Username",
                              style: const TextStyle(
                                  fontSize: 22.0, fontWeight: FontWeight.bold),
                            ),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.0)),
                            Text(
                              "Asia-Pacafic",
                              style: const TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
