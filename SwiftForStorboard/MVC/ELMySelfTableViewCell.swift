//
//  ELMySelfTableViewCell.swift
//  SwiftForStorboard
//
//  Created by elvin on 2024/8/21.
//

import UIKit

class ELMySelfTableViewCell: UITableViewCell {

    var label: UILabel!
    var addBtn : UIButton!
    let model1 = ELMySelfCellModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // 初始化并配置子视图
        label = UILabel()
        label.numberOfLines = 0
        label.frame = CGRect(x: 10, y: 0, width: 100, height: 80)
        self.addSubview(label)
        
//        let btn = UIButton(type: UIButton.ButtonType.contactAdd)
//        btn.center = CGPoint(x: UIScreen.main.bounds.width * 0.5, y: UIScreen.main.bounds.height * 0.5)
//        btn.addTarget(self, action: Selector(("btnClick:")), for: UIControl.Event.touchUpInside)
//        self.addSubview(btn)
        
        
        self.addSubview(titleLB)
        
        addBtn = UIButton(type: UIButton.ButtonType.contactAdd)
//        addBtn.center = CGPoint(x: UIScreen.main.bounds.width * 0.5, y: UIScreen.main.bounds.height * 0.5)
        addBtn.frame = CGRect(x: 100, y: 0, width: 44, height: 44)
        addBtn.addTarget(self, action: Selector(("btnClick:")), for: UIControl.Event.touchUpInside)
        self.addSubview(addBtn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var titleLB = { () -> UILabel in
           let label = UILabel()
           label.text = "这是一个Label"
           label.font = .systemFont(ofSize: 16)
           label.textColor = UIColor.black
            label.frame = CGRect(x: 200, y: 0, width: 100, height: 80)
           return label
       }()
    
    func setDataDict(){
        label.text = ""
    }
    
    func btnClick(btn: UIButton) {
        print(#function)
        print(btn)
    }
}
