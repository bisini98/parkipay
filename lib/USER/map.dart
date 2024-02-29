import 'package:flutter/material.dart';
import 'package:parkipay/constant/colors.dart';
import 'package:parkipay/constant/refactoring.dart';

class MapPage extends StatefulWidget {
  MapPage({super.key});


  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage>
    with TickerProviderStateMixin
{

  late TabController tabController;

  List<String>text=[
    "D1",
    "D2",
    "D3",
    "D4",
    "D5",
    "D6",
    "D7",
    "D8",
    "D9",
    "D10"
  ];
  List<String>text1=[
    "A10",
    "A9",
    "A8",
    "A7",
    "A6",
    "A5",
    "A4",
    "A3",
    "A2",
    "A1"
  ];

  @override
  void initState(){
    tabController=TabController(length: 3, vsync: this);
    //TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.btn1Color,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: AppBar(
          backgroundColor: AppColors.bgColor,
          leading: Icon(Icons.arrow_back_ios_rounded,color: Colors.white,size: 20,),
          centerTitle: true,
          title: Text("Map",style: TextStyle(color: Colors.white),),
          
          bottom: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              controller: tabController,
              tabs: [
                Tab(
                  text: "Floor 1",
                ),
                Tab(
                  text: "Floor 2",
                ),
                Tab(
                  text: "Floor 3",
                ),
              ]
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                mapSpotContainer(height, width),
                SizedBox(
                  height: height/10,
                  child: ListView.builder(
                    itemCount: text.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: ScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: mapListContainer(height, width,text[index]),
                      );
                    },
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/Entrance.png"),
                          Icon(Icons.arrow_forward_sharp,color: AppColors.bgColor,)
                        ],
                      ),
                      SizedBox(height: 5,),
                      Text("Entrance",style: TextStyle(color: AppColors.bgColor),)
                    ],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      height: height/2,
                      width: width/4,
                      child: ListView.builder(
                        itemCount: text1.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: mapListContainer(height, width,text1[index]),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: height/2,
                      width: width/4,
                      child: ListView.builder(
                        itemCount: text1.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: mapListContainer(height, width,text1[index]),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: height/2,
                      width: width/4,
                      child: ListView.builder(
                        itemCount: text1.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: mapListContainer(height, width,text1[index]),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: height/2,
                      width: width/4,
                      child: ListView.builder(
                        itemCount: text1.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: mapListContainer(height, width,text1[index]),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height/10,
                  child: ListView.builder(
                    itemCount: text.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: ScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: mapListContainer(height, width,text[index]),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                mapSpotContainer(height, width),
                SizedBox(
                  height: height/10,
                  child: ListView.builder(
                    itemCount: text.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: ScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: mapListContainer(height, width,text[index]),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/Entrance.png"),
                          Icon(Icons.arrow_forward_sharp,color: AppColors.bgColor,)
                        ],
                      ),
                      SizedBox(height: 5,),
                      Text("Entrance",style: TextStyle(color: AppColors.bgColor),)
                    ],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      height: height/2,
                      width: width/4,
                      child: ListView.builder(
                        itemCount: text1.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: mapListContainer(height, width,text1[index]),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: height/2,
                      width: width/4,
                      child: ListView.builder(
                        itemCount: text1.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: mapListContainer(height, width,text1[index]),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: height/2,
                      width: width/4,
                      child: ListView.builder(
                        itemCount: text1.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: mapListContainer(height, width,text1[index]),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: height/2,
                      width: width/4,
                      child: ListView.builder(
                        itemCount: text1.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: mapListContainer(height, width,text1[index]),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height/10,
                  child: ListView.builder(
                    itemCount: text.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: ScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: mapListContainer(height, width,text[index]),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                mapSpotContainer(height, width),
                SizedBox(
                  height: height/10,
                  child: ListView.builder(
                    itemCount: text.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: ScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: mapListContainer(height, width,text[index]),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/Entrance.png"),
                          Icon(Icons.arrow_forward_sharp,color: AppColors.bgColor,)
                        ],
                      ),
                      SizedBox(height: 5,),
                      Text("Entrance",style: TextStyle(color: AppColors.bgColor),)
                    ],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      height: height/2,
                      width: width/4,
                      child: ListView.builder(
                        itemCount: text1.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: mapListContainer(height, width,text1[index]),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: height/2,
                      width: width/4,
                      child: ListView.builder(
                        itemCount: text1.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: mapListContainer(height, width,text1[index]),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: height/2,
                      width: width/4,
                      child: ListView.builder(
                        itemCount: text1.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: mapListContainer(height, width,text1[index]),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: height/2,
                      width: width/4,
                      child: ListView.builder(
                        itemCount: text1.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: mapListContainer(height, width,text1[index]),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height/10,
                  child: ListView.builder(
                    itemCount: text.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: ScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: mapListContainer(height, width,text[index]),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          ])
    );
  }
}
