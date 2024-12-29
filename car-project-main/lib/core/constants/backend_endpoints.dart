abstract class BackendEndpoints {
  static const String kUsers = 'users';
}
class Services {
  static String baseUrl = "https://my-school-app.com/api/";
  static String baseUrl2 = "https://my-school-app.com";
  static String logInEndPoint = "login"; //Post
  static String signUpEndPoint = "signup";//Post
  static String editUserDataEndPoint = "signup2";//Post
  static String schoolListEndPoint = "schools";//Post
  static String searchSchoolListEndPoint = "schools_search";//Post
  static String schoolDetailsEndPoint = "schools_view";//Post
  static String getSchoolIdsEndPoint = "student_parent_info";//Post
  static String countriesCodesEndPoint = "countries";//Post
  static String kidsListEndPoint = "parent_students";//Post
  static String schoolTapsEndPoint = "schools_department";//Post
  static String schoolsTypeFilterEndPoint = "schools_type";//Post
  static String schoolsStageFilterEndPoint = "schools_area";//Post
  static String schoolsZoneFilterEndPoint = "schools_levels";//Post
  static String sendingMessageToSchoolEndPoint = "school_member_req";//Post
  static String editingPasswordEndPoint = "change_password";//Post
  static String getPostsEndPoint = "post_view";//Post
  static String getPostDataEndPoint = "post_view1";//Post
  static String getPersonDataEndPoint = "student_parent_info";//Post
  static String addPostsEndPoint = "post_new";//Post
  static String getUserLikedPostOrNotEndPoint = "post_user_liked";//Post
  static String getParentShareEndPoint = "parents";//Post
  static String getStudentShareEndPoint = "students";//Post
  static String getTeacherShareEndPoint = "teachers";//Post
  static String addCommentEndPoint = "post_comment_new";//Post
  static String getPostStatusEndPoint = "post_perm";//Post
  static String getCommentsListEndPoint = "post_comment_view";//Post
  static String getSubjectsListEndPoint = "teachers";//Post
  static String getTeacherClassSchedulesListEndPoint = "teacher_table";//Post
  static String getClassSchedulesListEndPoint = "class_table";//Post
  static String getTeacherInfoEndPoint = "teacher_info";//Post
  static String likeOrDislikePostEndPoint = "post_like";//Post
  static String editingPostStatusEndPoint = "post_perm_edit";//Post
  static String studentsListEndPoint = "students";//Post
  static String parentsListEndPoint = "parents";//Post
  static String attendanceTableListEndPoint = "students_attend";//Post
  static String getStudentAttendanceTableListEndPoint = "students_attend_report";//Post
  static String editAttendanceTableListEndPoint = "students_attend_edit";//Post
  static String editStatusAttendanceTableListEndPoint = "students_attend_add_remove";//Post
  static String editNotesAttendanceTableListEndPoint = "students_attend_notes";//Post
  static String sendingOrReceivingKidEndPoint = "inout";//Post
  static String getChatHistoryListEndPoint = "msg_list";//Post
  static String getTeacherAcademicAndBehaviorRecommendationDataListEndPoint = "recommendations_teacher_view";//Post
  static String getReasonAcademicAndBehaviorRecommendationDataListEndPoint = "recommendations_list";//Post
  static String getAcademicAndBehaviorRecommendationDataListEndPoint = "recommendations_parent_view";//Post
  static String addAcademicAndBehaviorRecommendationEndPoint = "recommendations_new";//Post
  static String getChatListEndPoint = "msg_list_new";//Post
  static String getMessageListEndPoint = "msg_view";//Post
  static String sendMessageEndPoint = "msg_send";//Post
  static String getClassTeacherListEndPoint = "school_ctgs";//Post


}