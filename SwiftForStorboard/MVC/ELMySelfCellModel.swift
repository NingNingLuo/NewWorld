//
//  ELMySelfCellModel.swift
//  SwiftForStorboard
//
//  Created by elvin on 2024/8/21.
//

import UIKit
//import Foundation

class ELMySelfCellModel: NSObject {

    var nameStr:String? {
        // 给属性设置完值之后调用, 用于替换OC中setter方法更新UI
        didSet{
            nameStr = nameStr! + "你的名字"
        }
    }
    
    var age:Int {
        // 如果只重写了get,没有set. 那么属性是一个"计算型"属性
        // 计算型属性不占用存储空间, 相当于OC中的readOnly
        get{
            return 32
        }
    }
    
    var sex:String {
        // 如果只有get可以简写为
        return "man"
    }
    
    
    
    var _name:String?
    var name:String?{
        get{
            return _name
        }
        set{
           _name = newValue
        }
    }
    
    
}


//004构造函数
class Person: NSObject {
    // 定义 "对象"属性可以使用?
    var name: String?
    // 定义 "基本数据类型" 最好赋初始值
    // Swift中基本数据类型设置为? , super.init()不会分配存储空间
    // 所以利用KVC赋值会报属性找不到
//    var age: Int?
    var age: Int = 0
    
    // 如果要初始化必须要重写init方法, 只要重写了init方法就不用加?号了

    override init()
    {
        name = "lnj"
        age = 30
    }
    //Swift中支持方法名重载, 同样的名称只要参数不同就可以
    // 一旦自定义了init方法, 但是没有重写init方法, 默认的init方法就会失效
    init(name:String, age:Int)
    {
        self.name = name
        self.age = age
    }
    
    init(dict: [String: String])
    {
        // 使用kvc给self赋值之前, 必须调用super.init,
        // 目的是保证对象创建成功
        super.init()
        self.setValuesForKeys(dict)
    }
}
