class TextFieldValidations{

  static String _required(String value, dynamic style){
    if (value.isEmpty) {
      if(style!=null){
        print("style != null");
        if(style['requiredText']!=null){
          print("requiredText != null");
          print(style['requiredText']);
          return style['requiredText'];
        }
      }else{
        print("style = null");
      }
      return "Esse campo não pode ser vazio";
    }else{
      return null;
    }
  }

  static String _minimumRequired(String value, dynamic style, int minimum){
    if (value.length<minimum) {
      if(style!=null){
        if(style['minimumRequiredText']!=null){
          return style['minimumRequiredText'];
        }
      }
      return "Minimo "+minimum.toString()+" caracteres";
    }else{
      return null;
    }
  }

  static String getValidation(dynamic validations, dynamic style, String value){
    if(validations!=null){
      if(validations['required']!=null){
        print(validations['required']);
        if(validations['required']==true){
          print("required = true");
          String returnedValue = _required(value,style);
          if(returnedValue!=null){
            return returnedValue;
          }
        }
      }
      if(validations['minimumRequired']!=null){
        print(validations['minimumRequired']);
        if(validations['minimumRequired']==0){
          print("minimumRequired = 0");
          String returnedValue = _required(value,style);
          if(returnedValue!=null){
            return returnedValue;
          }
        }else{
          print("minimumRequired");
          String returnedValue =  _minimumRequired(value, style, validations['minimumRequired']);
          if(returnedValue!=null){
            return returnedValue;
          }
        }
      }
    }
    return null;
  }

}