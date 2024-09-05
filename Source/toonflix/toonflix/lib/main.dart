import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/currencyCard.dart';


void main() {
  runApp(const App());
}
class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        appBar: AppBar(title: const Text("data"),elevation: 1,),
        
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
          
            child: Column(
          
              crossAxisAlignment: CrossAxisAlignment.start,
          
            children: [
              const SizedBox(height: 10,),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
          
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
          
                    children: [
                      const Text("Hey Naeun", 
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text("Welcome back",
                        style: TextStyle(
                          color : Colors.white.withOpacity(0.7),
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
          
              const SizedBox(height: 10,),
               Text('Total Balance',
                    style: TextStyle(color: Colors.white.withOpacity(0.8)
                    ,fontSize: 22),),
                Text('\$1 234 567',
                    style: TextStyle(color: Colors.white.withOpacity(0.8)
                    ,fontSize: 40,
                    fontWeight: FontWeight.w600),),
                    const SizedBox(height: 10,),
          
                    const Row(
          
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
                      children: [
                        button(text: "Transfer", bgcolor: Colors.amber, txtcolor: Colors.black,),
                        SizedBox(width: 10,),
                        button(text: "Request", bgcolor: Colors.grey, txtcolor: Colors.white,),
                        // Container(
                        //   decoration: BoxDecoration(color: Colors.green,
                        //                                 borderRadius: BorderRadius.circular(25)),
                        //   child: const Padding(
                        //     padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                        //     child: Text('Request',
                        //               style: TextStyle(fontSize: 20,
                        //               color: Colors.white,
                        //               fontWeight: FontWeight.w300),),
                        //   ) 
                        // )
                      ],
                    ),
            
            const SizedBox(height: 20),
             Row(
          
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
              children: [
                const Text("Wallet", style: TextStyle(color: Colors.white,
                                                fontSize: 30,
                                                fontWeight: FontWeight.w600),),
                Text("View all", style: TextStyle(color: Colors.white.withOpacity(0.8),
                                                fontSize: 15,
                                                fontWeight: FontWeight.w100)),
              ],
            ),
            const SizedBox(height: 10,),
            
            Container(
              clipBehavior: Clip.hardEdge,
              decoration:  BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: 
                 Padding(
                  padding: const EdgeInsets.all(30),
                  child: Row(
          
                  mainAxisAlignment:MainAxisAlignment.spaceBetween ,
          
                  children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
          
                    children: [
                      const Text('Euro',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          const Text("6 428",style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),),
                          const SizedBox(width: 5,),
                          Text("EUR",style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 15,
                            fontWeight: FontWeight.w200,)),
                        ],
                      ),
                    ],
                  ),
          
                  Transform.scale(
                    scale: 2.5,
                    child: Transform.translate(
                      offset: const Offset(5,8),
                      child: const Icon(Icons.euro_rounded,
                                color: Colors.white,
                                size: 80,),
                    ),
                  )
                  ],
                  ),
                ),
            ),
            Transform.translate(
              offset: const Offset(0,-40),
              child: const CurrencyCard(inverted: true,
              currencyname: "Bitcoin", 
              currencycode: "BTC", 
              currencyamount: "111", 
              currencyIcon: Icons.currency_bitcoin_rounded)),
             Transform.translate(
              offset: const Offset(0,-80),
              child: const CurrencyCard(inverted: false, 
              currencyname: "Rupee", 
              currencycode: "INR", 
              currencyamount: "222", 
              currencyIcon: Icons.currency_exchange_rounded)
              )
          
            ],
          ),
                ),
        ),
        


        
      ),
    );
  }

}