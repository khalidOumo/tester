import 'package:flutter/material.dart';
import 'package:my_project/Screens/HomeScreen.dart';
import 'package:my_project/constant.dart';
import 'package:my_project/widgets/TobarPage.dart';
import 'package:my_project/widgets/createPageScreen.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  final PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:20.0,top:20.0),
            child: InkWell(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
              },
              child: const Text(
                "Skip",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            //scrollDirection: Axis.vertical,
            onPageChanged:(int page){
              setState(() {
                currentIndex = page;
              });
            },
            controller: pageController,
            children: [
               CreatePageScreen(title:Constants.titleOne,description:Constants.descriptionOne,img: "plant-one.png"),
               CreatePageScreen(title:Constants.titleTwo,description:Constants.descriptionTwo,img: "plant-two.png"),
               CreatePageScreen(title:Constants.titleThree,description:Constants.descriptionThree,img: "plant-three.png"),
            ],
          ),
           Positioned(
            bottom:60,
            left:30,
            child: Row(
              children: _buildIndicator(),
            )
          ),
          Positioned(
            bottom:40,
            right:30,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Constants.primaryColor,
                shape: BoxShape.circle
              ),
              child:IconButton(
                onPressed: (){
                  setState(() {
                    if(currentIndex < 2){
                      currentIndex ++;
                      if(currentIndex < 3){
                        pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                      }
                    }
                    else{
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const TobarPage()));
                    }
                  });
                },
                icon:const Icon(Icons.arrow_forward_ios,color: Colors.white,size:24),
              )
            )
          ),
        ],
      ),
    );
  }

  Widget _indicator(bool isActive){
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    height: 10.0,
    width: isActive ? 20 : 8,
    margin: const EdgeInsets.only(right: 5.0),
    decoration: BoxDecoration(
      color: Constants.primaryColor,
      borderRadius: BorderRadius.circular(5)
    ),
  );
}

List<Widget> _buildIndicator(){
  List<Widget> indicators = [];
  for(int i=0;i<3;i++){
    if(currentIndex == i){
      indicators.add(_indicator(true));
    }
    else{
      indicators.add(_indicator(false));
    }
  }
  return indicators;
}

}

