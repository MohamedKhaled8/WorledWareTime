import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map receivedData = {};

  void updateReceivedData(Map newData) {
    setState(() {
      receivedData = newData;
    });
  }

  @override
  Widget build(BuildContext context) {
    receivedData = receivedData.isEmpty
        ? ModalRoute.of(context)!.settings.arguments as Map
        : receivedData;
    // receivedData = receivedData.isEmpty
    //     ? ModalRoute.of(context)!.settings.arguments as Map
    //     : receivedData;
    String bgimg = receivedData["status"] ? "day.png" : "night.png";
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(55, 0, 0, 0),
          image: DecorationImage(
            image: AssetImage("assets/$bgimg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/Locatoin');
                  if (result != null) {
                    updateReceivedData({
                      "time": result["time"],
                      "location": result["location"],
                      "status": result["status"],
                    });
                  }
                },
                icon: const Icon(
                  Icons.edit_location,
                  color: Color.fromARGB(255, 255, 129, 129),
                  size: 24.0,
                ),
                label: const Text(
                  "Edit location",
                  style: TextStyle(fontSize: 19),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(146, 90, 104, 223)),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(22)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
                ),
              ),
              const SizedBox(
                height: 300,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 34),
                width: double.infinity,
                color: const Color.fromARGB(55, 0, 0, 0),
                child: Column(
                  children: [
                    Text(
                      receivedData["time"],
                      style: const TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w400,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Text(
                      receivedData["location"],
                      style: const TextStyle(fontSize: 28, color: Colors.white),
                    ),
                    // Text(
                    //   receivedData["location"] ?? "Please Choose a location ✋",
                    //   style: const TextStyle(fontSize: 22, color: Colors.white),
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
