import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FQAPage extends StatefulWidget {
  FQAPage({super.key});

  State<FQAPage> createState() => _FQAPageState();
}

class _FQAPageState extends State<FQAPage> {
  List<Map<String, String>> FQAList = [
    {
      "title": "What is Elera?",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour."
    },
    {
      "title": "How to use Elera?",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour."
    },
    {
      "title": "Can I create my own course?",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour."
    },
    {
      "title": "Is Elera free to use?",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour."
    },
    {
      "title": "How to make offer on Elera?",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour."
    },
  ];

  List<bool>? isExpanded;

  @override
  void initState() {
    isExpanded = List.generate(FQAList.length, (index) => false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FQAListTile(title, description, index) {
      return Container(
        margin: EdgeInsets.only(bottom: 22),
        decoration: BoxDecoration(
          color: Color(0xFFF9F9F9),
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            onExpansionChanged: (isExpand){
              setState(() {
                isExpanded![index] = isExpand;
              });
            },
            title: Text(
              title,
              style: TextStyle(
                  color: Color(0xFF6F30C0),
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            trailing: isExpanded![index]
                ? SizedBox(
              height: 20,
                  width: 20,
                  child: ImageIcon(
                      AssetImage("assets/images/arrow_up_icon.png"),
                      color: Color(0xFF6F30C0,
                      ),
                    ),
                )
                : SizedBox(
              height: 20,
                  width: 20,
                  child: ImageIcon(
                      AssetImage("assets/images/arrow_down_icon.png"),
                      color: Color(0xFF6F30C0),
                    ),
                ),
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Color(0xFFD1D1D1)))
                ),
                child: Text(
                  description,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: Color(0xFF4E4E4E),
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      );
    }

    FQAListView() {
      return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: FQAList.length,
          itemBuilder: (context, index) {
            return FQAListTile(
                FQAList[index]['title'], FQAList[index]['description'], index);
          });
    }

    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 18),
          child: TextFormField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Color(0xFFD1D1D1), width: 1)),
                filled: true,
                fillColor: Color(0xFFF9F9F9),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Color(0xFF6F30C0), width: 1)),
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ImageIcon(
                    AssetImage("assets/images/search_icon.png"),
                    color: Color(0xFFD1D1D1),
                  ),
                ),
                prefixIconConstraints:
                    BoxConstraints(maxWidth: 45, maxHeight: 45),
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                hintText: "Search",
                hintStyle: TextStyle(
                    color: Color(0xFFD1D1D1),
                    fontSize: 14,
                    fontWeight: FontWeight.w400)),
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ),
        Expanded(
          child: Container(
            child: FQAListView(),
          ),
        )
      ],
    );
  }
}
