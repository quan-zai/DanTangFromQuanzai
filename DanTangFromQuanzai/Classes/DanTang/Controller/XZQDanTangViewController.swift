//
//  XZQDanTangViewController.swift
//  DanTangFromQuanzai
//
//  Created by 权仔 on 16/8/11.
//  Copyright © 2016年 XZQ. All rights reserved.
//

import UIKit

class XZQDanTangViewController: XZQBaseViewController
{
    var channels = [XZQChannel]()
    
    /// 标签
    weak var titlesView = UIView()
    
    /// 底部红色指示器
    weak var indicatorView = UIView()
    
    /// 内容视图
    weak var contentView = UIScrollView()
    
    /// 当前选中的按钮
    weak var selectedButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置导航栏
        setupNav()
        
        // 获取首页顶部选择数据
        XZQNetworkTool.shareNetworkTool.loadHomeTopData { [weak self](xzq_channels) in
            for channel in xzq_channels{
                
            }
        }
        
    }
    
}
