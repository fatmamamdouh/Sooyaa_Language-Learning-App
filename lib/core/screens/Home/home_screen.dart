import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooyaa_app/core/resources/app_images.dart';

class TravelPage extends StatelessWidget {
  const TravelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Top Bar
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20.r,
                        backgroundImage: AssetImage(AppImages.english),
                      ),
                       Icon(Icons.keyboard_arrow_down,size: 20.w,),
                    ],
                  ),
                  Row(
                    children: [
                       Icon(Icons.local_fire_department_outlined,size: 20.w,),
                       SizedBox(width: 4.w),
                      const Text("0"),
                       SizedBox(width: 12.w),
                       Icon(Icons.star_border,size: 20.w,),
                      const Text("0/20",),
                      const SizedBox(width: 12),
                      const Icon(Icons.bookmark_border),
                      const SizedBox(width: 12),
                      const Icon(Icons.notifications_none),
                    ],
                  ),
                ],
              ),
            ),

            /// Level Dropdown
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    "Intermediate - B1",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.keyboard_arrow_down),
                ],
              ),
            ),

            const SizedBox(height: 8),

            /// Progress Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: FractionallySizedBox(
                      widthFactor: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Row(
                    children: [
                      Text("0%"),
                      Spacer(),
                      Icon(Icons.pets),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 16),

            /// Chapter Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Chapter - 1",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Traveling",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            /// Tabs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  _tab("Listening", true),
                  _tab("Grammar", false),
                  _tab("Vocabulary", false),
                  _tab("Stories", false),
                ],
              ),
            ),

            const SizedBox(height: 12),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("Lessons completed 0/5"),
            ),

            const SizedBox(height: 10),

            /// Lessons List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _lessonItem("We're going on vacation", AppImages.advanced),
                  _lessonItem(
                      "Description of travel experiences", AppImages.advanced),
                  _lessonItem(
                      "Discussing types of vacation", AppImages.advanced),
                  _lessonItem("Trip planning", AppImages.advanced),
                ],
              ),
            ),

            /// Bottom Navigation
            Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Colors.grey.shade300)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(CupertinoIcons.home, size: 30),
                  Icon(Icons.menu_book, size: 30),
                  Icon(Icons.emoji_events_outlined, size: 30),
                  Icon(Icons.person_outline, size: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tab(String title, bool active) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: active ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: active ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _lessonItem(String title, String img) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundImage: AssetImage(img),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          const Icon(Icons.bookmark_border),
        ],
      ),
    );
  }
}
