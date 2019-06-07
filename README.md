
# Flutter Dynamic Forms

Demonstração de biblioteca desenvolvida por mim para criação de formulários dinâmicos em Flutter a partir de um JSON.
A library to create dynamic forms on flutter using JSON, made to use with WebAPI's

##### AVISO! ESSA DEMONSTRAÇÃO CONTÉM APENAS UM TIPO DE INPUT (Input Simple) POIS ESSE REPOSITÓRIO ESTÁ APENAS PARA PORTIFÓLIO, ESTAREI LANÇANDO UM REPOSITÓRIO OFICIAL COM TODOS OS TIPOS DE INPUT PARA ELA NO FUTURO


<p align="center">
  <img src="https://raw.githubusercontent.com/erickdaros/Flutter-Dynamic-Forms/master/sample.png" width="300"/>
</p>


###### JSON responsável por gerar o formulário acima:
```javascript
[
    {
      "type": "Input",
      "id" : "252io5yu4i",
      "title": "Assunto",
      "style": {
        "placeholder": "Campo",
        "helperText" : "Capo de exemplo",
        "helperTextColor": "#000000",
        "requiredText" : "Campo obrigatório",
        "minimumRequiredText" : "Minimo 10 caracteres"
      },
      "validation": {
        "required" : true,
        "minimumRequired" : 5,
        "maxLength" : 10,
      },
    },
    {
      "type": "Input",
      "id": "534ioytgrg",
      "title": "Assunto 2",
      "style": {
        "placeholder": "Campo",
        "helperText": "Capo de exemplo",
        "helperTextColor": "#000000",
        "requiredText": "Campo obrigatório",
        "minimumRequiredText": "Minimo 8 caracteres"
      },
      "validation": {
        "required": true,
        "minimumRequired": 8,
      }
    }
]
```
  
## Getting Started  
  
This project is a starting point for a Flutter application.  
  
A few resources to get you started if this is your first Flutter project:  
  
- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)  
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)  
  
For help getting started with Flutter, view our   
[online documentation](https://flutter.dev/docs), which offers tutorials,   
samples, guidance on mobile development, and a full API reference.