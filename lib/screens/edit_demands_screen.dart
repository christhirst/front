import 'package:flutter/material.dart';
import 'package:front/providers/demands.dart';
import '../providers/DemandForm.dart';
import 'package:provider/provider.dart';

class EditDemandScreen extends StatefulWidget {
  static const routeName = '/edit-demand';
  @override
  _EditDemandScreenState createState() => _EditDemandScreenState();
}

class _EditDemandScreenState extends State<EditDemandScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _editedDemand =
      DemandForm(id: null, title: '', price: 0, description: '', url: '');

  var _initValues = {
    'title': '',
    'description': '',
    'price': '',
    'url': '',
  };

  var _isInit = true;

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);

    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final demandId = ModalRoute.of(context).settings.arguments as String;
      if (demandId != null) {}
      _editedDemand =
          Provider.of<Demands>(context, listen: false).findById(demandId);
      _initValues = {
        'title': _editedDemand.title,
        'description': _editedDemand.description,
        'price': _editedDemand.price.toString(),
        'url': '',
      };
      _imageUrlController.text = _editedDemand.url;
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }

  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      if (_imageUrlController.text.isNotEmpty ||
          !_imageUrlController.text.startsWith('http') &&
              !_imageUrlController.text.startsWith('https')) {
        return;

        setState(() {});
      }
    }
  }

  void _saveForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    if (_editedDemand.id != null) {
      Provider.of<Demands>(context, listen: false)
          .updateDemand(_editedDemand.id, _editedDemand);
    } else {
      Provider.of<Demands>(context, listen: false).addDemand(_editedDemand);
    }

    Navigator.of(context).pop();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              TextFormField(
                initialValue: _initValues['title'],
                decoration: InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please provide a value.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedDemand = DemandForm(
                    id: _editedDemand.id,
                    title: value,
                    description: _editedDemand.description,
                  );
                },
              ),
              TextFormField(
                initialValue: _initValues['price'],
                decoration: InputDecoration(labelText: 'Price'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a price.';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number.';
                  }
                  if (double.parse(value) <= 0) {
                    return 'Please enter a number greater then zero.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedDemand = DemandForm(
                      id: _editedDemand.id,
                      price: double.parse(value),
                      title: _editedDemand.title,
                      description: _editedDemand.description);
                },
              ),
              TextFormField(
                initialValue: _initValues['description'],
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.multiline,
                focusNode: _descriptionFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a description.';
                  }
                  if (value.length < 10) {
                    return 'Please enter a longer description.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedDemand = DemandForm(
                    id: _editedDemand.id,
                    price: _editedDemand.price,
                    title: _editedDemand.title,
                    description: value,
                  );
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 8,
                      right: 10,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    )),
                    child: _imageUrlController.text.isEmpty
                        ? Text('Enter a URL')
                        : FittedBox(
                            child: Image.network(
                              _imageUrlController.text,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Image URL'),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.next,
                      controller: _imageUrlController,
                      focusNode: _imageUrlFocusNode,
                      onFieldSubmitted: (_) => {_saveForm()},
                      onSaved: (value) {
                        _editedDemand = DemandForm(
                          id: _editedDemand.id,
                          price: _editedDemand.price,
                          title: _editedDemand.title,
                          description: _editedDemand.description,
                          url: value,
                        );
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
