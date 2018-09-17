//
//  ZYChoseClassControl.swift
//  CreatClassDemo
//
//  Created by bestsu on 2018/9/13.
//  Copyright © 2018年 bestsu. All rights reserved.
//

import UIKit

class ZYChoseClassControl: UIControl {

    var className: String? {
        didSet{
            self.titleLabel.text = className ?? ""
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isUserInteractionEnabled = false
        setUI()
        setGuester()
    }
    
    override var isSelected: Bool{
        didSet{
            setStyle(isSelect: isSelected)
        }
    }
    
    private func setStyle(isSelect: Bool){
        if isSelected == true{
            self.bgView.layer.borderColor = UIColor.init(hex6: 0x2BC17C).cgColor
            self.bgView.layer.borderWidth = ceilStandardPtf(3)
            self.titleLabel.textColor = UIColor.init(hex6: 0x2BC17C)
        }else{
            self.bgView.layer.borderColor = UIColor.init(hex: 0x222222, alpha: 0.45).cgColor
            self.bgView.layer.borderWidth = ceilStandardPtf(3)
            self.titleLabel.textColor = UIColor.init(hex: 0x222222, alpha: 0.45)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI(){
        addSubview(bgView)
        bgView.addSubview(titleLabel)
        
        bgView.mas_makeConstraints { (make) in
            make?.edges.mas_equalTo()(self)
        }
        
        titleLabel.mas_makeConstraints { (make) in
            make?.centerY.mas_equalTo()(self)
            make?.left.equalTo()(ceilStandardPtf(5))
            make?.right.equalTo()(ceilStandardPtf(-5))
        }
        
    }
    
    private func setGuester(){
        let guester = UITapGestureRecognizer.init(target: self, action: #selector(guesterClick))
        bgView.addGestureRecognizer(guester)
    }
    
    @objc private func guesterClick(){
        self.sendActions(for: .touchUpInside)
    }
    
    private lazy var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = ceilStandardPtf(12)
        view.layer.masksToBounds = true
        view.layer.borderColor = UIColor.init(hex: 0x222222, alpha: 0.45).cgColor
        view.layer.borderWidth = ceilStandardPtf(3)
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "一年级99班"
        label.textColor = UIColor.init(hex: 0x222222, alpha: 0.45)
        label.font = UIFont.systemFont(ofSize: ceilStandardPtf(42))
        label.textAlignment = .center
        return label
    }()

}
