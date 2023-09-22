// ignore_for_file: file_names

class RecommendedDoctor {
  late final String name, speciality, institute, image;
  RecommendedDoctor({
    required this.name,
    required this.speciality,
    required this.institute,
    required this.image,
  });
}

List<RecommendedDoctor> demo_r_doctor = [
  RecommendedDoctor(
    name: "Devanshi garg",
    speciality: "Heart doctor",
    institute: "Mool Chand hospital",
    image: "assets/johir_raihan.png",
  ),
  RecommendedDoctor(
    name: "Akshat",
    speciality: "Mind doctor",
    institute: "Mool Chand hospital",
    image: "assets/johir_raihan.png",
  ),
  RecommendedDoctor(
    name: "Devanshi garg",
    speciality: "medicine doctor",
    institute: "Mool Chand hospital",
    image: "assets/johir_raihan.png",
  ),
  RecommendedDoctor(
    name: "Devanshi garg",
    speciality: "eye doctor",
    institute: "Mool Chand hospital",
    image: "assets/johir_raihan.png",
  ),
];
