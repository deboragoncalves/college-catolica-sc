import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'user_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';

class UserForm extends StatefulWidget {
  final UserModel? user;
  UserForm({this.user});

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _addressController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      _nameController.text = widget.user!.nome;
      _birthDateController.text = widget.user!.nascimento;
      _addressController.text = widget.user!.endereco;
      _emailController.text = widget.user!.email;
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (widget.user == null) {
        _addUser();
      } else {
        _updateUser(widget.user!.id!);
      }
    }
  }

  Future<void> uploadProfileImage() async {
    try {
      // Abrir galeria selecionar imagem
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile == null) {
        print('Nenhuma imagem selecionada.');
        return;
      }

      // Converte a imagem para um arquivo File
      File imageFile = File(pickedFile.path);

      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null) {
        print('Usuário não autenticado.');
        return;
      }

      // Caminho arquivo Firebase Storage
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('user_images/$userId/profile_image.jpg');

      // Upload imagem
      await storageRef.putFile(imageFile);

      // URL download imagem
      String downloadUrl = await storageRef.getDownloadURL();

      // link imagem Firestore
      await FirebaseFirestore.instance.collection('usuario').doc(userId).set({
        'image': downloadUrl,
      }, SetOptions(merge: true)); // merge: true mantém outros dados do usuário

      print('Imagem de perfil salva com sucesso.');
    } catch (e) {
      print('Erro ao fazer upload da imagem: $e');
    }
  }

  void _addUser() async {
    if (_nameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _addressController.text.isNotEmpty &&
        _birthDateController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      FirebaseFirestore.instance.collection('usuario').add({
        'nome': _nameController.text,
        'email': _emailController.text,
        'endereco': _addressController.text,
        'nascimento': _birthDateController.text,
        'senha': _passwordController.text,
      });
      Navigator.pop(context);
    } else {
      print('Todos os campos são obrigatórios!');
    }
  }

  void _updateUser(String id) async {
    FirebaseFirestore.instance.collection('usuario').doc(id).update({
      'nome': _nameController.text,
      'nascimento': _birthDateController.text,
      'endereco': _addressController.text,
      'email': _emailController.text,
      'senha': _passwordController.text
    });
    Navigator.pop(context);
  }

  Future<void> _onUploadImagePressed() async {
    await uploadProfileImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child:
              Text(widget.user == null ? 'Novo Cadastro' : 'Editar Cadastro'),
        ),
      ),
      body: Center(
        child: Container(
          width: 500,
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Nome'),
                  validator: (value) =>
                      value!.isEmpty ? 'Campo obrigatório' : null,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'E-mail'),
                  validator: (value) =>
                      value!.isEmpty ? 'Campo obrigatório' : null,
                ),
                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(labelText: 'Endereço'),
                  validator: (value) =>
                      value!.isEmpty ? 'Campo obrigatório' : null,
                ),
                TextFormField(
                  controller: _birthDateController,
                  decoration: InputDecoration(labelText: 'Data de Nascimento'),
                  validator: (value) =>
                      value!.isEmpty ? 'Campo obrigatório' : null,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Senha'),
                  obscureText: true,
                  validator: (value) =>
                      value!.isEmpty ? 'Campo obrigatório' : null,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _onUploadImagePressed,
                  child: Text('Upload de Imagem de Perfil'),
                ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    child:
                        Text(widget.user == null ? 'Cadastrar' : 'Atualizar'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
