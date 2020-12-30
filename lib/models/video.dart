class Video {
  int id;
  String url;
  double duration;
  bool complete;

  Video({this.id, this.url, this.complete = false});
  
  void setComplete() {
    this.complete = true;
  }

  bool getComplete() {
    return this.complete;
  }
}