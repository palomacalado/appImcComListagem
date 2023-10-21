import 'package:flutter/material.dart';

class PeopleList extends StatelessWidget {
  final List peopleList;

  const PeopleList(this.peopleList, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: peopleList.map((person) {
        return Card(
          child: ListTile(
            title: Text('Nome: ${person.nome}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Altura: ${person.altura} m'),
                Text('Peso: ${person.peso} kg'),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
