import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_notifier/providers/HomePageProvider.dart';
import '';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: ChangeNotifierProvider<HomePageProvider>(
          create: (context) => HomePageProvider(),
          child:
              Consumer<HomePageProvider>(builder: (context, provider, child) {
            return Column(
              children: [
                Text(provider.eligibilityMessage.toString(),
                    style: TextStyle(
                        color: provider.isEligible == true
                            ? Colors.green
                            : Colors.red)),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: 'Enter your age here'),
                  onChanged: (val) {
                    provider.eligibilityCriteria(int.parse(val));
                  },
                ),
                
              ],
            );
          }),
        ),
      ),
    );
  }
}
