import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mini_habits/model/MiniHabit.dart';
import 'package:mini_habits/model/MiniHabitDomain.dart';
import 'package:mini_habits/model/MiniHabitsData.dart';
import 'package:mini_habits/model/SimpleCategory.dart';
import 'package:mini_habits/model/user.dart';

class MiniHabitsDataService {
  static String categoriesColection = 'categories';
  static String miniHabitColetion = 'minihabitsData';

  static Future<MiniHabitData> createBasicMiniHabitData(String uid) async {
    List<MiniHabitDomain> domains = await getAllSimpleCategories().then(
        (list) => list
            .map((category) => MiniHabitDomain(
                name: category.name,
                stage: MiniHabitStage.active,
                actives: [],
                pasives: []))
            .toList());
    MiniHabitData miniHabitData = MiniHabitData(actives: domains, pasives: []);
    FirebaseFirestore.instance
        .collection(miniHabitColetion)
        .doc(uid)
        .set(miniHabitData.toJson());
    return miniHabitData;
  }

  static Future<void> updateMiniHabitData(MiniHabitData miniHabitData) async {
    FirebaseFirestore.instance
        .collection(miniHabitColetion)
        .doc(miniHabitData.uid)
        .set(miniHabitData.toJson());
  }

  static Future<void> deleteMiniHabitData(String uid) async {
    FirebaseFirestore.instance.collection(miniHabitColetion).doc(uid).delete();
  }

  static Future<MiniHabitData> getMiniHabitData(AppUser appUser) {
    return FirebaseFirestore.instance
        .collection(miniHabitColetion)
        .doc(appUser.uid)
        .get()
        .then((miniHabitJson) => MiniHabitData.fromJson(miniHabitJson));
  }

  static Future<List<MiniHabitData>> getAllMiniHabitData() {
    return FirebaseFirestore.instance.collection(miniHabitColetion).get().then(
        (listJson) => listJson.docs
            .map((miniHabitJson) => MiniHabitData.fromJson(miniHabitJson))
            .toList());
  }

  static Future<List<SimpleCategory>> getAllSimpleCategories() =>
      FirebaseFirestore.instance.collection(categoriesColection).get().then(
          (categoriesJson) => categoriesJson.docs
              .map((categoryJson) =>
                  SimpleCategory.fromJson(categoryJson, categoryJson.id))
              .toList());

  static Future<void> addSimpleCategory(SimpleCategory simpleCategory) async {
    FirebaseFirestore.instance
        .collection(categoriesColection)
        .doc()
        .set(simpleCategory.toJson());
    for (var miniHabitData in (await getAllMiniHabitData())) {
      miniHabitData.actives.add(MiniHabitDomain.withoutLists(
        name: simpleCategory.name,
        stage: MiniHabitStage.active,
      ));
      updateMiniHabitData(miniHabitData);
    }
  }

  static Future<void> updateSimpleCategory(
      SimpleCategory simpleCategory, String finalName) async {
    final String initialName = simpleCategory.name;
    for (var miniHabitData in (await getAllMiniHabitData())) {
      miniHabitData.updateDomain(initialName, finalName);
      updateMiniHabitData(miniHabitData);
    }
    simpleCategory.name = finalName;
    FirebaseFirestore.instance
        .collection(categoriesColection)
        .doc(simpleCategory.uid)
        .set(simpleCategory.toJson());
  }

  static Future<void> deleteSimpleCategory(
      SimpleCategory simpleCategory) async {
    for (var miniHabitData in (await getAllMiniHabitData())) {
      miniHabitData.removeDomain(simpleCategory.name);
      updateMiniHabitData(miniHabitData);
    }
    FirebaseFirestore.instance
        .collection(categoriesColection)
        .doc(simpleCategory.uid)
        .delete();
  }
}
