import 'package:edukaapp/api/api.dart';
import 'package:edukaapp/api/network.dart';

class LikeApi {
  Future favorite(String id) async {
    var url = APIURL.favorite + '/$id';
    ServiceWithHeader service = ServiceWithHeader(url);
    var data = await service.data();
    return data;
  }

  Future disfav(String id) async {
    var url = APIURL.DeleteFav + '/$id';
    ServiceWithDelete service = ServiceWithDelete(url);
    var data = await service.data();
    return data;
  }
}
