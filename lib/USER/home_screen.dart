import 'package:flutter/material.dart';
import 'package:parkipay/constant/colors.dart';
import 'package:parkipay/constant/refactoring.dart';

class Home_screen extends StatelessWidget {
   Home_screen({super.key});

   List<String>images=[
     "assets/img.png",
     "assets/img_1.png",
     "assets/img_2.png",
     "assets/img_3.png"

   ];
   List<String>txt=[
     "Nesto",
     "Lulu",
     "Market City",
     "Hilite"
   ];


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.btn1Color,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
          halfContainer(height),
            //SizedBox(height: 10,),
           SizedBox(
             height: height,
             child: GridView.builder(
               shrinkWrap: true,
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              itemCount: images.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 6,
                mainAxisExtent: height/3.5,
                crossAxisSpacing: 6,
                childAspectRatio: 1,
              ),
              itemBuilder: (BuildContext context, int index){
                return Stack(
                  children:[
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(images[index]),
                            fit: BoxFit.cover,
                          )
                      ),
                      ),
                    Positioned(
                      top:171,
                      child: Container(
                        height: height/15,
                        width: width/2.15,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.65),
                        ),

                        alignment: Alignment.center,
                        child: Text(txt[index],style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w600),),
                      ),
                    ),
                  ]

                );
              }
             ),
           )
          ],
        ),
      ),
    );
  }
}
