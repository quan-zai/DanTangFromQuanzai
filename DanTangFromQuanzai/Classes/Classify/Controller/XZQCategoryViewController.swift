//
//  XZQCategoryViewController.swift
//  DanTangFromQuanzai
//
//  Created by 权仔 on 16/8/11.
//  Copyright © 2016年 XZQ. All rights reserved.
//

import UIKit

class XZQCategoryViewController: XZQBaseViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Feed_SearchBtn_18x18_"), style: .Plain, target: self, action: #selector(categoryRightyButtonClick))
        setupScrollView()
    }
    
    func categoryRightyButtonClick() {
        
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        // 顶部控制器
        let headerViewContrller = XZQCategoryHeaderViewController()
        addChildViewController(headerViewContrller)
        
        let topBGView = UIView(frame: CGRectMake(0, 0, SCREENW, 135))
        scrollView.addSubview(topBGView)
        
        let headerVC = childViewControllers[0]
        topBGView.addSubview(headerVC.view)
        
        let bottomBGView = XZQCategoryBottomView(frame: CGRectMake(0, CGRectGetMaxY(topBGView.frame) + 10, SCREENW, SCREENH - 160))
        bottomBGView.backgroundColor = XZQGlobalColor()
        bottomBGView.deleg
        
        
        
        
    }
    
    /// 懒加载 创建scrollView
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.scrollEnabled = true
        scrollView.backgroundColor = XZQGlobalColor()
        scrollView.frame = CGRectMake(0, 0, SCREENW, SCREENH)
        
        return scrollView
    }()
    
    
    
    
    
}
