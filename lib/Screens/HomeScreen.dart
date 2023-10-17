import 'package:flutter/material.dart';
import 'package:my_project/constant.dart';
import 'package:my_project/model/ModelPlant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
 
class _HomeScreenState extends State<HomeScreen> {

  //list of Plants
  List<Plant> planList = Plant.plantList;

  //Plants Types
  List<String> plantTypes = [
    'Recommended',
    'Indoor',
    'Outdoor',
    'Garden',
    'Supplement',
  ];

  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:Padding(
          padding:const EdgeInsets.only(top: 25,left: 25,bottom: 25),
          child: Column(
            children: [
              //appBar
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Row(
                  children: [
                    const Text(
                      "Home",
                      style: TextStyle(
                        fontSize:30,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: (){},
                      icon: const Icon(Icons.notifications,color: Colors.black54,size:30.0)
                    )
                  ],
                ),
              ),
              const SizedBox(height:35.0),
              //Serach
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  width: double.infinity,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Constants.primaryColorOpacity,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.search)
                      ),
                      const SizedBox(
                        width:200.0,
                        height: 50.0,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search Plant",
                          ),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.voice_chat)
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height:25.0),
              //SliderTypePlante
              SizedBox(
                height: 50.0,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: plantTypes.length,
                  itemBuilder: (context,index){
                    return Padding(
                      padding:const EdgeInsets.only(right: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectIndex = index;
                          });
                        },
                        child: Text(plantTypes[index],
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: selectIndex == index ? FontWeight.bold : FontWeight.w400,
                            color: selectIndex == index ? Constants.primaryColor : Constants.blackColor
                          ),
                        ),
                      )
                    );
                  }
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 300,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: planList.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Container(
                        width:220.0,
                        decoration: BoxDecoration(
                          color: Constants.primaryColorAccent,
                          borderRadius: BorderRadius.circular(20.0)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Stack(
                            children: [
                              Positioned(
                                right:30,
                                left:30,
                                top: 10,
                                child:SizedBox(height:200.0,child: Image.network(planList[index].imageURL),)
                              ),
                              Positioned(
                                right:0,
                                bottom: 0,
                                child:Container(
                                  padding: EdgeInsets.symmetric(horizontal: 6,vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: Text("${planList[index].price} Dh",style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400,
                                      color: Constants.primaryColor
                                    ),),
                                )
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                  width: 60.0,
                                  height: 60.0,
                                  decoration:const  BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle 
                                  ),
                                  child:  Icon(planList[index].isFavorated ? Icons.favorite :Icons.favorite_border_outlined  ,size:30,color: Colors.greenAccent),
                                ),
                              ),
                              Positioned(
                                left:0,
                                bottom:0,
                                child:Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(planList[index].category,style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white70
                                    ),),
                                    SizedBox(height:4.0),
                                    Text(planList[index].plantName,style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                    ),)
                                  ],
                                )
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  })
                ),
              )
              ,const SizedBox(height:20.0),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text("New Plants", 
                style: 
                  TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  )
                ,),
              ),
              const SizedBox(height:20.0),
              
            ]
          ),
        ),
      ),
    );
  }
}