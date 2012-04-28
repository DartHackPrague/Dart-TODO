#import('dart:html');
#import('Cookies.dart');


class DartTODO {

  var count = 0;
  
  DartTODO() {
  }
  
  void run() {
    document.query('#addNewTask').on.click.add((e) => addTask());
    
    for (var i = 0; i < 30; i++) {
      var taksList = new Cookies().readCookie('task'+i);
      if (taksList != null) {
      var element = new Element.html('<div>' + taksList + ' </div>');
      var span = new Element.html('<span class="delete-task">X</span>');
      span.on.click.add((e) => deleteTask(element));
      element.nodes.add(span);
      document.query('#tasks').nodes.add(element);
      }
    }
    
    var tmpCount = new Cookies().readCookie('count');
    if (tmpCount != null) {
      count = Math.parseInt(tmpCount);
    }
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
      new Cookies().createCookie('task'+count,task,360);
      count += 1;
      new Cookies().createCookie('count', count ,360);
    }
  }
    
  void deleteTask(Element element) {
    element.remove();
  }
  
}

void main() {
  new DartTODO().run();
}
