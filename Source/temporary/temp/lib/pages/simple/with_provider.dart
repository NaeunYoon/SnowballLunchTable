import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temp/pages/simple/cnt_controller_with_provider.dart';

class WithProvider extends StatelessWidget {
  const WithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("PROVIDER"),
          //Text(Provider.of<CntControllerWithProvider>(context).cnt.toString()),
          //이쪽만 빌드되게 함
          Consumer<CntControllerWithProvider>
          (
            builder: (context,snapshot,child)
            {
              return Text("${snapshot.cnt}");
            },
          ),
          ElevatedButton(
            onPressed: ()
            {
              Provider.of<CntControllerWithProvider>(context, listen: false).increase();
            }, 
            child: const Text("+"),
          ),
        ],
      ),
    );
  }
}