import 'package:flutter/material.dart';
import 'package:work_test/common/color.dart';
import 'package:work_test/data/util/topic_util.dart';
import 'package:work_test/presenetation/widget/topic_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.background,
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
              ),
              Text(
                'Gutenberg',
                style: TextStyle(
                    fontSize: 48,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: MyColor.primary),
              ),
              Text(
                'Project',
                style: TextStyle(
                    fontSize: 48,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: MyColor.primary),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'A social cataloging website that allows you to freelt search its database of books, annotions, and reviews.',
                style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    color: MyColor.cardText),
                maxLines: 3,
              ),
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(0),
                  itemCount: TopicUtil.topicList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return TopicCard(
                      topicModel: TopicUtil.topicList[index],
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
