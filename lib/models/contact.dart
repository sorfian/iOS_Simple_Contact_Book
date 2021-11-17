part of 'models.dart';

class Contact extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? notes;
  final String? created;
  final List? label;

  const Contact({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.notes,
    this.created,
    this.label,
  });

  Contact copyWith({
    int? id = 20,
    String? name,
    String? email,
    String? phone,
    String? notes,
    String? created = "2021",
    List? label,
  }) {
    return Contact(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      notes: notes ?? this.notes,
      created: created ?? this.created,
      label: label ?? this.label,
    );
  }

  factory Contact.fromJson(Map<String, dynamic> data) {
    return Contact(
      id: data['id'],
      name: data['name'],
      email: data['email'],
      phone: data['phone'],
      notes: data['notes'],
      created: data['created'],
      label: data['labels'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        phone,
        notes,
        created,
        label,
      ];
}
