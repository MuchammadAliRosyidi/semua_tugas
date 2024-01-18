// ignore: unused_import
import 'package:latihan_object/latihan_object.dart' as latihan_object;

import 'post.dart';

void main(List<String> arguments) {
  List<post>dataPost = [];
  dataPost.add(Article("Bebas"," Muchammad Ali Rosyidi","isi content"));
  dataPost.add(Video("Bebas","rosyid","htpp://youtube.com/",100));

  for (var post in dataPost){
    print(post.render());
    if(post is Video){
      post.play();
    }
  }
}

