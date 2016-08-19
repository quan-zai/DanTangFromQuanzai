//
//  XZQLoginViewController.swift
//  DanTangFromQuanzai
//
//  Created by 权仔 on 16/8/15.
//  Copyright © 2016年 XZQ. All rights reserved.
//

import UIKit

class XZQLoginViewController: XZQBaseViewController {

    /// 手机号
    @IBOutlet weak var mobileField: UITextField!
    
    /// 密码
    @IBOutlet weak var passwordField: UITextField!
    
    /// 忘记密码
    @IBOutlet weak var forgetPwdBtn: UIButton!
    
    /// 登录
    @IBOutlet weak var loginButton: UIButton!
    
    override func  viewDidLoad() {
        super.viewDidLoad()
        
        // 设置导航栏的左右按钮
        setupBarButtonItem()
    }
    
    @IBAction func loginButtonClick(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: isLogin)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - 设置导航栏按钮
    private func setupBarButtonItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取消", style: .Plain, target: self, action: #selector(cancelButtonClick))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .Plain, target: self, action: #selector(regiisterButtonClick))
        
    }
    
    // 取消按钮点击
    func cancelButtonClick() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // 注册按钮点击
    func regiisterButtonClick() {
        
        
    }
    
    @IBAction func otherLoginButtonClick(sender: AnyObject) {
        if let buttonType = XZQOtherLoginButtonType(rawValue: sender.tag) {
            switch buttonType {
            case .WeiboLogin:
                
                break
            case .WeChatLogin:
                
                break
            case .QQLogin:
                
                break
            }
        }
    }

}
