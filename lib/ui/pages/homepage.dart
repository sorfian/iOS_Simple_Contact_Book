part of 'pages.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    context.read<ContactCubit>().getContacts();
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            backgroundColor: Colors.white,
            leading: Material(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Labels",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ],
              ),
            ),
            middle: const Text('Manage Contacts'),
            trailing: Material(
                color: Colors.white,
                child: IconButton(
                    icon: const Icon(Icons.add, color: Colors.redAccent),
                    onPressed: () {
                      Get.to(() => const AddNewContactPage());
                    })),
            largeTitle: Container(
              margin: const EdgeInsets.only(right: 10),
              child: CupertinoSearchTextField(
                onChanged: (value) {
                  context.read<ContactCubit>().searchMutation(value);
                },
              ),
            ),
          ),

          /////////////////
          BlocBuilder<ContactCubit, ContactState>(
            builder: (_, state) => (state is ContactLoaded)
                ? SliverList(
                    delegate: SliverChildListDelegate([
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: state.contacts
                              .map(
                                (e) => Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ContactList(
                                        contact: e,
                                      ),
                                      const Divider(
                                        thickness: 1.0,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      )
                    ]),
                  )
                : SliverList(
                    delegate: SliverChildListDelegate(
                      [const SizedBox()],
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
