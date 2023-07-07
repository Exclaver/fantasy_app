import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<String>> fetchDataFromFirebase() async {
  List<String> dataList = ['All'];

  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('categories').get();

  snapshot.docs.forEach((document) {

    Map<String, dynamic>? data = document.data() as Map<String, dynamic>;
    String? categoryName = data['category_name'] as String?;
    if (categoryName != null) {
      dataList.add(categoryName);
    }
  });

  return dataList;
}
