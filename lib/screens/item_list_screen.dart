import 'package:flutter/material.dart';
import '../models/lost_item.dart';
import 'add_item_screen.dart';
import 'item_detail_screen.dart';

//hello
class ItemListScreen extends StatelessWidget {
  final List<LostItem> items;
  final VoidCallback onAddTap;
  final Function(int) onToggleFound;
  final VoidCallback onDeleteFound;
  final Function(int) onLike;

  const ItemListScreen({
    super.key,
    required this.items,
    required this.onAddTap,
    required this.onToggleFound,
    required this.onDeleteFound,
    required this.onLike,

  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(backgroundColor:Colors.deepPurple[100],
        title: const Text(style: TextStyle(fontWeight:FontWeight.bold,
            fontSize: 25), "Campus Connect – Mini Bulletin Board App"),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: "Delete found items",
            onPressed: onDeleteFound,
          ),
        ],
      ),

      body: items.isEmpty
          ? const Center(child: Text("Nothing here yet. Add one!"))
          : ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) => ItemDetailScreen(item: item),
                ),
                );
              },
              title: Text(item.name),
              subtitle: Text(item.description),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [

                  IconButton(
                    onPressed: () => onLike(index),
                    icon:const Icon(Icons.thumb_up,color: Colors.blue),
                  ),
                  Text(item.likes.toString()),

                  const SizedBox(width: 8),

                  item.isFound
                      ?const Chip(label: Text("FOUND"))
                      : ElevatedButton(onPressed:  ()=> onToggleFound(index),
                    child: const Text("Mark Found"),
                  ),
                ],
              ),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: onAddTap,
        child: const Icon(Icons.add),
      ),
    );
  }
}
