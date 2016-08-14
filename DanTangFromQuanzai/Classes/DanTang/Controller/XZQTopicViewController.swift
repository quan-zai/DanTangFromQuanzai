//
//  XZQTopicViewController.swift
//  DanTangFromQuanzai
//
//  Created by 徐正权 on 16/8/13.
//  Copyright © 2016年 XZQ. All rights reserved.
//

import UIKit

let homeCellID = "homeCellID"

class XZQTopicViewController: UITableViewController {
    
    var type = Int()
    
    // 首页列表数据
    var items = [XZQHomeItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = XZQGlobalColor()
        
        setupTableView()
        
        // 添加刷新控件
        refreshControl = XZQRefreshControl()
        refreshControl?.beginRefreshing()
        refreshControl?.addTarget(self, action: #selector(loadHomeData), forControlEvents: .ValueChanged)
        
    }

    func loadHomeData() {
        // 获取首页数据
        XZQNetworkTool.shareNetworkTool.loadHomeInfo(type) { [weak  self] (homeItems) in
            self!.items = homeItems
            self!.tableView!.reloadData()
            self!.refreshControl?.endRefreshing()
        }
    }
    
    func setupTableView() {
        tableView.rowHeight = 160
        tableView.separatorColor = .None
        tableView.contentInset = UIEdgeInsetsMake(kTitlesViewY + kTitlesViewH, 0, tabBarController!.tabBar.height, 0)
        tableView.scrollIndicatorInsets = tableView.contentInset
        
        let nib = UINib(nibName: String(XZQHomeCell), bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: homeCellID)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension XZQTopicViewController: XZQHomeCellDelegate {
    // MARK: - UITableViewDataSource 
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count ?? 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let homeCell = tableView.dequeueReusableCellWithIdentifier(homeCellID) as! XZQHomeCell
        homeCell.selectionStyle = .None
        
        
        return homeCell
    }
    
    
    // MAKR: - UITableViewDelegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    // MARK: - XZQHomeCellDelegate
    func homeCellDidClickedFavoriteButton(button: UIButton) {
        if !NSUserDefaults.standardUserDefaults().boolForKey(isLogin) {
            
        } else {
            
        }
    }
    
}



