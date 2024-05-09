import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/screens/meetup.dart';
import 'package:share_plus/share_plus.dart';

class MyDescription extends StatefulWidget {
  const MyDescription({super.key});

  @override
  State<MyDescription> createState() => _MyDescriptionState();
}

final List<String> img = [
  "asset/images/bicycle.jpg",
  "asset/images/bulb.jpg",
  "asset/images/cafe.jpg",
  "asset/images/christmas.jpg",
  "asset/images/flowers.jpg",
];
int cur = 0;

class _MyDescriptionState extends State<MyDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Text(
          "Description",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        elevation: 2.0,
        shadowColor: Colors.grey,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                      height: 280,
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Stack(
                              children: [
                                CarouselSlider(
                                  options: CarouselOptions(
                                    height: 230,
                                    viewportFraction: 1,
                                    autoPlay: true,
                                    onPageChanged: (value, reason) {
                                      setState(() => cur = value);
                                    },
                                    enlargeCenterPage: true,
                                    enlargeStrategy:
                                        CenterPageEnlargeStrategy.height,
                                  ),
                                  items: img.map((i) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            // margin: EdgeInsets.symmetric(horizontal: 20.0),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            child: Image.asset(
                                              "$i",
                                              fit: BoxFit.fill,
                                            ));
                                      },
                                    );
                                  }).toList(),
                                ),
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  bottom: 0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: img.asMap().entries.map((entry) {
                                      return GestureDetector(
                                        onTap: () => carouselController
                                            .animateToPage(entry.key),
                                        child: Container(
                                          width: 7, // Dot width
                                          height: 7, // Dot height
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 4),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: cur == entry.key
                                                  ? Colors.white
                                                  : Colors.white54),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Icon(
                                  Icons.save_alt,
                                  color: Colors.blueGrey,
                                ),
                                const Icon(
                                  Icons.bookmark_border_outlined,
                                  color: Colors.blueGrey,
                                ),
                                const Icon(
                                  Icons.favorite_outline,
                                  color: Colors.blueGrey,
                                ),
                                const Icon(
                                  Icons.zoom_out_map_outlined,
                                  color: Colors.black,
                                ),
                                const Icon(
                                  Icons.star_border_outlined,
                                  color: Colors.black,
                                ),
                                InkWell(
                                  child: const Icon(
                                    Icons.share_outlined,
                                    color: Colors.black,
                                  ),
                                  onTap: () {
                                    Share.share(
                                      "Referring the Description",
                                      subject: "Please check this design.",
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.bookmark_border_outlined,
                          color: Colors.blue,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "1034",
                          style: TextStyle(fontSize: 10),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.favorite_outline,
                          color: Colors.blue,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "1034",
                          style: TextStyle(fontSize: 10),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.star_outlined,
                          color: Colors.blue,
                          size: 15,
                        ),
                        const Icon(
                          Icons.star_outlined,
                          color: Colors.blue,
                          size: 15,
                        ),
                        const Icon(
                          Icons.star_outlined,
                          color: Colors.blue,
                          size: 15,
                        ),
                        Icon(
                          Icons.star_outlined,
                          color: Colors.blue.shade100,
                          size: 15,
                        ),
                        Icon(
                          Icons.star_outlined,
                          color: Colors.blue.shade50,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "3.2",
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "Actor Name",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "Indian Actress",
                      style: TextStyle(color: Colors.black54, fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: Colors.black54,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Duration 20 Mins",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 15))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.account_balance_wallet_outlined,
                          color: Colors.black54,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Total Average Fees 9,999",
                          style: TextStyle(color: Colors.black54, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "About",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "From cardiovascular health to fitness, flexibility, balance, stress relief, better sleep, increased cognitive performance, and more, you can reap all of these benefits in just one session out on the waves, So, you may find yourself wondering what are the benefits of going on a surf camp.",
                      style: TextStyle(color: Colors.black54, fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "See More",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        elevation: 4.0,
        shadowColor: Colors.white,
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
