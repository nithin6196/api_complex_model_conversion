import 'package:api_complex_model_conversion/controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  @override
  void initState() {
    context.read<HomeScreenController>().convertToModel();
    super.initState();
  }

  // fetchData() async {
  //   isLoading = true;
  //   setState(() {});
  //   await Provider.of<HomeScreenController>(context, listen: false)
  //       .convertToModel();
  //   isLoading = false;
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    final homeScreenProvider = Provider.of<HomeScreenController>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // fetchData();
        },
      ),
      // body: isLoading == true
      //     ? const CircularProgressIndicator()
      // :
      body: ListView.separated(
          itemBuilder: (context, index) => UnconstrainedBox(
                child: Container(
                  height: 200,
                  width: 300,
                  color: Colors.red.withOpacity(.5),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(homeScreenProvider.studentModelList[index].name ??
                            ""),
                        Text(homeScreenProvider.studentModelList[index].place ??
                            ""),
                        Text(homeScreenProvider.studentModelList[index].age
                            .toString()),
                        Text(homeScreenProvider.studentModelList[index].ph ??
                            ""),
                        Text(homeScreenProvider.studentModelList[index].batch ??
                            ""),
                      ],
                    ),
                  ),
                ),
              ),
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemCount: homeScreenProvider.studentModelList.length),
    );
  }
}
