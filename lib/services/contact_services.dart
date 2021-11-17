part of 'services.dart';

class ContactServices {
  static Future<ApiReturnValue<List<Contact>>> getContacts(
      {http.Client? client}) async {
    client ??= http.Client();

    String url = baseURL + 'contacts';
    var uri = Uri.parse(url);
    var response = await client.get(uri);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Please try again");
    }

    var data = jsonDecode(response.body);

    List<Contact> contacts =
        (data as Iterable).map((e) => Contact.fromJson(e)).toList();

    return ApiReturnValue(value: contacts);
  }

  static Future<Contact> addContacts(Contact newContact) async {
    Contact addContact = Contact(
      name: newContact.name,
      email: newContact.email,
      phone: newContact.phone,
      notes: newContact.notes,
      label: [
        {'slug': 'none', 'title': newContact.label![0]}
      ],
    );

    return addContact;
  }
}
