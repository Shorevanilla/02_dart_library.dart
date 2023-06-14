class FooException implements Exception {
  final String? msg;
  const FooException([this.msg]);
  @override
  String toString() => msg ?? 'FooException';
}


void main() {
  try {
    throw FooException('这是一个自定义异常');
  } catch (e) {
    print(e.toString());
  }
}

  

