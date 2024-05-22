import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      
      shrinkWrap: true,
      children: [
        const Padding(padding: EdgeInsets.only(bottom: 5)),
        GestureDetector(
          onTap: () {
            
          },
          child: newsBox(
          'images/news-1.png',
          'Level up with Codelingo!',
          'We have got some amazing strategies to level up your C++ skills and master programming concepts.',
          'May 19'),
          ),
          newsBox(
          'images/news-2.png',
          'Introducing Codelingo!',
          'Discover how Codelingo helps you learn C++ and become proficient in programming.',
          'May 17'),
          newsBox(
          'images/news-3.png',
          'Join the Codelingo Team!',
          'Interested in working with us at Codelingo? Hear from one of our developers about their experience.',
          'May 12'),
          newsBox(
          'images/news-4.png',
          'Code like a Pro!',
          'Explore these handy tips to enhance your C++ coding skills and tackle complex problems like a pro.',
          'May 11'),
          newsBox(
          'images/news-5.png',
          'What is s trending in C++ learning?',
          'Discover the atest trends in C++ education and find out what is capturing the interest of learners.',
          'May 2'),
        const Padding(padding: EdgeInsets.only(top: 15))
      ],
    );
  }

  newsBox(String image, String title, String description, String date) {
    return Container(
      // height: 100,
      margin: const EdgeInsets.only(bottom: 5, top: 15, left: 15, right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 2.5,
          color: const Color(0xFFE5E5E5),
        ),
      ),
      child: Column(
        children: [
          imageBox(image),
          newsTitle(title),
          newsDescription(description),
          newsDate(date),
        ],
      ),
    );
  }

  newsDate(String date) {
    return Container(
      margin: const EdgeInsets.only(left: 15, bottom: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          date,
          style: const TextStyle(
            fontSize: 15,
            // fontWeight: FontWeight.bold,
            color: Color(0xFFAFAFAF),
          ),
        ),
      ),
    );
  }

  newsDescription(String description) {
    return Container(
      margin: const EdgeInsets.only(left: 15, bottom: 10),
      child: Text(
        description,
        style: const TextStyle(
          fontSize: 17,
          // fontWeight: FontWeight.bold,
          color: Color(0xFF777777),
        ),
      ),
    );
  }

  newsTitle(String title) {
    return Container(
      margin: const EdgeInsets.only(left: 15, bottom: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4B4B4B),
          ),
        ),
      ),
    );
  }

  imageBox(String image) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 15, right: 15, left: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 2.5,
          color: const Color(0xFFE5E5E5),
        ),
      ),
      child: Image.asset(
        image,
        height: 150,
        width: double.infinity,
      ),
    );
  }
}
