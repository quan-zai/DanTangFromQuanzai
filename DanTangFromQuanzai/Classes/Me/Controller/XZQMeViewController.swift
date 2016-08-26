//
//  XZQMeViewController.swift
//  DanTangFromQuanzai
//
//  Created by 权仔 on 16/8/11.
//  Copyright © 2016年 XZQ. All rights reserved.
//

import UIKit

class XZQMeViewController: XZQBaseViewController {

    var cellCount = 0
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    // 创建 tableView
    private func setupTableView() {
        let tableView = UITableView()
        tableView.frame = view.bounds
        view.addSubview(tableView)
        tableView.separatorStyle = .None
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableHeaderView = headerView
//        tableView.tableFooterView = footerView
    }
    
    private lazy var headerView: XZQMineHeaderView = {
        let headerView = XZQMineHeaderView()
        headerView.frame = CGRectMake(0, 0, SCREENH, kXZQMineHeaderImageHeight)
        headerView.iconButton.addTarget(self, action: #selector(iconButtonClick), forControlEvents: .TouchUpInside)
        headerView.messageButton.addTarget(self, action: #selector(messageButtonClick), forControlEvents: .TouchUpInside)
        headerView.settingButton.addTarget(self, action: #selector(messageButtonClick), forControlEvents: .TouchUpInside)
        
        return headerView
    }()
    
    private lazy var footerView: XZQMeFooterView = {
        let footerView = XZQMeFooterView()
        footerView.width = SCREENH
        footerView.height = 200
        return footerView
    }()
    
    // MARK: - 头部按钮点击
    func iconButtonClick() {
        // 判断是否登录
        if NSUserDefaults.standardUserDefaults().boolForKey(isLogin) {
            let actionSheet = UIAlertController(title: "", message: nil, preferredStyle: .ActionSheet)
            
            let cameraACtion = UIAlertAction(title: "编辑资料", style: .Default, handler: { (_) in
            })
            
            let photoAction = UIAlertAction(title: "退出登录", style: .Destructive, handler: { (_) in
                NSUserDefaults.standardUserDefaults().setBool(false, forKey: isLogin)
            })
            
            let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: { (_) in
                
            })
            actionSheet.addAction(cancelAction)
            actionSheet.addAction(cameraACtion)
            actionSheet.addAction(photoAction)
            
            self.presentViewController(actionSheet, animated: true, completion: nil)
        } else {
            let loginVC = XZQLoginViewController()
            loginVC.title = "登录"
            let nav = XZQNavigationController(rootViewController: loginVC)
            presentViewController(nav, animated: true, completion: nil)
        }
    }
    
    func messageButtonClick() {
        
    }
    
    func settingButtonClick() {
        
    }
}

extension XZQMeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let choiceView = XZQMeChoiceView()
        
        return choiceView
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCount
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY < 0 {
            var tempFrame = headerView.bgImageView.frame
            tempFrame.origin.y = offsetY
            tempFrame.size.height = kXZQMineHeaderImageHeight - offsetY
            headerView.bgImageView.frame = tempFrame
        }
    }
}

