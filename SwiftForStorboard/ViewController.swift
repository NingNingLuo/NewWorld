//
//  ViewController.swift
//  SwiftForStorboard
//
//  Created by elvin on 2024/8/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    

    var tableview = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableview.delegate = self
        tableview.dataSource = self
        tableview.frame = self.view.bounds
        self.view.addSubview(tableview)
        
        
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "ELMySelfTableViewCell"
        // 尝试反复利用已经创建的cell
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ELMySelfTableViewCell
            ?? ELMySelfTableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        
        // 配置cell的内容
        cell.label.text = "Hello, World! -- elvin"
        return cell
    }
}

/**
 var dataArray:[String] = ["晴天","阴天","大雨","多云","大风","雨夹雪","小雨"]
 //方法一：
 dataArray.forEach { (item) in
     print(item)
 }
 //方法二：
 for item in dataArray {
     print(item)
 }
 //方法三：
 // 该循环方式可设置开闭区间，设置时需注意数组越界
 for i in 0..<dataArray.count {
     print(dataArray[i])
 }
 //方法四：
 //该方法可以循环输出元组类型，包含下标index及对应的item
 for (index,item) in dataArray.enumerated() {
     print(index,item)
 }

 /*
 输出
 OC:     NSLog(@"Hello, World!");
 Swift:  print("Hello, World!")
 */
 print("Hello, World!")

 // 常量&变量的使用原则：尽量先用 let，只有需要变的时候，再用 var，能够更加安全
 // 定义变量
 var i = 10
 print(i)
 i = 15
 print(i)

 // 定义常量
 let j = 20
 // 常量一经定义不能自改数值
 //j = 25
 print(j)

 /******************************************************/

 // 变量类型
 let num = 10
 print("num:\(num)")
 // 自动类型推导  NSArray *arr = [NSMutalbeArray array];
 let value = 10.10
 print(value)

 // 指定类型
 let dValue: Double = 10.1
 print(dValue)


 /*
 在Swift中值"永远不会"被隐式转换为其他类型, 必须显示转换
 Swift中整数默认是Int64  == long
 Swift中小数默认是Double
 */
 let sum = Double(num) + value
 print(sum)

 let size = CGSize(width: 10, height: 10)
 // Double和CGFloat也需要转换
 let res = size.width + CGFloat(dValue)

 /******************************************************/

 /*
 创建对象
 OC:     alloc initWithXXX 方法
 Swift:  (xxx:)

 调用方法
 OC:     [UIColor redColor];
 Swift   UIColor.red

 枚举
 OC:      UIButtonTypeContactAdd
 Swift:   UIButtonType.ContactAdd
 */

 let view = UIView(frame: CGRectMake(0, 0, 100, 100))
 view.backgroundColor = UIColor.red

 let btn = UIButton(type: UIButton.ButtonType.contactAdd)
 btn.center = CGPoint(x: 50, y: 50)
 view.addSubview(btn)


 /******************************************************/

 /*
 1.条件不需要加圆括号
 2.{}不能省略
 */
 let intValue = 10
 if intValue > 5{
     print("OK")
 }

 /*
 1.Swift中没有C和OC中非零即真的概念
 2.Swfit中逻辑值只有两个true/false
 */
 if intValue == 10 {
     print(intValue)
 }

 /*
 三目运算符和OC中的一样
 提示: Swift中三目运算符用得很多
 */
 let result = intValue > 20 ? 20 : 10

 /******************************************************/

 /*
 可选类型(Optional) ?
 >表示变量可以有值, 也可以没有值
 >convenience init? 构造函数, ?表示不一定能够实例化出对象

 >!表示告诉编译器一定有值, 编译能够通过, 如果运行时没有值就会直接崩溃
 >提示: ? 和 ! 是所有刚刚接触Swift的OC程序员最蛋疼的问题, 前期开发要注意多看文档和利用编译器提示解决
 */

 let url = NSURL(string: "http://www.520it.com/")
 let url2 = NSURL(string: "http://www.520it.com/李南江")
 // 需要考虑url是否有值
 if url != nil{
     let request = NSURLRequest(url: url! as URL)
 }

 // 不需要考虑url是否有值, 能进入{}一定有值
 if let url3 = NSURL(string: "http://www.520it.com/"){
     let request = NSURLRequest(url: url3 as URL)
 }

 /******************************************************/

 /*
 传统写法:
 >不需要()
 >i没有类型, 使用的是var
 */

 //for var k = 0; k < 10; ++k {
 //    print(k)
 //}

 /*
 Swift
 > 0~9之间, 其中 0..< 中间不能有空格
 > Swift1.0版本 0..10
 */

 for i in 0..<10
 {
     print(i)
 }

 // 0~10
 for i in 0...10
 {
     print(i)
 }

 // 不关心下标可以使用 _ 省略
 // 在Swift中 _ 使用非常广泛
 for _ in 0...10
 {
     print("lnj")
 }

 // while循环
 var n = 0
 while n < 10
 {
     print(n)
     n+1
 }

 // do while
 var m = 0
 repeat{
     print(m)
     m+1
 }while m < 10

 /******************************************************/

 // 定义数组
 let array = ["lnj", "lmj"]

 // 遍历
 for arr in array{
     print(arr)
 }

 // 获取元素
 array[0]
 array[1]

 // 添加元素
 // 不能像不可变数组中添加内容
 //array.append("why")

 // let不可变对象, var可变对象
 var arrayM = ["lnj", "lmj"]
 arrayM.append("why")

 // 在Swift开发中数组可以存放任意类型
 var arrayM2 = ["lnj", "lmj", 123] as [Any]
 arrayM2.append("456")

 // 合并数组
 var arrayM3 = ["zs", "ls", "ww", "zl"]
 arrayM += arrayM3
 //只有相同类型的数组才可以合并
 //arrayM2 += arrayM3

 // 删除
 //arrayM3.removeAtIndex(1)
 arrayM3.remove(at: 1)
 arrayM3

 // 删除所有
 //arrayM3.removeAll()

 // 删除并保留容量
 //arrayM3.removeAll(keepCapacity: true)
 arrayM3.removeAll(keepingCapacity: true)
 arrayM3.capacity
 arrayM3.append("1")
 arrayM3.capacity
 arrayM3.append("2")
 arrayM3.capacity
 arrayM3.append("3")
 arrayM3.capacity
 arrayM3.append("4")
 arrayM3.capacity
 arrayM3.append("5")
 // 超过容量, 容量会直接*2
 arrayM3.capacity


 // 初始化
 var arrayM4: [String]
 arrayM4 = [String]()
 // 数组没有初始化之前不允许做任何操作
 arrayM4.append("lnj")

 /******************************************************/
 // 定义字典
 // 最常见的字典类型[String : NSObject], 例如JSON
 var dict = ["name":"lnj", "age": 30] as [String : Any]

 // 遍历字典
 // k,v 可以随便写, 前面是key后面是value
 for (k, v) in dict{
     print(k)
     print(v)
 }

 // 获取元素
 dict["name"]

 // 添加元素
 // 如果key不存在会新增
 dict["gender"] = "man"
 dict

 // 替换元素
 // 如果key存在会替换
 dict["name"] = "why"

 // 删除元素
 //dict.removeValueForKey("name")
 dict.removeValue(forKey: "name")
 dict

 // 合并字典
 var dict2 = ["score": 123]
 for (k, v) in dict2{
     dict[k] = v
 }
 dict

 // 初始化
 var dict3: [String: NSObject]
 dict3 = [String: NSObject]()
 //dict3["name"] = "lnj"
 dict3

 /******************************************************/

 /*
 Swift中使用String是一个结构体,  效率更高, 支持遍历
 OC中是一个对象
 Swift中的String和OC中的NSString可以很方便的进行转换
 */
 var str = "南哥很帅"
 //for c in str.characters
 //{
 //    print(c)
 //}


 // 字符串拼接
 var str2 = "cool"
 str2 += str

 let age = 30
 let name = "lnj"
 let str3 = "name = \(name), age = \(age)"

 let frmStr = String(format: "%02d:%02d:%02d", arguments: [9, 23, 8])

 // 字符串截取, 建议使用NSString
 let str4 = "xmgcool"
 let nsStr: NSString = str4 as NSString
 let subStr = nsStr.substring(with: NSMakeRange(0, 3))
 let nsStr2 = str4 as NSString
 let subStr2 = nsStr.substring(with: NSMakeRange(1, 3))

 /******************************************************/

 /*
 格式:
 func 函数名称(参数列表) -> 返回值
 语义: 将前面的计算结果, 输出给后面的返回值
 */

 // 没有参数没有返回值
 /*
 1. 可以写为 ->Void
 2. 可以写为 ->()
 3. 可以省略
 */
 func say() -> Void{
     print("lnj")
 }
 say()
 func say2() -> (){
     print("lnj")
 }
 say2()
 func say3(){
     print("lnj")
 }
 say3()
 // 有参数没有返回值
 func sum(a: Int, b: Int){
     print(a + b)
 }
 sum(a: 10, b: 20)

 func summ(a: Int, _ b: Int){
     print(a + b)
 }
 summ(a: 10, 20)

 // xy外部参数, ab内部参数
 // Swift2.0以前可以写#
 func sum2(x a: Int, y b: Int){
     print(a + b)
 }
 sum2(x: 10, y: 20)

 // 没有参数有返回值
 func getNumer() ->Int{
     return 998
 }
 print(getNumer())

 // 有参数有返回值
 func sum3(a: Int, b: Int) ->Int{
     return a + b
 }
 print(sum3(a: 10, b: 20))var dataArray:[String] = ["晴天","阴天","大雨","多云","大风","雨夹雪","小雨"]
 //方法一：
 dataArray.forEach { (item) in
     print(item)
 }
 //方法二：
 for item in dataArray {
     print(item)
 }
 //方法三：
 // 该循环方式可设置开闭区间，设置时需注意数组越界
 for i in 0..<dataArray.count {
     print(dataArray[i])
 }
 //方法四：
 //该方法可以循环输出元组类型，包含下标index及对应的item
 for (index,item) in dataArray.enumerated() {
     print(index,item)
 }

 /*
 输出
 OC:     NSLog(@"Hello, World!");
 Swift:  print("Hello, World!")
 */
 print("Hello, World!")

 // 常量&变量的使用原则：尽量先用 let，只有需要变的时候，再用 var，能够更加安全
 // 定义变量
 var i = 10
 print(i)
 i = 15
 print(i)

 // 定义常量
 let j = 20
 // 常量一经定义不能自改数值
 //j = 25
 print(j)

 /******************************************************/

 // 变量类型
 let num = 10
 print("num:\(num)")
 // 自动类型推导  NSArray *arr = [NSMutalbeArray array];
 let value = 10.10
 print(value)

 // 指定类型
 let dValue: Double = 10.1
 print(dValue)


 /*
 在Swift中值"永远不会"被隐式转换为其他类型, 必须显示转换
 Swift中整数默认是Int64  == long
 Swift中小数默认是Double
 */
 let sum = Double(num) + value
 print(sum)

 let size = CGSize(width: 10, height: 10)
 // Double和CGFloat也需要转换
 let res = size.width + CGFloat(dValue)

 /******************************************************/

 /*
 创建对象
 OC:     alloc initWithXXX 方法
 Swift:  (xxx:)

 调用方法
 OC:     [UIColor redColor];
 Swift   UIColor.red

 枚举
 OC:      UIButtonTypeContactAdd
 Swift:   UIButtonType.ContactAdd
 */

 let view = UIView(frame: CGRectMake(0, 0, 100, 100))
 view.backgroundColor = UIColor.red

 let btn = UIButton(type: UIButton.ButtonType.contactAdd)
 btn.center = CGPoint(x: 50, y: 50)
 view.addSubview(btn)


 /******************************************************/

 /*
 1.条件不需要加圆括号
 2.{}不能省略
 */
 let intValue = 10
 if intValue > 5{
     print("OK")
 }

 /*
 1.Swift中没有C和OC中非零即真的概念
 2.Swfit中逻辑值只有两个true/false
 */
 if intValue == 10 {
     print(intValue)
 }

 /*
 三目运算符和OC中的一样
 提示: Swift中三目运算符用得很多
 */
 let result = intValue > 20 ? 20 : 10

 /******************************************************/

 /*
 可选类型(Optional) ?
 >表示变量可以有值, 也可以没有值
 >convenience init? 构造函数, ?表示不一定能够实例化出对象

 >!表示告诉编译器一定有值, 编译能够通过, 如果运行时没有值就会直接崩溃
 >提示: ? 和 ! 是所有刚刚接触Swift的OC程序员最蛋疼的问题, 前期开发要注意多看文档和利用编译器提示解决
 */

 let url = NSURL(string: "http://www.520it.com/")
 let url2 = NSURL(string: "http://www.520it.com/李南江")
 // 需要考虑url是否有值
 if url != nil{
     let request = NSURLRequest(url: url! as URL)
 }

 // 不需要考虑url是否有值, 能进入{}一定有值
 if let url3 = NSURL(string: "http://www.520it.com/"){
     let request = NSURLRequest(url: url3 as URL)
 }

 /******************************************************/

 /*
 传统写法:
 >不需要()
 >i没有类型, 使用的是var
 */

 //for var k = 0; k < 10; ++k {
 //    print(k)
 //}

 /*
 Swift
 > 0~9之间, 其中 0..< 中间不能有空格
 > Swift1.0版本 0..10
 */

 for i in 0..<10
 {
     print(i)
 }

 // 0~10
 for i in 0...10
 {
     print(i)
 }

 // 不关心下标可以使用 _ 省略
 // 在Swift中 _ 使用非常广泛
 for _ in 0...10
 {
     print("lnj")
 }

 // while循环
 var n = 0
 while n < 10
 {
     print(n)
     n+1
 }

 // do while
 var m = 0
 repeat{
     print(m)
     m+1
 }while m < 10

 /******************************************************/

 // 定义数组
 let array = ["lnj", "lmj"]

 // 遍历
 for arr in array{
     print(arr)
 }

 // 获取元素
 array[0]
 array[1]

 // 添加元素
 // 不能像不可变数组中添加内容
 //array.append("why")

 // let不可变对象, var可变对象
 var arrayM = ["lnj", "lmj"]
 arrayM.append("why")

 // 在Swift开发中数组可以存放任意类型
 var arrayM2 = ["lnj", "lmj", 123] as [Any]
 arrayM2.append("456")

 // 合并数组
 var arrayM3 = ["zs", "ls", "ww", "zl"]
 arrayM += arrayM3
 //只有相同类型的数组才可以合并
 //arrayM2 += arrayM3

 // 删除
 //arrayM3.removeAtIndex(1)
 arrayM3.remove(at: 1)
 arrayM3

 // 删除所有
 //arrayM3.removeAll()

 // 删除并保留容量
 //arrayM3.removeAll(keepCapacity: true)
 arrayM3.removeAll(keepingCapacity: true)
 arrayM3.capacity
 arrayM3.append("1")
 arrayM3.capacity
 arrayM3.append("2")
 arrayM3.capacity
 arrayM3.append("3")
 arrayM3.capacity
 arrayM3.append("4")
 arrayM3.capacity
 arrayM3.append("5")
 // 超过容量, 容量会直接*2
 arrayM3.capacity


 // 初始化
 var arrayM4: [String]
 arrayM4 = [String]()
 // 数组没有初始化之前不允许做任何操作
 arrayM4.append("lnj")

 /******************************************************/
 // 定义字典
 // 最常见的字典类型[String : NSObject], 例如JSON
 var dict = ["name":"lnj", "age": 30] as [String : Any]

 // 遍历字典
 // k,v 可以随便写, 前面是key后面是value
 for (k, v) in dict{
     print(k)
     print(v)
 }

 // 获取元素
 dict["name"]

 // 添加元素
 // 如果key不存在会新增
 dict["gender"] = "man"
 dict

 // 替换元素
 // 如果key存在会替换
 dict["name"] = "why"

 // 删除元素
 //dict.removeValueForKey("name")
 dict.removeValue(forKey: "name")
 dict

 // 合并字典
 var dict2 = ["score": 123]
 for (k, v) in dict2{
     dict[k] = v
 }
 dict

 // 初始化
 var dict3: [String: NSObject]
 dict3 = [String: NSObject]()
 //dict3["name"] = "lnj"
 dict3

 /******************************************************/

 /*
 Swift中使用String是一个结构体,  效率更高, 支持遍历
 OC中是一个对象
 Swift中的String和OC中的NSString可以很方便的进行转换
 */
 var str = "南哥很帅"
 //for c in str.characters
 //{
 //    print(c)
 //}


 // 字符串拼接
 var str2 = "cool"
 str2 += str

 let age = 30
 let name = "lnj"
 let str3 = "name = \(name), age = \(age)"

 let frmStr = String(format: "%02d:%02d:%02d", arguments: [9, 23, 8])

 // 字符串截取, 建议使用NSString
 let str4 = "xmgcool"
 let nsStr: NSString = str4 as NSString
 let subStr = nsStr.substring(with: NSMakeRange(0, 3))
 let nsStr2 = str4 as NSString
 let subStr2 = nsStr.substring(with: NSMakeRange(1, 3))

 /******************************************************/

 /*
 格式:
 func 函数名称(参数列表) -> 返回值
 语义: 将前面的计算结果, 输出给后面的返回值
 */

 // 没有参数没有返回值
 /*
 1. 可以写为 ->Void
 2. 可以写为 ->()
 3. 可以省略
 */
 func say() -> Void{
     print("lnj")
 }
 say()
 func say2() -> (){
     print("lnj")
 }
 say2()
 func say3(){
     print("lnj")
 }
 say3()
 // 有参数没有返回值
 func sum(a: Int, b: Int){
     print(a + b)
 }
 sum(a: 10, b: 20)

 func summ(a: Int, _ b: Int){
     print(a + b)
 }
 summ(a: 10, 20)

 // xy外部参数, ab内部参数
 // Swift2.0以前可以写#
 func sum2(x a: Int, y b: Int){
     print(a + b)
 }
 sum2(x: 10, y: 20)

 // 没有参数有返回值
 func getNumer() ->Int{
     return 998
 }
 print(getNumer())

 // 有参数有返回值
 func sum3(a: Int, b: Int) ->Int{
     return a + b
 }
 print(sum3(a: 10, b: 20))
 */
