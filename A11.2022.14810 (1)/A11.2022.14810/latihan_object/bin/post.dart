abstract class post{
  String title;
  String author;

  post(this.title, this.author);

  String render();

  String publish (){
    return "judul$title dan penulis$author";
  }
}

class Article extends post {
 String content;
  Article(String title,String author,this.content) : super('title', 'author');
  
  @override
  String render() {
    return """
      ${publish()}
      Content: ${this.content}
      """;
  }
}
class Video extends post {
  String  videoUrl;
  int duration;
  Video(super.title,super.author,this.videoUrl,this.duration);

  @override
  String render() {
    return """
      ${publish()}
      Url: ${this.videoUrl}
      Duration : ${this.duration}
      """;
  }


  
  void play(){
    print("Video dengan judul ${title}diputar dengan durasi $duration detik");
  }
}