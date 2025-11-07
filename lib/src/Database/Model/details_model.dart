class DetailsModel {
  int? id;
  String name;
  String address;
  String mobile;

  DetailsModel({
    this.id,
    required this.name,
    required this.address,
    required this.mobile,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'address': address, 'mobile': mobile};
  }

  factory DetailsModel.fromMap(Map<String, dynamic> map) {
    return DetailsModel(
      id: map['id'],
      name: map['name'],
      address: map['address'],
      mobile: map['mobile'],
    );
  }
}