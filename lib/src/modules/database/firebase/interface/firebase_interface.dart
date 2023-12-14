import 'package:comunica_beacons/src/modules/database/firebase/repository/firebase_repository.dart';

import '../repository/firestore_repository.dart';

abstract class FirebaseInterface {
  Map get device;
  requisition();
  StateRequisition get state;
}
