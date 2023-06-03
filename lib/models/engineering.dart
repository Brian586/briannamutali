class Engineering {
  final String? id;
  final String? image;
  final String? company;
  final String? department;
  final String? dateFrom;
  final String? dateTo;
  final String? description;
  final List<String>? skills;

  Engineering(
      {this.id,
      this.image,
      this.company,
      this.department,
      this.dateFrom,
      this.dateTo,
      this.description,
      this.skills});
}

List<Engineering> engineeringExperiences = [
  Engineering(
      id: "kaa",
      image: "assets/engineering/preview.jpg",
      company: "KENYA AIRPORTS AUTHORITY (MOI INTERNATIONAL AIRPORT)",
      department: "ELECTRO-MECHANICAL DEPARTMENT",
      dateFrom: "10 JAN 2022",
      dateTo: "31 MAR 2022",
      description:
          "I did my attachment at Moi International Airports under Kenya Airports Authority for a period of three months and gained the following skills:",
      skills: [
        "Operation and maintenance of Passenger Boarding Bridges (PBB).",
        "Repair and maintenance of luggage conveyor belts.",
        "Water pump control and maintenance.",
        "Operation and maintenance of elevators and escalators.",
        "Programming and troubleshooting PLCs.",
        "Maintenance of air conditioners and refrigerators.",
        "Maintenance of passengers luggage weighing scales."
      ])
];
