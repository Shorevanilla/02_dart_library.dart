void main() {
//dart:core 库定义了 num ，int 以及 double 类，这些类拥有一定的工具方法来处理数字。
//使用 int 和 double 的 parse() 方法将字符串转换为整型或双浮点型对象：
  assert(int.parse('42') == 42);
  assert(int.parse('0x42') == 66);
  assert(double.parse('0.50') == 0.5);
  print('flag1');

  //或者使用 num 的 parse() 方法，该方法可能会创建一个整型，否则为浮点型对象：
  assert(num.parse('42') is int);
  assert(num.parse('0x42') is int);
  assert(num.parse('0.50') is double);
  print('flag2');
//通过添加 radix 参数，指定整数的进制基数：
  assert(int.parse('42', radix: 16) == 66);
  print('flag3');

// Convert an int to a string.
  assert(42.toString() == '42');

// Convert a double to a string.
  assert(123.456.toString() == '123.456');

// Specify the number of digits after the decimal.
  assert(123.456.toStringAsFixed(2) == '123.46');

// Specify the number of significant figures.
  assert(123.456.toStringAsPrecision(2) == '1.2e+2');
  assert(double.parse('1.2e+2') == 120.0);
}
