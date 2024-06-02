### DFS list version연습

- expand는 그 함수의 각 element에 대하여 연산 작업을 한다.
- 리스트에 리스트를 더할려면 addAll을 사용하자

```
void main() {
  Map graph = {};
  graph['A'] = ['B', 'C'];
  graph['B'] = ['A', 'D'];
  graph['C'] = ['A', 'G', 'H', 'I'];
  graph['D'] = ['B', 'E', 'F'];
  graph['E'] = ['D'];
  graph['F'] = ['D'];
  graph['G'] = ['C'];
  graph['H'] = ['C'];
  graph['I'] = ['C', 'J'];
  graph['J'] = ['I'];

  print(dfs(graph, 'A'));

  List<int> list = [1, 2, 3];
  var expandedList = list.expand((element) => [element, element * 2]);
  print(expandedList.toList()); // [1, 2, 2, 4, 3, 6]
}

List<String> dfs(Map graph, String startNode) {
  List<String> willVisit = [startNode];
  List<String> visited = [];

  while (willVisit.isNotEmpty) {
    String node = willVisit.removeLast();

    if (!visited.contains(node)) {
      willVisit.addAll(graph[node]);
      visited.add(node);
    }
  }

  return visited;
}
```
