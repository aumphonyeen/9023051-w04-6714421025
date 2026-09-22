import 'package:flutter/material.dart';

import '../data/dessert_data.dart';
import '../models/dessert.dart';
import 'dessert_detail_screen.dart';

class DessertListScreen extends StatelessWidget {
  const DessertListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dessert Collection', style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: 0.3)),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search), tooltip: 'ค้นหา')],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
        children: [
          const Text('ขนมที่คุณโปรดปราน', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Color(0xff233b32))),
          const SizedBox(height: 6),
          Text('${dessertCollection.length} รายการในคอลเลกชันของคุณ', style: TextStyle(color: Colors.grey.shade700)),
          const SizedBox(height: 18),
          ...dessertCollection.map((dessert) => _DessertCard(dessert: dessert)),
        ],
      ),
    );
  }
}

class _DessertCard extends StatelessWidget {
  const _DessertCard({required this.dessert});

  final Dessert dessert;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.fromLTRB(14, 12, 10, 12),
        leading: CircleAvatar(
          radius: 32,
          backgroundColor: const Color(0xfff3d4a4),
          child: const Icon(Icons.cake, size: 30, color: Color(0xff9a4d3a)),
        ),
        title: Text(dessert.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text('${dessert.category} • ${dessert.origin}'),
        ),
        trailing: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(Icons.star, size: 18, color: Color(0xffd97745)),
          Text(dessert.rating.toStringAsFixed(1), style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xff315c4c))),
        ]),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DessertDetailScreen(dessert: dessert))),
      ),
    );
  }
}