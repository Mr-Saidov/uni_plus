class RegionsData {
  int? code;
  String? nameUz;
  String? nameRu;
  String? nameLatn;
  int? ns10Code;
  int? soato;

  RegionsData(
      {this.code,
      this.nameUz,
      this.nameRu,
      this.nameLatn,
      this.ns10Code,
      this.soato});

  RegionsData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    nameUz = json['nameUz'];
    nameRu = json['nameRu'];
    nameLatn = json['nameLatn'];
    ns10Code = json['ns10Code'];
    soato = json['soato'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['nameUz'] = this.nameUz;
    data['nameRu'] = this.nameRu;
    data['nameLatn'] = this.nameLatn;
    data['ns10Code'] = this.ns10Code;
    data['soato'] = this.soato;
    return data;
  }
}
