class Participant {
  final String? name;
  final String? address;
  final String? job;
  final String? imgByte;
  final String? sex;
  final String? birthPlace;
  final String? birthDate;

  Participant(
      {this.name,
      this.address,
      this.job,
      this.imgByte,
      this.sex,
      this.birthPlace,
      this.birthDate});

  Participant copyWith(
          {String? name,
          String? address,
          String? job,
          String? imgByte,
          String? sex,
          String? birthPlace,
          String? birthDate}) =>
      Participant(
          name: name ?? this.name,
          address: address ?? this.address,
          job: job ?? this.job,
          imgByte: imgByte ?? this.imgByte,
          sex: sex ?? this.sex,
          birthPlace: birthPlace ?? this.birthPlace,
          birthDate: birthDate ?? this.birthDate);
}
