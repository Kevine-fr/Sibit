import 'package:flutter/material.dart';

class FormulaireProd extends StatefulWidget {
  const FormulaireProd({super.key});

  @override
  State<FormulaireProd> createState() => _FormulaireProdState();
}

class _FormulaireProdState extends State<FormulaireProd> {

  TextEditingController _nomController = TextEditingController();
  TextEditingController _detailsController = TextEditingController();
  TextEditingController _etatController = TextEditingController();
  TextEditingController _quantiteController = TextEditingController();
  TextEditingController _prixController = TextEditingController();
  TextEditingController _statutController = TextEditingController();
List<String> statutOptions = ['Option 1', 'Option 2', 'Option 3'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Information du Produit',
        style: TextStyle(fontWeight: FontWeight.bold),)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Champ Nom
              TextFormField(
                controller: _nomController,
                decoration: InputDecoration(
                  labelText: 'Nom',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              
              SizedBox(height: 16),

              // Champ État
              TextFormField(
                controller: _etatController,
                decoration: InputDecoration(
                  labelText: 'État',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Champ Quantité (int)
              TextFormField(
                controller: _quantiteController,
                decoration: InputDecoration(
                  labelText: 'Quantité',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),

              // Champ Prix
              TextFormField(
                controller: _prixController,
                decoration: InputDecoration(
                  labelText: 'Prix',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              SizedBox(height: 16),

              // Champ Statut
              

              // Champ Détails
              TextFormField(
                controller: _detailsController,
                decoration: InputDecoration(
                  labelText: 'Détails',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                maxLines: 3, // Pour autoriser plusieurs lignes de texte
              ),

              SizedBox(height: 22),
              // Champ Photo (Utiliser un bouton pour choisir une photo)
              ElevatedButton(
                onPressed: () {
                  // Implémentez la logique pour choisir une photo ici
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.camera_alt),
                    SizedBox(width: 8),
                    Text('Sélectionner une photo'),
                    SizedBox(width: 16),

              // Bouton de soumission
              ElevatedButton(
                onPressed: () {
                  // Implémentez la logique de soumission ici
                  // Vous pouvez récupérer les valeurs avec _nomController.text, _detailsController.text, etc.
                },
                child: Text('Soumettre',
                style: TextStyle(),),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              
              SizedBox(height: 35),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text('Après le remplissage de tous ses champs, cliquer sur le bouton soumettre pour mettre en ligne votre produit ! ',
                style: TextStyle(
                  color: Colors.grey
                ),),
              )
            ],
          ),
        ),
      ),
    );
     }
}