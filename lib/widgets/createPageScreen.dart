import 'package:flutter/material.dart';
import 'package:my_project/constant.dart';
 

class CreatePageScreen extends StatelessWidget {
  
  const CreatePageScreen({
    super.key,required this.img,required this.title,required this.description
  });

  final String img;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.only(left: 50,right: 50,bottom: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 350,child: Image.network("assets/$img")),
          const SizedBox(height: 20.0),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Constants.primaryColor,
              fontSize: 30.0,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 20.0),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 20.0,
              fontWeight: FontWeight.w400
            ),
          ),
        ],
      ),
    );
  }
}