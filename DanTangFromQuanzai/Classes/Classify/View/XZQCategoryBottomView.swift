//
//  XZQCategoryBottomView.swift
//  DanTangFromQuanzai
//
//  Created by 权仔 on 16/8/26.
//  Copyright © 2016年 XZQ. All rights reserved.
//

import UIKit

protocol XZQCategoryBottomViewDelegate: NSObjectProtocol {
    func bottomViewButtonDidClicked(button: UIButton)
}


class XZQCategoryBottomView: UIView {

    weak var delegate: XZQCategoryBottomViewDelegate?
    
    var outGroups = [AnyObject]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 分类界面 风格，品类
        XZQNetworkTool.shareNetworkTool.loadCategoryGroup { [weak self](outGroups) in
            self!.outGroups = outGroups
            self!.setupUI()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        let topGroups = outGroups[0] as! NSArray
        let bottomGroups = outGroups[1] as! NSArray
        
        // 风格
        let topView = UIView()
        topView.width = SCREENW
        topView.backgroundColor = UIColor.whiteColor()
        addSubview(topView)
        
        let styleLabel = setupLabel("风格")
        topView.addSubview(styleLabel)
        
        for index in 0..<topGroups.count {
            let group = topGroups[index] as! XZQGroup
            let button = setupButton(index, group: group)
            topView.addSubview(button)
            if index == topGroups.count - 1 {
                topView.height = CGRectGetMaxY(button.frame) + kMargin
            }
        }
        
        // 品类
        let bottomView = UIView()
        bottomView.width = SCREENW
        bottomView.y = CGRectGetMaxY(topView.frame) + kMargin
        bottomView.backgroundColor = UIColor.whiteColor()
        addSubview(bottomView)
        let categoryLabel = setupLabel("品类")
        bottomView.addSubview(categoryLabel)
        
        for index in 0..<bottomGroups.count {
            let group = bottomGroups[index] as! XZQGroup
            let button = setupButton(index, group: group)
            bottomView.addSubview(button)
            if index == bottomGroups.count - 1 {
                bottomView.height = CGRectGetMaxY(button.frame) + kMargin
            }
        }
    }
    
    private func setupButton(index: Int, group: XZQGroup) -> XZQVerticalButton {
        let buttonW: CGFloat = SCREENW / 4
        let buttonH: CGFloat = buttonW
        let styleLabelH: CGFloat = 40
        
        let button = XZQVerticalButton()
        button.width = buttonW
        button.height = buttonH
        button.x = buttonW * CGFloat(index % 4)
        button.y = buttonH * CGFloat(index / 4) + styleLabelH
        if index > 3 {
            button.y = buttonH * CGFloat(index / 4) + styleLabelH + kMargin
        }
        
        button.tag = group.id!
        button.addTarget(self, action: #selector(groupButtonClick(_:)), forControlEvents: .TouchUpInside)
        button.titleLabel?.font = UIFont.systemFontOfSize(15)
        button.setTitleColor(XZQColor(0, g: 0, b: 0, a: 0.6), forState: .Normal)
        button.kf_setImageWithURL(NSURL(string: group.icon_url!)!, forState: .Normal)
        button.setTitle(group.name, forState: .Normal)
        
        return button
    }
    
    private func setupLabel(title: String) -> UILabel {
        let styleLabel = UILabel(frame: CGRectMake(10, 0, SCREENW - 10, 40))
        styleLabel.text = title
        styleLabel.textColor = XZQColor(0, g: 0, b: 0, a: 0.6)
        styleLabel.font = UIFont.systemFontOfSize(16)
        
        return styleLabel
    }
    
    func groupButtonClick(button: UIButton) {
        delegate?.bottomViewButtonDidClicked(button)
    }
}
