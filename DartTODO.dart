#import('dart:html');

class DartTODO {

  DartTODO() {
  }

  void run() {
    document.query('#addNewTask').on.click.add((e) => addTask());
  }
  
  void addTask() {
    InputElement input = document.query('#newTask');
    String task = input.value;
    var element = new Element.html('<div>' + task + '</div>');   
    document.query('#tasks').nodes.add(element);
    input.value = '';
  }

  void write(String message) {
    // the HTML library defines a global "document" variable
    document.query('#status').innerHTML = message;
  }
}

void main() {
  new DartTODO().run();
}
