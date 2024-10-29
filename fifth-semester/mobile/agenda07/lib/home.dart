import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'user_form.dart';
import 'user_model.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Lista de Usuários'),
        ),
      ),
      body: Center(
        child: Container(
          width: 500,
          child: Column(
            children: [
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('usuario')
                    .snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (!snapshot.hasData) {
                    return SizedBox(
                      height: 100, 
                      width: 100, 
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  final users = snapshot.data!.docs
                      .map((doc) {
                        final data = doc.data();
                        if (data['nome'] != null && data['email'] != null) {
                          return UserModel.fromMap(data, doc.id);
                        }
                        return null; // dados incompletos
                      })
                      .where((user) => user != null)
                      .toList();

                  return ListView.builder(
                    shrinkWrap:
                        true, 
                    physics:
                        NeverScrollableScrollPhysics(), 
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return ListTile(
                        title: Text(user!.nome),
                        subtitle: Text(user.email),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserForm(user: user),
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => FirebaseFirestore.instance
                              .collection('usuario')
                              .doc(user.id)
                              .delete(),
                        ),
                      );
                    },
                  );
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserForm(),
                    ),
                  );
                },
                child: Text('Adicionar novo usuário'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
