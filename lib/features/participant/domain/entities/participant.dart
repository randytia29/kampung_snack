class Participant {
  final String? name;
  final String? address;
  final String? job;
  final String? imgByte;

  Participant({
    this.name,
    this.address,
    this.job,
    this.imgByte,
  });

  factory Participant.fromJson(Map<String, dynamic> json) => Participant(
        name: json['name'],
        address: json['address'],
        job: json['job'],
        imgByte: json['img_byte'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'address': address,
        'job': job,
        'img_byte': imgByte,
      };

  Participant copyWith({
    String? name,
    String? address,
    String? job,
    String? imgByte,
  }) =>
      Participant(
        name: name ?? this.name,
        address: address ?? this.address,
        job: job ?? this.job,
        imgByte: imgByte ?? this.imgByte,
      );
}
