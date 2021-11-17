part of 'widgets.dart';

class DetailForm extends StatelessWidget {
  const DetailForm({
    Key? key,
    required this.textController,
    required this.name,
    required this.marginTop,
    required this.marginBottom,
    required this.placeholder,
    required this.tags,
  }) : super(key: key);

  final TextEditingController textController;
  final String name;
  final double marginTop;
  final double marginBottom;
  final String placeholder;
  final bool tags;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FractionallySizedBox(
          widthFactor: 0.75,
          child: Container(
            margin: EdgeInsets.only(top: marginTop, bottom: marginBottom),
            child: Text(
              name,
              style: GoogleFonts.lato()
                  .copyWith(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        FractionallySizedBox(
          widthFactor: 0.75,
          child: CupertinoTextField.borderless(
            style: const TextStyle(color: Colors.black),
            controller: textController,
            placeholder: placeholder,
            padding: const EdgeInsets.all(1),
            suffix: (tags)
                ? const Icon(
                    CupertinoIcons.add,
                    color: Colors.pinkAccent,
                  )
                : const SizedBox(),
          ),
        ),
        const FractionallySizedBox(
          widthFactor: 0.75,
          child: Divider(
            thickness: 1.0,
          ),
        ),
      ],
    );
  }
}
