#import('dart:html');
#import('Cookies.dart');

class DartTODO {

  DartTODO() {
  }
  
  void run() {
    document.query('#addNewTask').on.click.add((e) => addTask());
  }
  
  void addTask() {
    InputElement input = document.query('#newTask');
    String task = input.value;
    var element = new Element.html('<div>' + task + ' </div>');
    var span = new Element.html('<span class="delete-task">X</span>');
    span.on.click.add((e) => deleteTask(element));
    element.nodes.add(span);
    document.query('#tasks').nodes.add(element);
    input.value = '';
  }
  
  void deleteTask(Element element) {
    element.remove();
  }
  
}

void main() {
  new DartTODO().run();
  
  new Cookies().createCookie('name','value',60);
}
