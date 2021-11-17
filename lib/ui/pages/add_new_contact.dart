part of 'pages.dart';

class AddNewContactPage extends StatefulWidget {
  static const saveButton = Key('saveButton');
  const AddNewContactPage({Key? key}) : super(key: key);

  @override
  _AddNewContactPageState createState() => _AddNewContactPageState();
}

class _AddNewContactPageState extends State<AddNewContactPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController labelsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            backgroundColor: Colors.white,
            leading: Material(
                color: Colors.white,
                child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.redAccent),
                    onPressed: () {
                      Get.back();
                    })),
            largeTitle: Text(
              'New Contact',
              style: GoogleFonts.lato().copyWith(fontSize: 28),
            ),
          ),

          /////////////////
          SliverList(
              delegate: SliverChildListDelegate([
            // NAME TEXTFIELD
            Material(
              color: Colors.white,
              child: Column(
                children: [
                  DetailForm(
                    textController: nameController,
                    name: "Name",
                    marginTop: 26,
                    marginBottom: 14,
                    placeholder: "Contact name",
                    tags: false,
                  ),

                  // EMAIL TEXTFIELD

                  DetailForm(
                    textController: emailController,
                    name: "Email",
                    marginTop: 18,
                    marginBottom: 14,
                    placeholder: "Contact email address",
                    tags: false,
                  ),

                  // PHONE TEXTFIELD

                  DetailForm(
                    textController: phoneController,
                    name: "Phone",
                    marginTop: 18,
                    marginBottom: 14,
                    placeholder: "Phone number",
                    tags: false,
                  ),

                  // NOTES TEXTFIELD

                  DetailForm(
                    textController: notesController,
                    name: "Notes",
                    marginTop: 18,
                    marginBottom: 14,
                    placeholder: "Anything about the contact",
                    tags: false,
                  ),

                  // LABELS TEXTFIELD

                  DetailForm(
                    textController: labelsController,
                    name: "Labels",
                    marginTop: 18,
                    marginBottom: 14,
                    placeholder: "Label name",
                    tags: true,
                  ),

                  // BUTTON
                  GestureDetector(
                    behavior: HitTestBehavior.deferToChild,
                    onTap: () async {
                      await context.read<ContactCubit>().addContact(
                            Contact(
                              name: nameController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                              notes: notesController.text,
                              label: [labelsController.text],
                            ),
                          );
                      Get.back();
                    },
                    child: FractionallySizedBox(
                      widthFactor: 0.75,
                      child: Container(
                        key: AddNewContactPage.saveButton,
                        height: 45,
                        margin: const EdgeInsets.only(top: 100),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.pinkAccent,
                        ),
                        child: Center(
                          child: Text(
                            "Save",
                            style: GoogleFonts.lato().copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ])),
        ],
      ),
    );
  }
}
