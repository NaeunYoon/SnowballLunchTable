import 'package:flutter/material.dart';

class WithGetX extends StatelessWidget {
  const WithGetX({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("GETX"),
          const Text("0"),
          ElevatedButton(
            onPressed: (){}, 
            child: const Text("+"),
          ),
        ],
      ),
    );
  }
}