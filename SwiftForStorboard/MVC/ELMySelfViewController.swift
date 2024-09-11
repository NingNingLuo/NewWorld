//
//  ELMySelfViewController.swift
//  SwiftForStorboard
//
//  Created by elvin on 2024/8/21.
//

import UIKit

class ELMySelfViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    
    var model1 = ELMySelfCellModel()
//    var tableview = UITableView()
    var tableview : UITableView!
    
    // Swift中的懒加载会在第一个访问的时候执行
    // 懒加载其实就是一个提前准备好的的闭包
    lazy var dataArray:[String] = {
        return ["A","B","C"]
    }()
    let customFunc = { () -> [String] in
        return ["D","F","G"]
    }
    // 注意懒加载一定要用var
    lazy var dataList2: [String] = self.customFunc()
    
    //003
    //Swift中定义属性, 必须在构造方法中初始化, 否则就必须加上?
    // 注意: 以下写法代表闭包的返回值可以为nil
    // var finished: ()->()?
    var finished: (()->())?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.addTableViewFunc()
        
//        self.createScrollViewFunc()
        
//        self.blockLoopQuote()
//
//        self.constructorFunction()
//
//        self.createScrollViewFunc()
    }
    
    func addTableViewFunc(){
        
        model1.nameStr = "007"
        print("001-",dataArray)
        print("002--",dataList2)
        print("003---",customFunc())
        
        tableview = UITableView(frame: self.view.bounds, style: .plain)
        tableview.delegate = self
        tableview.dataSource = self
//        tableview.frame = self.view.bounds
        tableview.rowHeight = UITableView.automaticDimension
        self.view.addSubview(tableview)
        
        tableview.reloadData()
    }
    
    //002闭包的返回值
    func createScrollViewFunc(){
        let sc = createScrollView(labelCount: { () -> Int in
            return 15
            }) { (index) -> UILabel in
                let width = 50
                let label = UILabel()
                label.backgroundColor = UIColor.green
                label.textColor = UIColor.darkGray
                label.font = UIFont.systemFont(ofSize: 17)
                label.text = "text\(index)"
                label.frame = CGRect(x: index * width+1, y: 0, width: width, height: 44)
                return label
        }
        view.addSubview(sc)
    }
    func createScrollView(labelCount: ()->Int, labelWithIndex: (_ index:Int)->UILabel) -> UIScrollView{
        // 1.创建UIScrollView
        let sc = UIScrollView(frame: CGRect(x: 0, y: 100, width: 375, height: 44))
        
        let count = labelCount()
//        let width = 50
        // 2.遍历创建UILabel
        for i in 0..<count{
            /*
            let label = UILabel()
            label.backgroundColor = UIColor.greenColor()
            label.textColor = UIColor.darkGrayColor()
            label.font = UIFont.systemFontOfSize(17)
            label.text = "text\(i)"
            label.frame = CGRect(x: i * width, y: 0, width: width, height: 44)
            sc.addSubview(label)
            */
            let label = labelWithIndex(i)
            sc.addSubview(label)
            sc.contentSize = CGSize(width: CGFloat(count) * label.bounds.width, height: 44)
        }
        // 返回UIScrollView
        return sc
    }
    
    //003 闭包循环引用
    func blockLoopQuote(){
        //OC中 __weak typeof(self) weakSelf = self
        weak var weakSelf = self
        loadData { () -> () in
            print("更新UI")
            // 闭包和block很像, 都是提前准备好代码, 在需要时执行
            // block会对外部变量进行copy, 保证执行代码时变量还在
            // block中用到self一定要非常小心
            // 闭包也一样, 为了能够准确定位到view, 所以需要写self
            // 提示: Swift开发中能不写self就不写self, 一看到self就想到闭包
    //            self.view.backgroundColor = UIColor.redColor()
            weakSelf!.view.backgroundColor = UIColor.red
        }
    }
    func loadData(finished: @escaping ()->()){
        print("耗时操作")
        // 保存闭包
        self.finished = finished
        finished()
    }
    // 类似于dealloc方法
    deinit
    {
        print("我滚了")
    }
    
    //004构造函数
    func constructorFunction(){
        
        // 不需要import可以直接使用, 因为Swift中有一个namespace的概念
        // 默认情况下项目名称就是命名空间, 同一个项目所有的资源共享
        // 使用Swift最好使用cocoapods管理三方框架, 避免命名空间相同导致的冲突
        //  ()相当于调用了alloc init
        let p = Person()
        print("\(String(describing: p.name)), \(p.age)")
        
        let p2 = Person(name: "lmj", age: 50)
        print("\(String(describing: p2.name)), \(p2.age)")
        
        let p3 = Person(dict: ["name": "constructorFunction", "age": "constructorFunction"])
        print("\(String(describing: p3.name)), \(p3.age)")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 3
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "ELMySelfTableViewCell"
        // 尝试反复利用已经创建的cell
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ELMySelfTableViewCell
            ?? ELMySelfTableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        // 配置cell的内容
        cell.label.text = "111222\n111222\n111222111222\n111222\n111222"
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
    
}


/*
闭包 类似于 block
block是C语言的, 类似于匿名函数
闭包是定义函数的, Swift中函数就是一种特殊的闭包
闭包的使用和block一样, 用于保存一段代码, 用作回调, 用作执行耗时操作
闭包格式
{
    (参数) -> 返回值类型
    in
    执行语句
}
*/
