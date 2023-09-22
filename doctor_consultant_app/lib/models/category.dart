class category {
  late final String icon, title;
  category({required this.icon, required this.title});
}

List<category> demo = [
  category(icon: "assets/pediatry.svg", title: "Pediatrician"),
  category(icon: "assets/neurosurgeon.svg", title: "Neurosurgeon"),
  category(icon: "assets/heart_doctor.svg", title: "Cardiologist"),
  category(icon: "assets/psychatrist.svg", title: "Psychiatrist"),
];
