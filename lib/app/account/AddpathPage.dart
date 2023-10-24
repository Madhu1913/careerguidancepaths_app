import 'package:flutter/material.dart';

class addPathPage extends StatefulWidget {
  const addPathPage({super.key});

  @override
  State<addPathPage> createState() => _addPathPageState();
}

class _addPathPageState extends State<addPathPage> {
  List<Text> data = [];
  final path = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, i) {
                    return Column(
                      children: [
                        Container(
                          height: 60,
                          width: 380,
                          child: Center(child: data[i]),
                          color: Colors.tealAccent,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            Text('|'),
                            Text('|'),
                            Icon(Icons.arrow_downward_outlined),
                          ],
                        )
                      ],
                    );
                  }),
            ),
            SizedBox(
              height: 100,
              width: 380,
              child: TextFormField(
                controller: path,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          data.add(Text(
                            path.text.trim(),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ));
                        });
                        path.clear();
                      },
                      icon: Icon(Icons.send)),
                  hintText: 'Enter your path',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
