import 'package:flutter_application_1/src/services/webapi_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // int _count = 0;

  @override
  void initState() {
    super.initState();
    WebApiService().feed();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: const Text("HomePage")),
  //     body:  Container(
  //         child: Column(
  //       children: [
  //         Text("Count: ${_count}"),
  //         IconButton(onPressed: _handleClickAdd, icon: const Icon(Icons.add)),
//         IconButton(
  //             onPressed: _handleClickMinus, icon: const Icon(Icons.remove))
  //       ],
  //     )),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("HomePage"),
        leading: const BackButton(
          color: Colors.white,
          // onPressed: () {
          //   Navigator.pop(context);
          // },
        ),
      ),
      body: Center(
          child: FutureBuilder(
        future: WebApiService().feed(),
        builder: ((context, snapshot) {
          if (snapshot.hasData == false) {
            return const Text("Loading...");
          }

          final youtubes = snapshot.data;

          // Low Performance
          // return Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [...youtubes!.map((e) => Text(e.title))],
          // );

          // Better Performance
          return ListView.builder(
            itemCount: youtubes!.length,
            itemBuilder: ((context, index) {
              return TextButton(
                onPressed: () => print(youtubes![index].title),
                child: Card(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(youtubes![index].title),
                      Image.network(youtubes![index].youtubeImage)
                    ],
                  ),
                ),
              );
            }),
          );
        }),
      )),
    );
  }

  // void _handleClickAdd() {
  //   setState(() {
  //     _count++;
  //   });
  // }

  // void _handleClickMinus() {
  //   setState(() {
  //     _count--;
  //   });
  // }
}
