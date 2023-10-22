import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstproject/constant.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final Rx<Map<String, dynamic>> _user = Rx<Map<String, dynamic>>({});

  Rx<String> _uid = "".obs;

  updateUserId(String uid) {
    _uid.value = uid;
    getUserData();
  }

  getUserData() async {
    List<String> thumbnails = [];
    var myVideos = await firestore
      .collection('videos')
      .where('uid', isEqualTo: _uid.value)
      .get();

    for (int i = 0; i < myVideos.docs.length; i++) {
      thumbnails.add((myVideos.docs[i].data() as dynamic)['thumbnails']);
    }

    DocumentSnapshot userDoc = 
      await firestore.collection('users').doc(_uid.value).get();
    final userData = userDoc.data()! as dynamic;
    String name = userData['name'];
    String profilePhoto = userData['profilePhoto'];
    int likes = 0;
    int followers = 0;
    int following = 0;
    bool isFollowing = false;

    for(var item in myVideos.docs) {
      likes+= (item.data()['likes'] as List).length;
    }
    var followerDoc = await firestore
      .collection('users')
      .doc(_uid.value)
      .collection('followers')
      .get();
    var followingDoc = await firestore
      .collection('users')
      .doc(_uid.value)
      .collection('following')
      .get();
      followers = followerDoc.docs.length;
      following = followingDoc.docs.length;
  }
}