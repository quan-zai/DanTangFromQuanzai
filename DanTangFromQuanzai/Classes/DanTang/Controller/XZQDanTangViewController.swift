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
        XZQNetworkTool.shareNetworkTool.loadHomeTopData { [weak self] (xzq_channels) in
            for channel in xzq_channels{
                let vc = XZQTopicViewController()
                vc.title = channel.name!
                vc.type = channel.id!
                self!.addChildViewController(vc)
            }
            // 设置顶部标签栏
            self!.setupTitlesView()
            
            // 底部的scrollView
            self!.setupContentView()
        }
    }
    
    // 顶部标签栏
    func setupTitlesView() {
        // 顶部背景
        let bgView = UIView()
        bgView.frame = CGRectMake(0, kTitlesViewY, SCREENW, SCREENH)
        view.addSubview(bgView)
        
        // 标签
        let titlesView = UIView()
        titlesView.backgroundColor = XZQGlobalColor()
        titlesView.frame = CGRectMake(0, 0, SCREENW - kTitlesViewH, kTitlesViewH)
        bgView.addSubview(titlesView)
        self.titlesView = titlesView
        
        // 底部红色指示器
        let indicatorView = UIView()
        indicatorView.backgroundColor = XZQGlobalRedColor()
        indicatorView.height = kIndicatorViewH
        indicatorView.y = kTitlesViewH - kIndicatorViewH
        indicatorView.tag = -1
        self.indicatorView = indicatorView
        
        titlesView.addSubview(indicatorView)
        
        // 选择按钮
        let arrowButton = UIButton()
        arrowButton.frame = CGRectMake(SCREENW - kTitlesViewH, 0, kTitlesViewH, kTitlesViewH)
        arrowButton.setImage(UIImage(named: "arrow_index_down_8x4_"), forState: .Normal)
        arrowButton.addTarget(self, action: #selector(arrowButtonClick(_ :)), forControlEvents: .TouchUpInside)
        arrowButton.backgroundColor = XZQGlobalColor()
        bgView.addSubview(arrowButton)
        
        // 内部子标签
        let count = childViewControllers.count
        let width = titlesView.width / CGFloat(count)
        let height = titlesView.height
        
        for index in 0..<count {
            let button = UIButton()
            button.height = height
            button.width = width
            button.x = CGFloat(index) * width
            button.tag = index
            let vc = childViewControllers[index]
            button.titleLabel!.font = UIFont.systemFontOfSize(14)
            button.setTitle(vc.title!, forState: .Normal)
            button.setTitleColor(UIColor.grayColor(), forState: .Normal)
            button.setTitleColor(XZQGlobalRedColor(), forState: .Disabled)
            button.addTarget(self, action: #selector(titlesClick(_ :)), forControlEvents: .TouchUpInside)
            titlesView.addSubview(button)
            
            // 默认点击了第一个按钮
            if index == 0 {
                button.enabled = false
                selectedButton = button
                
                // 让按钮内部的label按照文字来计算内容
                button.titleLabel?.sizeToFit()
                indicatorView.width = button.titleLabel!.width
                indicatorView.centerX = button.centerX
            }
        }
    }
    
    // 箭头按钮点击
    func arrowButtonClick(button: UIButton) {
        UIView.animateWithDuration(kAnimationDuration) { 
            button.imageView?.transform = CGAffineTransformRotate(button.imageView!.transform, CGFloat(M_PI))
        }
    }
    
    // 标签上的按钮点击
    func titlesClick(button: UIButton) {
        // 修改按钮状态
        selectedButton!.enabled = true
        button.enabled = false
        selectedButton = button
        
        // 让标签执行动画
        UIView.animateWithDuration(kAnimationDuration) { 
            self.indicatorView!.width = self.selectedButton!.titleLabel!.width
            self.indicatorView!.centerX = self.selectedButton!.centerX
        }
        
        // 滚动，切换自控制器
        var offSet = contentView!.contentOffset
        offSet.x = CGFloat(button.tag) * contentView!.width
        contentView!.setContentOffset(offSet, animated: true)
    }
    
    // 底部的scrollView
    func setupContentView() {
        // 不要自动调整inset
        automaticallyAdjustsScrollViewInsets = false
        
        let contentView = UIScrollView()
        contentView.frame = view.bounds
        contentView.delegate = self
        contentView.contentSize = CGSizeMake(contentView.width * CGFloat(childViewControllers.count), 0)
        contentView.pagingEnabled = true
        view.insertSubview(contentView, atIndex: 0)
        self.contentView = contentView
        
        // 添加第一个控制器的view
        scrollViewDidEndScrollingAnimation(contentView)
    }
    
    // 设置导航栏
    func setupNav() {
        view.backgroundColor = UIColor.whiteColor()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Feed_SearchBtn_18x18_"), style: .Plain, target: self, action: #selector(dantangRightButtonClick))
    }
    
    func dantangRightButtonClick() {
//        let searchBarVC = xzqsearchViewController()navigationController?.pushViewController((searchBarVC, animated: true)
    }
}

extension XZQDanTangViewController: UIScrollViewDelegate {
    // MARK: - UIScrollViewDelegate 
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
            // 添加自控制器的View
            // 当前索引
            let index = Int(scrollView.contentOffset.x / scrollView.width)
            
            // 取出子控制器
            let vc = childViewControllers[index]
            vc.view.x = scrollView.contentOffset.x
            
            //设置控制器的y值为0（默认为20）
            vc.view.y = 0
            
            // 设置控制器的view的height值为整个屏幕的高度（默认是比屏幕少20）
            vc.view.height = scrollView.height
            scrollView.addSubview(vc.view)
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        scrollViewDidEndScrollingAnimation(scrollView)
        
        // 当前索引
        let index = Int(scrollView.contentOffset.x / scrollView.width)
        
        // 点击Button
        let button = titlesView!.subviews[index] as! UIButton
        titlesClick(button)
    }
}




