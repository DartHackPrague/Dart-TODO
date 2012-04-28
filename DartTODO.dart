#import('dart:html');
#import('Cookies.dart');


class DartTODO {

  DartTODO() {
  }
  
  void run() {
    document.query('#addNewTask').on.click.add((e) => addTask());
  }
  
  void addTask() {
    document.query('#messages').nodes.clear();
    InputElement input = document.query('#newTask');
    String task = input.value;
    if (task == "") {
      var message = new Element.html('<div>Task cannot be empty.</div>');
      document.query('#messages').nodes.add(message);
    } else {    
      var element = new Element.html('<div>' + task + ' </div>');
      var span = new Element.html('<span class="delete-task">X</span>');
      span.on.click.add((e) => deleteTask(element));
      element.nodes.add(span);
      document.query('#tasks').nodes.add(element);
      input.value = '';
      document.cookie = 'task='+ task +'; Path=/;';   
    }
  }
    
  void deleteTask(Element element) {
    element.remove();
  }
  
}

void main() {
  new DartTODO().run();
  var taksList = new Cookies().readCookie('task');
  document.query('#tasks').nodes.add(taksList);
}
