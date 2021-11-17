import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sorfian_test/models/models.dart';
import 'package:sorfian_test/services/services.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(ContactInitial());

  Future<void> getContacts() async {
    ApiReturnValue<List<Contact>> result = await ContactServices.getContacts();

    if (result.value != null) {
      emit(ContactLoaded(result.value!));
    } else {
      emit(ContactLoadingFailed(result.message!));
    }
  }

  Future<void> addContact(Contact newContact) async {
    Contact result = await ContactServices.addContacts(newContact);

    if (newContact.name != null) {
      emit(ContactLoaded((state as ContactLoaded).contacts + [result]));
    } else {
      emit(const ContactLoadingFailed("Add contact failed"));
    }
  }

  Future<void> searchMutation(String query) async {
    ApiReturnValue<List<Contact>> result = await ContactServices.getContacts();

    if (query.isNotEmpty) {
      if (result.value != null) {
        List<Contact> contact = result.value!
            .where((e) => e.name!.toLowerCase().contains(query.toLowerCase()))
            .toList();
        emit(ContactLoaded(contact));
      } else {
        emit(ContactLoadingFailed(result.message!));
      }
    } else {
      emit(ContactLoaded(result.value!));
    }
  }
}
