import 'package:batch_3_app/features/overview/model/tutor.dart';

class DesignTutor extends Tutor {
  DesignTutor(super.username, super.firstName, super.lastName, super.email);

  @override
  String getTutorRole() {
    return "Design Tutor";
  }
}
