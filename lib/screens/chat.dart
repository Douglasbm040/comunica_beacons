import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CHAT"),
        ),
        body: Column(
          children: [
            ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return const Text("A");
              },
            ),
            Container(
              color: Colors.amber,
              child: const TextField(),
            )
          ],
        ));
  }
}
