import 'package:function_tree/function_tree.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required Map this.subMenu});
  final Map subMenu;
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Map model = {};
  Map<String, TextEditingController> tec = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (Map field in widget.subMenu['metadata']) {
      model[field['id']] = "";
      if (field['type'] == "OUT") {
        tec[field['id']] = TextEditingController();
      }
    }
  }

  Widget buildContent(field) {
    Widget content;
    switch (field['type']) {
      case "HEADER":
        content = Text(
          field['name'],
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        );
        break;
      case "INP":
        content = TextFormField(
          decoration: InputDecoration(
            labelText: field['name'],
          ),
          validator: ((value) =>
              value!.isNotEmpty ? '$field["name"] field can\'t be null' : null),
          onChanged: (value) => model[field['id']] = value,
        );
        break;
      case "OUT":
        content = TextFormField(
          controller: tec[field['id']],
          decoration: InputDecoration(labelText: field['name'], enabled: false),
        );
        break;
      case "BUTTON":
        content = ElevatedButton(
          onPressed: () {
            setState(() {
              for (Map field in widget.subMenu['metadata']) {
                if (field['type'] == "OUT") {
                  String formula = field['formula'];
                  RegExp regExp = RegExp(r"\#(\w+)");
                  Iterable<Match> allMatches = regExp.allMatches(formula);
                  for (final Match m in allMatches) {
                    formula = formula.replaceFirst(m[0]!, model[m[0]]);
                  }
                  try {
                    model[field['id']] = formula.interpret();
                    tec[field['id']]!.text =
                        model[field['id']].toStringAsFixed(4);
                  } catch (e) {
                    model[field['id']] = "Error";
                    tec[field['id']]!.text = model[field['id']];
                  }
                }
              }
            });
          },
          child: const Text('Calculate'),
        );
        break;
      default:
        content = const SizedBox(height: 3);
    }
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subMenu['title']),
      ),
      body: Form(
          child: ListView.separated(
              padding: const EdgeInsets.all(18),
              itemBuilder: (context, index) {
                return buildContent(
                    widget.subMenu['metadata'].elementAt(index));
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: widget.subMenu['metadata'].length)),
    );
  }
}
