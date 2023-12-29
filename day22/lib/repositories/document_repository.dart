import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day22/models/document_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DocumentRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveDocument(DocumentModel document) async {
    DocumentReference docRef = _firestore.collection('documents').doc();
    await docRef.set(document.toJson());
  }

  Future<List<Map<String, dynamic>>> readAllTextsAndImages() async {
    QuerySnapshot querySnapshot =
        await _firestore.collection('documents').get();

    List<Map<String, dynamic>> documents = [];

    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      documents.add(data);
    }

    return documents;
  }

  Stream<List<Map<String, dynamic>>> readAllTextsAndImagesAsStream() {
    return _firestore.collection('documents').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  Stream<List<Map<String, dynamic>>> searchDocumentsAsStream(
      String searchText) {
    return _firestore
        .collection('documents')
        .where('text', isGreaterThanOrEqualTo: searchText)
        .where('text', isLessThan: '$searchText\uf8ff')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }
}

final documentRepositoryProvider = Provider<DocumentRepository>((ref) {
  return DocumentRepository();
});

final allDocumentsProvider = StreamProvider<List<Map<String, dynamic>>>((ref) {
  final repository = ref.watch(documentRepositoryProvider);
  return repository.readAllTextsAndImagesAsStream();
});

final searchDocumentsProvider =
    StreamProvider.family<List<Map<String, dynamic>>, String>(
  (ref, searchText) {
    final repository = ref.watch(documentRepositoryProvider);
    return repository.searchDocumentsAsStream(searchText);
  },
);
