import 'package:flutter/foundation.dart';
import 'package:video_player/models/topic_model.dart';
import 'package:video_player/models/video.dart';

class TopicRepository extends ChangeNotifier {

  static Map<int, TopicModel> topicList = {
    0: TopicModel(id: 0, name: "Topic0", video: Video(id: 0, url: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",), 
    description: "Introducing Chromecast. The easiest way to enjoy online video and music on your TV. For \$35.  Find out more at google.com/chromecast."),
    1: TopicModel(id: 1, name: "Topic1", video: Video(id: 1, url: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4"),
    description: "Introducing Chromecast. The easiest way to enjoy online video and music on your TV—for the times that call for bigger joyrides. For \$35. Learn how to use Chromecast with YouTube and more at google.com/chromecast."),
    2: TopicModel(id: 2, name: "Topic2", video: Video(id: 2, url: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4"),
    description: "Introducing Chromecast. The easiest way to enjoy online video and music on your TV—for when you want to make Buster's big meltdowns even bigger. For \$35. Learn how to use Chromecast with Netflix and more at google.com/chromecast."),
    3: TopicModel(id: 3, name: "Topic3", video: Video(id: 3, url: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4"),
    description: "Sintel is an independently produced short film, initiated by the Blender Foundation as a means to further improve and validate the free/open source 3D creation suite Blender. With initial funding provided by 1000s of donations via the internet community, it has again proven to be a viable development model for both open 3D technology as for independent animation film.\nThis 15 minute film has been realized in the studio of the Amsterdam Blender Institute, by an international team of artists and developers. In addition to that, several crucial technical and creative targets have been realized online, by developers and artists and teams all over the world.\nwww.sintel.org"),
  };

  void setTopicComplete(int topicId) {
    topicList[topicId].video.setComplete();
    notifyListeners();   
  }

  void getTopicComplete(int topicId) {
    topicList[topicId].video.getComplete();
  }

  Map<int, TopicModel> getTopics() {
    return topicList;
  }
}