import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/screens/description.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_controller.dart';


final List<String> imgList = [
  "asset/images/m1.jpg",
  "asset/images/m22.jpg",
  "asset/images/m3.jpg"
];
int current = 0;
List<List<String>> cardData = [
  ['asset/images/pen.svg', 'Author', '1,028 Meetups'],
  ['asset/images/team.svg', 'Team', '8 Teams'],
  ['asset/images/mngt.svg', 'Management', '5 Managements'],
  ['asset/images/business.svg', 'Business', '2 Business'],
];

CarouselController carouselController = CarouselController();

class Mymeetup extends StatefulWidget {
  const Mymeetup({super.key});

  @override
  State<Mymeetup> createState() => _MymeetupState();
}

class _MymeetupState extends State<Mymeetup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          "Individual Meetup",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        elevation: 2.0,
        shadowColor: Colors.white,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 30,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Search",
                              style:
                              TextStyle(color: Colors.grey, fontSize: 20),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.mic_none_outlined,
                              color: Colors.black,
                              size: 30,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 180,
                    viewportFraction: 1,
                    autoPlay: true,
                    onPageChanged: (value, reason) {
                      setState(() => current = value);
                    },
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                  ),
                  items: imgList.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            margin: EdgeInsets.symmetric(horizontal: 20.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Image.asset(
                              "$i",
                              fit: BoxFit.fill,
                            ));
                      },
                    );
                  }).toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imgList
                      .asMap()
                      .entries
                      .map((entry) {
                    return GestureDetector(
                      onTap: () => carouselController.animateToPage(entry.key),
                      child: Container(
                        width: 7, // Dot width
                        height: 7, // Dot height
                        margin:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: current == entry.key
                              ? Colors.black
                              : const Color(0x36000000),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Trending Popular People",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  height: 219,
                  child: ListView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        Container(
                          width: 270,
                          padding: EdgeInsets.all(20.0),
                          margin: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    cardData[index][0],
                                    height: 50,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(
                                        cardData[index][1],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        cardData[index][2],
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Divider(
                                thickness: 2,
                              ),
                              Stack(
                                children: [
                                  SizedBox(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    height: 60,
                                  ),
                                  Positioned(
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image:
                                            AssetImage("asset/images/a1.jpg"),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 30,
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image:
                                            AssetImage("asset/images/a2.png"),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 60,
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image:
                                            AssetImage("asset/images/a3.jpg"),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 90,
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration:const BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image:
                                            AssetImage("asset/images/a4.jpg"),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 120,
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration:const BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image:
                                            AssetImage("asset/images/a5.jpg"),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  padding:const EdgeInsets.all(5),
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.indigo,
                                      borderRadius: BorderRadius.circular(
                                          8.0)),
                                  alignment: Alignment.center,
                                  child:const Text(
                                    "See more",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Top Trending Meetups",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: InkWell(
                    child: SizedBox(
                      height: 200,
                      child: ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            Container(
                              width: 150,
                              margin: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                color: Colors.redAccent,
                                image: const DecorationImage(
                                    image: AssetImage(
                                        "asset/images/office.jpg"),
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        bottomRight: Radius.circular(5),
                                      )
                                  ),
                                  child: Text(
                                    "0${index + 1}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) {
                        return MyDescription();
                      },),);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        elevation: 4.0,
        shadowColor: Colors.white,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Icon(Icons.add_home_outlined),
                Text("Home"),
              ],
            ),
            Column(
              children: [
                Icon(Icons.production_quantity_limits),
                Text("Prolet"),
              ],
            ),
            Column(
              children: [
                Icon(
                  Icons.meeting_room_outlined,
                  color: Colors.blue,
                ),
                Text(
                  "Meetup",
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
            Column(
              children: [
                Icon(Icons.travel_explore_outlined),
                Text("Explore"),
              ],
            ),
            Column(
              children: [
                Icon(Icons.account_circle_outlined),
                Text("Account"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
