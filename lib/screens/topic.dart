import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/models/topic_model.dart';
import 'package:video_player/models/topic_repository.dart';
import 'package:video_player/screens/video.dart';
import 'package:video_player/utils/colors.dart';
import 'package:video_player/utils/size_config.dart';

class Topic extends StatefulWidget {
  @override
  _TopicState createState() => _TopicState();
}

class _TopicState extends State<Topic> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);  
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Player"),
      ),
       body: Container(
         padding: EdgeInsets.only(
            top: SizeConfig.safeBlockVertical * 5,
            left: SizeConfig.safeBlockHorizontal * 7,
            right: SizeConfig.safeBlockHorizontal * 7
          ),
         child: ListView.separated(
           separatorBuilder: (context, index) {
             return SizedBox(height: SizeConfig.safeBlockVertical * 2,);
           },
           itemCount: 4,
           itemBuilder: (context, index) {
             Map<int, TopicModel> topicRepo = Provider.of<TopicRepository>(context).getTopics();
             return InkWell(
               onTap: () {
                 Navigator.of(context).push(MaterialPageRoute(
                   builder: (context) => Video(id: topicRepo[index].id, url: topicRepo[index].video.url, description: topicRepo[index].description,)
                 ));
               },
               child: Container(
                 height: SizeConfig.safeBlockVertical * 30,
                 width: SizeConfig.safeBlockHorizontal * 65,
                 padding: EdgeInsets.only(
                    top: SizeConfig.safeBlockVertical * 3,
                    left: SizeConfig.safeBlockHorizontal * 2,
                    right: SizeConfig.safeBlockHorizontal * 2,
                    bottom: SizeConfig.safeBlockVertical * 3,
                  ),
                  decoration: BoxDecoration(
                    color: topicRepo[index].video.complete
                    ? CustomColors.customGreen
                    : CustomColors.darkGrey,
                    borderRadius: BorderRadius.circular(SizeConfig.safeBlockVertical * 3)
                  ),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     SizedBox(height: SizeConfig.safeBlockVertical * 2),
                     Row(
                       children: [
                         Text(
                           topicRepo[index].name,
                           style: TextStyle(
                             fontSize: SizeConfig.safeBlockVertical * 4
                           ),
                         )
                       ]
                     )
                   ],
                 ),
               ),
             );
           }
         ),
       ),
    );
  }
}