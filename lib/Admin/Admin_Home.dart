import 'package:flutter/material.dart';
import 'package:parkipay/Admin/Add_HomeScreen.dart';

import '../constant/colors.dart';
import '../constant/refactoring.dart';

class AdminHome extends StatelessWidget {
  AdminHome({super.key});
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.bgColor,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddHomeScreen(),));
        },
        child: Icon(Icons.add,color: Colors.white,),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            quarterContainerWithIcon(height, width, "Home Screen"),
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
            ),
          ],
        ),
      ),
    );
  }
}
