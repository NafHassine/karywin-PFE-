import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../data/data.dart';
import '../../../Models/model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const _padding = 24.0;
  static const _spacing = 10.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 24),
                  header(),
                  const SizedBox(height: 24),
                  searchBar(),
                  const SizedBox(height: 36),
                  categories(),
                  const SizedBox(height: 16),
                  const Model(
                    padding: _padding,
                    spacing: _spacing,
                  ),
                  const SizedBox(height: 20),
                  modelCategories(),
                  const SizedBox(height: 36),
                ],
              ),
            ),
          )),
    );
  }

  Widget appBar() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: _padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            FontAwesomeIcons.barsStaggered,
            color: kSecondaryColor,
            size: 24,
          ),
          Icon(
            FontAwesomeIcons.bell,
            color: kSecondaryColor,
            size: 24,
          ),
        ],
      ),
    );
  }

  Widget header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: _padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Where do',
                  style: TextStyle(
                    color: kSecondaryColor.withOpacity(0.6),
                    fontSize: 22,
                    fontFamily: 'Montserrat',
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'you want to go?',
                  style: TextStyle(
                    color: kSecondaryColor,
                    fontSize: 24,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const CircleAvatar(
            backgroundColor: kAvatarColor,
            radius: 26,
            backgroundImage: AssetImage("assets/images/avatar.png"),
          ),
        ],
      ),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: _padding),
      child: Container(
        height: 46,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: kSecondaryColor.withOpacity(0.1),
        ),
        child: Row(
          children: [
            Icon(
              FontAwesomeIcons.magnifyingGlass,
              color: kSecondaryColor.withOpacity(0.6),
              size: 20,
            ),
            const SizedBox(width: 5),
            Text(
              'Discover a city ',
              style: TextStyle(
                color: kSecondaryColor.withOpacity(0.5),
              ),
            ),
            const Spacer(),
            Icon(
              FontAwesomeIcons.sliders,
              color: kSecondaryColor.withOpacity(0.6),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget categories() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _padding),
          child: Text(
            'Explore Cities',
            style: TextStyle(
              color: kSecondaryColor,
              fontSize: 20,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 5),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _padding),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 10),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget modelCategories() {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: _padding),
            child: Text(
              'Categories',
              style: TextStyle(
                color: kSecondaryColor,
                fontSize: 20,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: [
                  ...List.generate(
                      data_2.length,
                      (i) => Container(
                            margin: const EdgeInsets.only(left: 35),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: const Color(0xffeaeaea),
                                  radius: 26,
                                  backgroundImage:
                                      AssetImage(data_2[i]["image"]),
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  data_2[i]["name"],
                                  style: TextStyle(
                                    color: kSecondaryColor.withOpacity(0.8),
                                    fontSize: 18,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                              ],
                            ),
                          ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
