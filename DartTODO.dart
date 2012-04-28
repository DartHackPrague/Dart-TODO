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
    var element = new Element.html('<div>' + task + ' </div>');
    var span = new Element.html('<span class="delete-task">X</span>');
    span.on.click.add((e) => deleteTask(element));
    element.nodes.add(span);
    document.query('#tasks').nodes.add(element);
    input.value = '';
    document.cookie = 'ppkcookie2=another test; expires=Fri, 3 Aug 2012 20:47:11 UTC; path=/';
  }
  
  void deleteTask(Element element) {
    element.remove();
  }
  
}

void main() {
  new DartTODO().run();
}
