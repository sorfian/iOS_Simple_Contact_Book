part of 'contact_cubit.dart';

@immutable
abstract class ContactState extends Equatable {
  const ContactState();

  @override
  List<Object?> get props => [];
}

class ContactInitial extends ContactState {}

class ContactLoaded extends ContactState {
  final List<Contact> contacts;

  const ContactLoaded(this.contacts);

  @override
  List<Object?> get props => [contacts];
}

class ContactLoadingFailed extends ContactState {
  final String message;

  const ContactLoadingFailed(this.message);

  @override
  List<Object?> get props => [message];
}
