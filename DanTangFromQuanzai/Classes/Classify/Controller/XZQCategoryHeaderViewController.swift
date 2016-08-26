//
//  XZQCategoryHeaderViewController.swift
//  DanTangFromQuanzai
//
//  Created by 权仔 on 16/8/26.
//  Copyright © 2016年 XZQ. All rights reserved.
//

import UIKit

let categoryCollectionCellID = "XZQCategoryCollectionViewCell"

class XZQCategoryHeaderViewController: XZQBaseViewController {

    var collections = [XZQCollection]()
    
    var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clearColor()
        // 设置UI
        setupUI()
        // 分类界面 顶部 专题集合
        XZQNetworkTool.shareNetworkTool.loadCategoryCollection(6) { (collections) in
            self.collections = collections
            self.collectionView!.reloadData()
        }
    }
    
    // 设置UI
    private func setupUI() {
        let headerView = NSBundle.mainBundle().loadNibNamed(String(XZQTopHeaderView), owner: nil, options: nil).last as! XZQTopHeaderView
        headerView.frame = CGRectMake(0, 0, SCREENW, 40)
        headerView.delegate = self
        view.addSubview(headerView)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .Horizontal
        let collectionView = UICollectionView(frame: CGRectMake(0, 40, SCREENW, 95), collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.whiteColor()
        let cellNib = UINib(nibName: String(XZQCategoryCollectionViewCell), bundle: nil)
        collectionView.registerNib(cellNib, forCellWithReuseIdentifier: categoryCollectionCellID)
        view.addSubview(collectionView)
        
        self.collectionView = collectionView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension XZQCategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, XZQTopHeaderViewDelegate {
    
    
    
}

