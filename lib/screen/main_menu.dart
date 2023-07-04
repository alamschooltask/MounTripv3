import 'package:flutter/material.dart';
import 'package:flutter_mountrip/Detail/detail_screen.dart';
import 'package:flutter_mountrip/Detail/place_model.dart';
import 'package:flutter_mountrip/screen/booking.dart';
import 'package:flutter_mountrip/screen/massage.dart';
import 'package:flutter_mountrip/screen/profil.dart';
import 'package:google_fonts/google_fonts.dart';

class Mainmenu extends StatelessWidget {
  const Mainmenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int index = 0; // Variabel index untuk mengakses places

    Widget kepala() {
      Widget itemcard(String img, String text, String rating, String lokasi) {
        return Container(
          margin: EdgeInsets.only(bottom: 3),
          padding: EdgeInsets.all(10),
          height: 95,
          width: 400,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 105,
                width: 115,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(img)),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(children: [
                    Image.asset('assets/Star.png'),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      rating,
                      style: GoogleFonts.poppins(
                        color: Color(0xff6F7789),
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ]),
                  SizedBox(
                    height: 5,
                  ),
                  Row(children: [
                    Image.asset('assets/location.png'),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      lokasi,
                      style: GoogleFonts.poppins(
                        color: Color(0xff6F7789),
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ])
                ],
              ),
            ],
          ),
        );
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 22, vertical: 30),
                child: Text(
                  'Top Place',
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                width: 200,
              ),
              Text(
                'View All',
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          itemcard("assets/Semeru2.png", "Mount Semeru", "4.8", "Jawa Timur"),
          SizedBox(height: 20),
          itemcard("assets/Ijen.png", "Mount Ijen", "4.9", "Jawa Timur"),
          SizedBox(
            height: 20,
          ),
          itemcard(
              "assets/TP1.png", "Mount Tangkuban Perahu", "4.7", "Jawa Barat"),
          SizedBox(
            height: 20,
          ),
          itemcard("assets/salak1.png", "Mount Salak", "4.7", "Jawa Barat"),
        ],
      );
    }

    Widget Header() {
      Widget HeaderCard(
        String img,
        String text,
        String rating,
        String lokasi,
        VoidCallback onPressed,
      ) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            margin: const EdgeInsets.only(right: 16),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 6),
                  padding: EdgeInsets.all(10),
                  height: 200,
                  width: 175,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 140,
                        width: 175,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(img)),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            text,
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Image.asset('assets/Star.png'),
                          Text(
                            rating,
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/location.png'),
                              Text(
                                lokasi,
                                style: GoogleFonts.poppins(
                                  color: Color(0xff6F7789),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }

      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
              child: Text(
                'Wonderful Indonesia',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 22),
              child: Text(
                'Explore Your Journey',
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Row(
              children: [
                for (int index = 0; index < places.length; index++)
                  RecommendedCard(
                    placeInfo: places[index],
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            placeInfo: places[index],
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(224),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color(0xff289AED),
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 24,
                    ),
                    Text(
                      'Hello, \nTegar',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer(),
                    Image.asset('assets/ava.png'),
                  ],
                ),
                SizedBox(
                  height: 70,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search your destination",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white, // Set the background color to white
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
              color: Color(0xff289AED),
              borderRadius: BorderRadius.all(Radius.circular(24))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Mainmenu()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.location_pin),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.message_outlined),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.person),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilMenu()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kepala(),
            Header(),
          ],
        ),
      ),
    );
  }
}

class RecommendedCard extends StatelessWidget {
  final PlaceInfo placeInfo;
  final VoidCallback press;

  RecommendedCard({
    Key? key,
    required this.placeInfo,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: HeaderCard(
        img: placeInfo.image,
        text: placeInfo.name,
        rating: placeInfo.rating,
        lokasi: placeInfo.location,
        onPressed: press,
      ),
    );
  }

  Widget HeaderCard({
    required String img,
    required String text,
    required String rating,
    required String lokasi,
    required VoidCallback onPressed,
  }) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 6),
              padding: EdgeInsets.all(10),
              height: 200,
              width: 175,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 140,
                    width: 175,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(img)),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        text,
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Image.asset('assets/Star.png'),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/location.png'),
                          Text(
                            lokasi,
                            style: GoogleFonts.poppins(
                              color: Color(0xff6F7789),
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
