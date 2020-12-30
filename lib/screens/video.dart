import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/models/topic_repository.dart';
import 'package:video_player/utils/colors.dart';
import 'package:video_player/utils/size_config.dart';

class Video extends StatefulWidget {
  final id;
  final url;
  final description;

  Video({this.id, this.url, this.description});

  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {

  BetterPlayerController _betterPlayerController;

  Future<void> _showDialog() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Congratulations you are done with 95% of this video',
        style: TextStyle(
          color: CustomColors.darkerGrey
        ),),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[

            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () => Navigator.of(context).pop(),
            color: CustomColors.customGreen,
          )
        ],
      );
    },
  );
}

  @override
  void initState() {
    super.initState();
    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      widget.url
    );
    _betterPlayerController = BetterPlayerController(
      BetterPlayerConfiguration(),
      betterPlayerDataSource: betterPlayerDataSource
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: SizeConfig.safeBlockVertical * 10,
          left: SizeConfig.safeBlockHorizontal * 7,
          right: SizeConfig.safeBlockHorizontal * 7
        ),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16/9,
              child: BetterPlayer(
                controller: _betterPlayerController..videoPlayerController.addListener(() {
                  var position = _betterPlayerController.videoPlayerController.value.position;
                  var duration = _betterPlayerController.videoPlayerController.value.duration;

                  if (position.inMilliseconds == duration.inMilliseconds * 0.9.round()) {
                    
                    print("Completed");
                    _showDialog();
                    Provider.of<TopicRepository>(context, listen: false).setTopicComplete(widget.id);
                   
                  }
                })
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 4
            ),
            Expanded(
              child: Text(
                widget.description
              )
            )
          ],
        ),
      ),
    );
  }
}