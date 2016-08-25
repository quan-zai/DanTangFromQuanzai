//
//  XZQMeFooterView.swift
//  DanTangFromQuanzai
//
//  Created by 权仔 on 16/8/25.
//  Copyright © 2016年 XZQ. All rights reserved.
//

import UIKit

class XZQMeFooterView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
    }
    
    private lazy var meBlankButton: UIButton = {
        let meBlankButton = UIButton()
        meBlankButton.setTitleColor(XZQColor(200, g: 200, b: 200, a: 1.0), forState: .Normal)
        meBlankButton.width = 100
        meBlankButton.titleLabel?.font = UIFont.systemFontOfSize(15)
        meBlankButton.setImage(UIImage(named: "Me_blank_50x50_"), forState: .Normal)
        meBlankButton.addTarget(self, action: #selector(footerViewButtonClick), forControlEvents: .TouchUpInside)
        meBlankButton.imageView?.sizeToFit()
        
        return meBlankButton
    }()
    
    func footerViewButtonClick() {
        let nav = XZQNavigationController(rootViewController: XZQLoginViewController())
        UIApplication.sharedApplication().keyWindow?.rootViewController?.presentationController(nav, animated: true, completion: nil)
    }
    
}
