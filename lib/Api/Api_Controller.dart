// controllers/post_controller.dart


import 'package:get/get.dart';
import 'package:post_api/Api/Api_Model.dart';
import 'package:post_api/Api/Api_Service.dart';

class ApiController extends GetxController {
  var postList = <ApiModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      var posts = await ApiService().fetchPosts();
      postList.value = posts.where((post) => post.strAlbum3DCase.isNotEmpty).toList();
    } finally {
      isLoading(false);
    }
  }
}
