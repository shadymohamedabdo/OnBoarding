import 'package:flutter/material.dart';
import 'package:kian/login/login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class OnBoardingScreen extends StatefulWidget {
   OnBoardingScreen({super.key});
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}
class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> bording = [
    BoardingModel(
        'Asset/bord1.jpg',
        'Rules',
        'The rules is : '
    ),
    BoardingModel(
        'Asset/bord2.jpg',
        'note ',
        'take care'
    ),
    BoardingModel(
        'Asset/bord3.jpg',
        'Guess What?                    you are already here',
        'Welcome'
    ),
  ];
 var bordControll = PageController(); // to navigate the next page
 bool isLast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder:(context)=> login()));
          },
              child: Text('Skip',style: TextStyle(color: Colors.blue,fontSize: 20),)),
          Icon((Icons.skip_next_outlined))
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index){
                  if (index == bording.length-1){
                    isLast = true;
                    setState(() {
                    });
                  }
                  else{
                    isLast = false;
                    setState(() {

                    });
                  }
                },
                physics: BouncingScrollPhysics(),
                controller: bordControll,
                itemBuilder: (context,index)=>buildBordingItem(bording[index]),
                itemCount: bording.length,
              ),
            ),
            Row(children: [
              SmoothPageIndicator(
                controller: bordControll,
                count: bording.length,
                effect: const ExpandingDotsEffect(
                  dotHeight: 16,
                  dotWidth: 16,
                ),
              ),
              Spacer(),
              FloatingActionButton(
                backgroundColor: Colors.blue,
                onPressed: (){
                isLast == true ? Navigator.push(context, MaterialPageRoute(builder:(context)=> login())):
                bordControll.nextPage(
                    duration: Duration(milliseconds: 750),
                    curve: Curves.fastLinearToSlowEaseIn);
              },
              child: Icon(Icons.arrow_back_ios,color: Colors.black,),),
            ],)
          ],
        ),
      )
    );
  }
  Widget buildBordingItem (BoardingModel model) =>  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded
        (child:
      Image(image: AssetImage(model.image))
      ),
      Text(model.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
      SizedBox(height: 15,),
      Text(model.body,style: TextStyle(fontSize: 15),),
    ],
  );
}
//instead of put the variable by my hand
class BoardingModel{
  final String image;
  final String title;
  final String body;
  BoardingModel(this.image, this.title, this.body,);
}
