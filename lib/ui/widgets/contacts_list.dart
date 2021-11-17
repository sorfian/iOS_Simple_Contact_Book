part of 'widgets.dart';

class ContactList extends StatelessWidget {
  final Contact? contact;
  const ContactList({
    Key? key,
    this.contact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            contact!.name!,
            style: GoogleFonts.lato().copyWith(fontWeight: FontWeight.w500),
          ),
          Row(
            children: [
              for (var i = 0; i < contact!.label!.length; i++)
                Container(
                  margin: EdgeInsets.only(left: (i > 0) ? 5 : 0),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Text(
                        contact!.label![i]['title'],
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
