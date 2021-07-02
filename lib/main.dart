import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const MyHomePage(title: 'Test First APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameController = TextEditingController();
  String fullName = '';
  String temp = '';
  int volume = 0;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          " Home App Bar",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            // Container(height: 20,),
            // SizedBox use
            Container(
                margin: const EdgeInsets.only(left: 8.0, right: 8.0),
                // padding: const EdgeInsets.all(40),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    // border: OutlineInputBorder(),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide:
                          BorderSide(color: Colors.redAccent, width: 0.0),
                    ),
                    // labelText: 'Full Name',
                    hintText: 'Enter Your Name',
                    // helperText: 'Write Your Full Name.',
                  ),
                  onChanged: (text) {
                    setState(() {
                      fullName = text;
                    });
                  },
                )),

            Row(
              children: [
                Container(
                    margin: const EdgeInsets.only(
                        left: 5.0, right: 5.0, top: 10.0, bottom: 10.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.blue,
                      ),
                      onPressed: () {
                        setState(() {
                          temp = fullName;
                        });
                      },
                      child: const Text('Text Button'),
                    )),
                Container(
                    margin: const EdgeInsets.only(
                        left: 5.0, right: 5.0, top: 10.0, bottom: 10.0),
                    // margin: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () {
                        setState(() {
                          temp = fullName;
                        });
                      },
                      child: const Text('Elevated Button'),
                    )),
                Container(
                  margin: const EdgeInsets.only(
                      left: 5.0, right: 5.0, top: 10.0, bottom: 10.0),
                  // margin: const EdgeInsets.all(10.0),
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        temp = fullName;
                      });
                    },
                    child: const Text('Click Me'),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(temp,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.red,
                    )),
                // ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.volume_up, size: 40.0),
                  tooltip: 'Increase volume by 10',
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  onPressed: () {
                    setState(() {
                      if (volume <= 90) {
                        volume += 10;
                      }
                    });
                  },
                ),
                Text(
                    // 'Volume : $volume',
                    '$volume',
                    // textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 40.0,
                      color: Colors.red,
                    )),

                IconButton(
                  icon: const Icon(Icons.volume_down_sharp, size: 40.0),
                  tooltip: 'decrease volume by 10',
                  padding: const EdgeInsets.only(left: 10, right: 30),
                  onPressed: () {
                    setState(() {
                      if (volume >= 10) {
                        volume -= 10;
                      }
                    });
                  },
                ),
                // ),
              ],
            )
          ], // Children 2 end
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            temp = '';
            fullName = '';
            nameController.text = '';
          });
        },
        label: const Text('Floating Action Button'),
        icon: const Icon(Icons.add_reaction_outlined),
        //thumb_up
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
    );
  }
}
