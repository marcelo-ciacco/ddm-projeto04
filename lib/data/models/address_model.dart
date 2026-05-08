class AddressModel {
  final String cep;
  final String street;
  final String neighborhood;
  final String city;
  final String state;

  AddressModel({
    required this.cep,
    required this.street,
    required this.neighborhood,
    required this.city,
    required this.state,
  });

  factory AddressModel.fromViaCep(Map<String, dynamic> json) {
    return AddressModel(
      cep: json['cep'] ?? '',
      street: json['logradouro'] ?? '',
      neighborhood: json['bairro'] ?? '',
      city: json['localidade'] ?? '',
      state: json['estado'] ?? '',
    );
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      cep: map['cep'] ?? '',
      street: map['street'] ?? '',
      neighborhood: map['neighborhood'] ?? '',
      city: map['city'] ?? '',
      state: map['state'] ?? '',
    );
  }
}
