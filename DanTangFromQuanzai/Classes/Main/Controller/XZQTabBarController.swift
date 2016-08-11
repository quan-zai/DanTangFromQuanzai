//
//  XZQTabBarController.swift
//  DanTangFromQuanzai
//
//  Created by 权仔 on 16/8/10.
//  Copyright © 2016年 XZQ. All rights reserved.
//

import UIKit

class XZQTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = XZQColor(245, g: 80, b: 83, a: 1.0)
        
        addChildViewController()
    }
    
    // 添加子控制器
    
    private func addChildViewController() {
        
    }
    
    private func addChildViewController(childControllerName: String, title: String, imageName: String) {
        // 动态获取命名空间
        let ns = NSBundle.mainBundle().infoDictionary!
        
        
    }
    
}

