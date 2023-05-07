//集合 包括 list、set 和 map 类
void main() {
//lists 可以通过字面量来创建和初始化。另外，也可以使用 List 的构造函数。
// List 类还定义了若干方法，用于向列表添加或删除项目。

  var grains = <String>[];
  //但有些时候你 需要 指定泛型。比如：Dart 无法从 [] 中推断出任何类型，它可以是任何类型元素的组合。
  //这时推断的类型基本不会是你想要的，所以你需要写下 <String>[] 或者 <Person>[] 这样的类型声明。

  var fruits = ['apples', 'orangess'];
  fruits.add('kiwis'); //添加单个元素
  fruits.addAll(['grapes', 'bananas']); //添加元素
  assert(fruits.length == 5);

  var appleIndex = fruits.indexOf("apples"); //indexOf查找元素在list的下标值
  fruits.removeAt(appleIndex); //移除
  assert(fruits.length == 4);

//清空list
  fruits.clear();
  assert(fruits.isEmpty);

//用list.fill 构建list，将创造一个含99个broccoli的list
  var vegetables = List.filled(99, 'broccoli');
  assert(vegetables.every((v) => v == 'broccoli'));
  fruits = ['bananas', 'apples', 'oranges'];
  fruits.sort((a, b) => a.compareTo(b));
  assert(fruits[0] == 'apples');

//set类型 真正的集合 无序、不重复
  var ingredints = <String>{};
  ingredints.addAll(['gold', 'titanium', 'xenon']); //中括号
  assert(ingredints.length == 3);
  ingredints.add('gold'); //重复添加相同元素无效
  assert(ingredints.length == 3);
  ingredints.remove("gold");
  assert(ingredints.length == 2);

  var atomicNumbers = Set.from(['xenon', 'argon']); //另一种构建set的方法
  //求set的交集
  fruits.add("gold");
  var intesection = ingredints.intersection(atomicNumbers); //函数名不是关键字
  assert(intesection.length == 1);
  assert(intesection.contains("xenon"));

  //Maps map 是一个无序的 key-value （键值对）集合，就是大家熟知的
  //dictionary 或者 hash。 map 将 kay 与 value 关联，以便于检索。和 JavaScript 不同，Dart 对象不是 map。
  var hawaiianBeaches = {
    //使用字符串作键值的Maps
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };

  var searchTerm = Map(); //函数创建map

  var nobleGases = Map<int, String>(); //可以指定map的键值、值的类型

  //
  var novleGases = {54: 'xenon'};

  assert(novleGases[54] == 'xenon');

  assert(novleGases.containsKey(54));

  novleGases.remove(54);

  assert(!novleGases.containsKey(54));

  var keys = hawaiianBeaches.keys;
  assert(keys.length == 3);
  assert(Set.from(keys).contains('Oahu'));
  var values = hawaiianBeaches.values;
  //vlaues=([Waikiki, Kailua, Waimanalo], [Wailea Bay, Pololu Beach], [Hanalei, Poipu])
  assert(values.length == 3);
  assert(values.any((v) => v.contains('Waikiki')));

  //如果当且仅当该 key 不存在于 map 中，且要为这个 key 赋值，可使用 putIfAbsent() 方法。
  //该方法需要一个方法返回这个 value。

  var teamAssignments = <String, String>{};
  teamAssignments.putIfAbsent('Catcher', () => '');
  assert(teamAssignments['Catcher'] != null);
  /*胖箭头
  bool isNoble(int atomicNumber) {
  return _nobleGases[atomicNumber] != null;
}
等价于bool isNoble(int atomicNumber) => _nobleGases[atomicNumber] != null;
  */

//List, Set, 和 Map 共享许多集合中的常用功能。其中一些常见功能由 Iterable 类定义，这些函数由 List 和 Set 实现。
  var teas = ['green', 'black', 'chamomile', 'earl grey'];
  //使用 forEach() 可以让 list， set 或 map 对象中的每个元素都使用一个方法。
  teas.forEach((tea) => print('I drank $tea'));
  //当在 map 对象上调用 `forEach() 方法时，函数必须带两个参数（key 和 value）：
  hawaiianBeaches.forEach((key, value) {
    print('I want to visit $key and swim at $value');
  });

  //Iterable 提供 map() 方法，这个方法将所有结果返回到一个对象中。
  var loudTeas = teas.map((tea) => tea.toUpperCase()); //转化为大写字母
  loudTeas.forEach(print);

  //使用 Iterable 的 where() 方法可以获取所有匹配条件的元素。
  //使用 Iterable 的 any() 和 every() 方法可以检查部分或者所有元素是否匹配某个条件
  bool isDecaffeinated(String teaname) => teaname == 'chamomile';
  var decaffeinate = teas.where((tea) => isDecaffeinated(tea));
    //也可以写成 var decaffeinate = teas.where(isDecaffeinated);
  assert(teas.any(isDecaffeinated));
  assert(!teas.every(isDecaffeinated));
}
