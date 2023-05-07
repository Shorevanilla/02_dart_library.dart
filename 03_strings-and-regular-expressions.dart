//在 Dart 中一个字符串是一个固定不变的 UTF-16 编码单元序列。语言概览中有更多关于 strings 的内容。
//使用正则表达式 (RegExp 对象) 可以在字符串内搜索和替换部分字符串。
//String 定义了例如 split()， contains()， startsWith()， endsWith() 等方法
void main() {
  assert('Never odd or even'.contains('odd'));

  assert('Never odd or even'.startsWith('Never'));

  assert('Never odd or even'.endsWith("even"));

// Find the location of a string inside a string.
  assert("Never odd or even".indexOf('odd') == 6);
//获取字符
  assert('Never odd or even'.substring(6, 9) == 'odd');

//以指定符号为分隔 分割字符串
  var parts = 'progressive web apps'.split(' ');
  print(parts);
  assert(parts.length == 3);
  assert(parts[0] == 'progressive');

  assert('Never odd or even'[0] == 'N');

// Use split() with an empty string parameter to get
// a list of all characters (as Strings); good for
// iterating.
  for (final char in 'hello'.split(' ')) {
    print(char);
  }

  //把字符串各个字符的 UTF-16 码 写进list
  var codeUnitList = 'Never odd or even'.codeUnits.toList();
  assert(codeUnitList[0] == 78);

  var numbers = RegExp(r'\d+');
  var someDigits = 'llamas live 15 to 20 years';

  assert(numbers.hasMatch(someDigits));

  for (final match in numbers.allMatches(someDigits)) {
    print((match.group(0)));//15 20
  }
}
