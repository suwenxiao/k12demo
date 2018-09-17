//
//  DemoViewController.swift
//  CreatClassDemo
//
//  Created by bestsu on 2018/9/12.
//  Copyright © 2018年 bestsu. All rights reserved.
//

import UIKit

class DemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton()
        button.backgroundColor = UIColor.orange
        button.center = self.view.center
        button.bounds = CGRect.init(x: 0, y: 0, width: 100, height: 100)
        button.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        
        view.addSubview(button)
    }

    
    @objc private func btnClick(){
        let vc = ZYNoneIdentifiCreatViewController()
        self.navigationController?.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
