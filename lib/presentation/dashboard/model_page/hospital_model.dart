class hospitalListModel {
  final String hospitalListName;
  final String hospitalListLocation;
  final String hospitalListImage;
  hospitalListModel({required this.hospitalListName, required this.hospitalListLocation, required this.hospitalListImage});
}

class hospitalProfileReviewModel {
  final String hospitalProfileReviewName;
  final String hospitalProfileReviewDate;
  final String hospitalProfileReviewImage;
  hospitalProfileReviewModel({required this.hospitalProfileReviewName, required this.hospitalProfileReviewDate, required this.hospitalProfileReviewImage});
}

class hospitalDoctorListModel {
  final String hospitalDoctorListName;
  final String hospitalDoctorListHospital;
  final String hospitalDoctorListImage;
  hospitalDoctorListModel({required this.hospitalDoctorListName, required this.hospitalDoctorListHospital, required this.hospitalDoctorListImage});
}