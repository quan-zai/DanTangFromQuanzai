//
//  XZQMineHeaderView.swift
//  DanTangFromQuanzai
//
//  Created by 权仔 on 16/8/25.
//  Copyright © 2016年 XZQ. All rights reserved.
//

import UIKit

class XZQMineHeaderView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        // 初始化UI
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        // 添加子控件
        addSubview(bgImageView)
        addSubview(settingButton)
        addSubview(messageButton)
        addSubview(iconButton)
        addSubview(nameLabel)
        
        // 布局
        bgImageView.snp_makeConstraints { (make) in
            make.left.bottom.right.equalTo(self)
            make.top.equalTo(-20)
        }
        
        settingButton.snp_makeConstraints { (make) in
            make.size.equalTo(CGSizeMake(44, 44))
            make.right.equalTo(self)
            make.top.equalTo(0)
        }
        
        messageButton.snp_makeConstraints { (make) in
            make.size.equalTo(CGSizeMake(44, 44))
            make.left.equalTo(self)
            make.top.equalTo(settingButton.snp_top)
        }
        
        iconButton.snp_makeConstraints { (make) in
            make.centerX.equalTo(self.centerX)
            make.size.equalTo(CGSizeMake(75, 75))
            make.bottom.equalTo(nameLabel.snp_top).offset(-kMargin)
        }
        
        nameLabel.snp_makeConstraints { (make) in
            make.bottom.equalTo(self.snp_bottom).offset(-3 * kMargin)
            make.left.right.equalTo(self)
            make.height.equalTo(2 * kMargin)
        }
    }
    
    /// 懒加载，创建背景图片
    lazy var bgImageView: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.contentMode = .ScaleAspectFill
        bgImageView.image = UIImage(named: "Me_ProfileBackground")
        
        return bgImageView
    }()
    
    /// 懒加载，创建左上角消息按钮
    lazy var messageButton: UIButton = {
        let messageButton = UIButton()
        messageButton.setImage(UIImage(named:"Me_message_20x20_"), forState: .Normal)
        
        return messageButton
    }()

    /// 懒加载，创建设置按钮
    lazy var settingButton: UIButton = {
        let settingButton = UIButton()
        settingButton.setImage(UIImage(named: "Me_settings_20x20_"), forState: .Normal)
        
        return settingButton
    }()
    
    /// 懒加载，创建头像
    lazy var iconButton: UIButton = {
        let iconButton = UIButton()
        iconButton.setBackgroundImage(UIImage(named: "Me_AvatarPlaceholder_75x75_"), forState: .Normal)
        iconButton.layer.cornerRadius = iconButton.width * 0.5
        iconButton.layer.masksToBounds = true
        
        return iconButton
    }()
    
    /// 懒加载，创建昵称标签
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "hrscy"
        nameLabel.textColor = UIColor.whiteColor()
        nameLabel.font = UIFont.systemFontOfSize(15.0)
        nameLabel.textAlignment = .Center
        
        return nameLabel
    }()
}
