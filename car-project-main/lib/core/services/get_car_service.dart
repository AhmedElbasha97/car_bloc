import 'package:car_project/features/home/data/car_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetCarService {
  final FirebaseFirestore firestore;

  GetCarService({required this.firestore});

  Future<List<CarModel>> getCars() async{
    var snapshot = await firestore.collection('cars').get();
    return snapshot.docs.map((doc) => CarModel.fromMap(doc.data())).toList();
  }
}