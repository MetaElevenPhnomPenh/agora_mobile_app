/// create_store_request
import 'package:agora/export.dart';

class CreateStoreRequest {
  String avatarId;
  String contactNumber;
  String description;
  String email;
  String name;
  AppSellerType type;
  String websiteUrl;

  CreateStoreRequest({
    required this.avatarId,
    required this.contactNumber,
    required this.description,
    required this.email,
    required this.name,
    required this.type,
    required this.websiteUrl,
  });

  Map<String, dynamic> toJson() =>
      {
        "avatar_id": avatarId,
        "contact_number": contactNumber,
        "description": description,
        "email": email,
        "name": name,
        "type": type.name,
        "website_url": websiteUrl,
      };
}