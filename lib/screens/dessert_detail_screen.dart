import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/dessert.dart';

class DessertDetailScreen extends StatelessWidget {
  const DessertDetailScreen({super.key, required this.dessert});

  final Dessert dessert;

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('d MMMM yyyy', 'th');
    return Scaffold(
      appBar: AppBar(title: const Text('รายละเอียดขนม', style: TextStyle(fontWeight: FontWeight.bold))),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            height: 210,
            decoration: BoxDecoration(color: const Color(0xff315c4c), borderRadius: BorderRadius.circular(24)),
            child: const Icon(Icons.cake, size: 110, color: Color(0xfff3d4a4)),
          ),
          const SizedBox(height: 20),
          Text(dessert.name, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
          Row(children: [
            const Icon(Icons.star, size: 20, color: Color(0xffd97745)),
            const SizedBox(width: 4),
            Text('${dessert.rating.toStringAsFixed(1)} / 5.0', style: const TextStyle(fontWeight: FontWeight.w700, color: Color(0xff315c4c))),
          ]),
          const Divider(height: 32),
          _DetailRow(label: 'รหัสขนม', value: dessert.id),
          _DetailRow(label: 'ประเภท', value: dessert.category),
          _DetailRow(label: 'แหล่งที่มา', value: dessert.origin),
          _DetailRow(label: 'รสชาติ', value: dessert.flavor),
          _DetailRow(label: 'ส่วนผสมหลัก', value: dessert.mainIngredient),
          _DetailRow(label: 'คะแนน', value: '${dessert.rating.toStringAsFixed(1)} / 5.0'),
          _DetailRow(label: 'วันที่บันทึก', value: dateFormat.format(dessert.favoriteDate)),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(width: 120, child: Text(label, style: TextStyle(color: Colors.grey.shade600))),
        Expanded(child: Text(value, style: const TextStyle(fontWeight: FontWeight.w600))),
      ]),
    );
  }
}