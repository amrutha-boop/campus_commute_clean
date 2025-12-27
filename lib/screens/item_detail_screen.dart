import 'dart:io';
import 'package:flutter/material.dart';
import '../models/lost_item.dart';

class ItemDetailScreen extends StatelessWidget{
  final LostItem item;


  const ItemDetailScreen({super.key,required this.item});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(backgroundColor:Colors.deepPurple[200],
        title: Text(item.name),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children:[
          if(item.imagePath!=null)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                File(item.imagePath!),
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          const SizedBox(height: 25),

          Chip(label: Text(item.category.toUpperCase()),
          ),

          const SizedBox(height: 25),

          const Text("Item Name",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(style: TextStyle(
            fontSize: 20,
          ),item.name),

          const SizedBox(height: 25),

          const Text("Description",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(style: TextStyle(
            fontSize: 20,
          ),item.description),

          const SizedBox(height: 25),

          const Text("Contact",
            style: TextStyle(fontSize:20,
              fontWeight: FontWeight.bold,
            ),
          ),

          Row(
            children: [
              const Icon(Icons.phone),
              const SizedBox(width: 8),
              Text(style: TextStyle(
                fontSize: 20,
              ),item.contact),
            ],
          ),
        ],
      ),
    );
  }
}