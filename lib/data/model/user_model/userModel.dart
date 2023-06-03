import 'address_model.dart';
import 'company_model.dart';

class UserModel {
  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"] as int? ?? -1,
    name: json["name"]  as String? ?? "",
    username: json["username"]  as String? ?? "",
    email: json["email"] as String? ?? "",
    address: Address.fromJson(json["address"] as Map<String, dynamic>? ?? {}),
    phone: json["phone"]  as String? ?? "",
    website: json["website"]  as String? ?? "" ,
    company: Company.fromJson(json["company"] as Map<String, dynamic>? ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
    "email": email,
    "address": address.toJson(),
    "phone": phone,
    "website": website,
    "company": company.toJson(),
  };
}



