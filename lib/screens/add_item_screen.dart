import 'package:flutter/material.dart';
import '../models/lost_item.dart';

class AddItemScreen extends StatefulWidget {
  final Function(LostItem) onAddItem;

  const AddItemScreen({super.key, required this.onAddItem});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _descCtrl = TextEditingController();
  final _contCtrl= TextEditingController();

  String selectedCategory = "uncategorized";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor:Colors.deepPurple[200],
          title: const Text("Add Item")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameCtrl,
                decoration: const InputDecoration(labelText: "Name "),
                validator: (v) =>
                v == null || v.isEmpty ? "Name required" : null,
              ),
              const SizedBox(height: 15),

              TextFormField(
                controller: _descCtrl,
                decoration: const InputDecoration(labelText: "Description"),
                validator: (v) =>
                v == null || v.isEmpty ? "Description required" : null,
              ),
              const SizedBox(height: 15),

              TextFormField(
                controller: _contCtrl,
                decoration: const InputDecoration(labelText: "Contact information(email/phone)"),
                validator: (v) =>
                v == null || v.isEmpty ? "Contact information required" : null,
              ),
              const SizedBox(height: 15),

              DropdownButtonFormField(
                value: selectedCategory,
                items: [
                  "uncategorized",
                  "ID card",
                  "Money",
                  "electronics",
                  "accessories"
                ]
                    .map((cat) =>
                    DropdownMenuItem(value: cat, child: Text(cat)))
                    .toList(),
                onChanged: (v) => setState(() => selectedCategory = v!),
              ),
              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.onAddItem(
                      LostItem(
                        name: _nameCtrl.text,
                        description: _descCtrl.text,
                        contact: _contCtrl.text,
                        category: selectedCategory,
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
                child: const Text("Add Item"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
