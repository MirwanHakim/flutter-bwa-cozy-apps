import 'package:bwa_cozy/models/city.dart';
import 'package:bwa_cozy/models/space.dart';
import 'package:bwa_cozy/models/tips.dart';
import 'package:bwa_cozy/provider/space_provider.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:bwa_cozy/widgets/bottom_navbar.dart';
import 'package:bwa_cozy/widgets/city_card.dart';
import 'package:bwa_cozy/widgets/space_card.dart';
import 'package:bwa_cozy/widgets/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
        backgroundColor: whiteColor,
        body: SafeArea(
          bottom: false,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: edge),
            child: ListView(
              children: [
                //NOTE: TITLE/HEADER
                Padding(
                  padding: EdgeInsets.only(
                    left: edge,
                  ),
                  child: Text(
                    'Explore Now',
                    style: blackTextStyle.copyWith(
                      fontSize: 24,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: edge,
                  ),
                  child: Text(
                    'Mencari kosan yang cozy',
                    style: greyTextStyle.copyWith(fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                //NOTE: POPULAR CITY
                Padding(
                  padding: EdgeInsets.only(
                    left: edge,
                  ),
                  child: Text(
                    'Popular City',
                    style: regularTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      CityCard(
                        City(
                          id: 1,
                          name: 'Jakarta',
                          imageUrl: 'assets/images/city1.png',
                          isFavorite: false,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      CityCard(
                        City(
                          id: 2,
                          name: 'Bandung',
                          imageUrl: 'assets/images/city2.png',
                          isFavorite: true,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      CityCard(
                        City(
                          id: 3,
                          name: 'Surabaya',
                          imageUrl: 'assets/images/city3.png',
                          isFavorite: false,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
                //NOTE: RECOMENDED SPACE
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: edge,
                  ),
                  child: Text(
                    'Recomended Space',
                    style: regularTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: edge,
                  ),
                  child: FutureBuilder(
                    future: spaceProvider.getRecommendedSpace(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Space>? data = snapshot.data as List<Space>?;

                        int index = 0;

                        return Column(
                            children: data!.map((e) {
                          index++;
                          return Container(
                            margin: EdgeInsets.only(
                              top: index == 1 ? 0 : 30,
                            ),
                            child: SpaceCard(e),
                          );
                        }).toList());
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
                //NOTE: TIPS AND GUIDENCE
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: edge,
                  ),
                  child: Text(
                    'Tips & Guidence',
                    style: regularTextStyle.copyWith(fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: edge,
                  ),
                  child: Column(
                    children: [
                      TipsCard(
                        Tips(
                          id: 1,
                          title: 'City Guidelines',
                          imageUrl: 'assets/images/tips1.png',
                          updatedAt: '20 Apr',
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TipsCard(
                        Tips(
                          id: 2,
                          title: 'Jakarta Fairship',
                          imageUrl: 'assets/images/tips2.png',
                          updatedAt: '11 Dec',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50 + 24,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Container(
          height: 65,
          width: MediaQuery.of(context).size.width - (2 * edge),
          margin: EdgeInsets.symmetric(
            horizontal: edge,
          ),
          decoration: BoxDecoration(
            // color: Color(0xffF6F7F8),
            color: Colors.white,
            borderRadius: BorderRadius.circular(23),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              BottomNavbarItem(
                imageUrl: 'assets/images/icon_home.png',
                isActive: true,
              ),
              BottomNavbarItem(
                imageUrl: 'assets/images/icon_email.png',
                isActive: false,
              ),
              BottomNavbarItem(
                imageUrl: 'assets/images/icon_card.png',
                isActive: false,
              ),
              BottomNavbarItem(
                imageUrl: 'assets/images/icon_love.png',
                isActive: false,
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
