class GetCourseResponseModel {
  bool? status;
  String? message;
  List<CourseData>? courseData;

  GetCourseResponseModel({this.status, this.message, this.courseData});

  GetCourseResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['course_data'] != null) {
      courseData = <CourseData>[];
      json['course_data'].forEach((v) {
        courseData!.add(CourseData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (courseData != null) {
      data['course_data'] = courseData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CourseData {
  int? coachId;
  int? categoryId;
  String? courseName;
  int? price;
  String? createdAt;
  int? id;
  String? bannerimage;
  String? updateAt;
  String? courseDes;

  CourseData(
      {this.coachId,
      this.categoryId,
      this.courseName,
      this.price,
      this.createdAt,
      this.id,
      this.bannerimage,
      this.updateAt,
      this.courseDes});

  CourseData.fromJson(Map<String, dynamic> json) {
    coachId = json['coach_id'];
    categoryId = json['category_id'];
    courseName = json['course_name'];
    price = json['price'];
    createdAt = json['created_at'];
    id = json['id'];
    bannerimage = json['bannerimage'];
    updateAt = json['update_at'];
    courseDes = json['course_des'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coach_id'] = coachId;
    data['category_id'] = categoryId;
    data['course_name'] = courseName;
    data['price'] = price;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['bannerimage'] = bannerimage;
    data['update_at'] = updateAt;
    data['course_des'] = courseDes;
    return data;
  }
}
