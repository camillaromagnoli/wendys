import 'package:json_annotation/json_annotation.dart';
import 'package:wendys/features/menu/data/model/menu_lists_model.dart';

part 'get_site_menu_response.g.dart';

@JsonSerializable()
class GetSiteMenuResponse {
  GetSiteMenuResponse({
    required this.menuLists,
  });

  final MenuListsModel menuLists;

  factory GetSiteMenuResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSiteMenuResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetSiteMenuResponseToJson(this);
}
