//
//  XZQMeViewController.swift
//  DanTangFromQuanzai
//
//  Created by 权仔 on 16/8/11.
//  Copyright © 2016年 XZQ. All rights reserved.
//

import UIKit

class XZQMeViewController: XZQBaseViewController {

    var cellCount = 0
    
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
    
    // MARK: - 头部按钮点击
    func iconButtonClick() {
        // 判断是否登录
    }
    
    func messageButtonClick() {
        
    }
    
    
    func settingButtonClick() {
        
    }
    
    private lazy var footerView: XZQMeFooterView = {
        let footerView = XZQMeFooterView()
        footerView.width = S
    }()
    
    
}

extension XZQMeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
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
    
    
    
    
    
}

