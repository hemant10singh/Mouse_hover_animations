import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  Offset _position_2= Offset.zero;
  Offset _position_1= Offset.zero;
  Offset middlepoint=Offset.zero;
  Offset _setposition=Offset.zero;
  Offset _setposition_1=Offset.zero;
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text("Eye following animation"),
      ),
      body:
             Stack(
               children: 
               [
             Container(
             height: 100,
              width: double.infinity,
              color: Colors.yellow,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 200),
              
              child: Align
            (  alignment: Alignment.centerRight,
                child: MouseRegion
                (
                   
                  child: Stack(
                    children: [
                      Positioned(
                        left: (_position_1).dx.clamp(0,MediaQuery. of(context). size. width-100),    //change
                        top:_position_1.dy.clamp(0, 0),
                        child: Container(
                          
                          width: 100,
                          height: 100,
                          
              
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            
                
                          ),
                        ),
                      ),
                    ],     
                  ),
                ),
              ),
               ),
                Center(
                 child: Container(
                   width: 200,
                   height:200,
                   child: MouseRegion(
                      onHover: (event){
                        Offset middlepoint=Offset(25, 25);
                        setState(() {
                          double screenWidth = MediaQuery. of(context). size. width;
                          _position_2=event.localPosition-middlepoint;
                          _position_1= Offset(screenWidth*_position_2.dx/150,  0);     //change
                        });
                      },
                       child: Container(
                        color: Colors.green,
                         child: Stack(
                              children: [
                                Positioned(
                                    left:  _position_2.dx.clamp(0,150),      
                                    top:_position_2.dy.clamp(0, 150),
                                    child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle,
                                ),
                              ),
                             )
                            ],
                          ),
                       ), 
                        ),
                        ),
                      ),
                    ],
             ),
    );
  }
}


//  Column(
        //    children: [
        //     // MouseRegion(
        //     //   onHover: (event){
        //     //         Offset middlepoint=Offset(50, 50);
        //     //         setState(() {
        //     //           _position=event.localPosition-middlepoint;
        //     //         });
        //     //       },
        //       child: Container(
        //       height: 100,
        //       width: double.infinity,
        //       color: Colors.yellow,
        //       margin: const EdgeInsets.fromLTRB(0, 0, 0, 200),
        //       child: Stack(
        //         children: [
        //           Positioned(
        //             left: (_position).dx.clamp(0,double.infinity),    //change
        //             top:_position.dy.clamp(0, 0),
        //             child: Container(
        //               width: 100,
        //               height: 100,
        //               decoration: const BoxDecoration(
        //                 color: Colors.black,
        //               ),
        //             ),
        //           ),
        //         ],     
        //       ),
        //       ),
        //     ),