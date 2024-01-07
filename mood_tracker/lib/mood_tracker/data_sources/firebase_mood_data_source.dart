import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mood_tracker/mood_tracker/index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_mood_data_source.g.dart';

class FirebaseMoodDataSource implements MoodDataSource {
  final FirebaseFirestore _firestore;

  late final CollectionReference _moods = _firestore.collection('moods');

  FirebaseMoodDataSource(this._firestore);

  @override
  Future<void> addMood({required String text, required String emoji}) async {
    await _moods.add({
      'text': text,
      'emoji': emoji,
      'created_at': DateTime.now().millisecondsSinceEpoch,
    });
  }

  @override
  Future<void> deleteMoodById(String id) async {
    await _firestore.collection('moods').doc(id).delete();
  }

  @override
  Future<List<MoodModel>> getMoods() async {
    final snapshot = await _firestore.collection('moods').get();
    return snapshot.docs.map((doc) {
      return MoodModel(
          id: doc.id,
          text: doc['text'],
          emoji: doc['emoji'],
          createdAt: DateTime.fromMicrosecondsSinceEpoch(doc['created_at']));
    }).toList();
  }
}

@Riverpod()
MoodDataSource moodDataSource(MoodDataSourceRef ref) => FirebaseMoodDataSource(
      FirebaseFirestore.instance,
    );
