//
//  XZQProductViewController.swift
//  DanTangFromQuanzai
//
//  Created by 权仔 on 16/8/11.
//  Copyright © 2016年 XZQ. All rights reserved.
//

import UIKit

let collectionCellID = "XZQCollectionViewCell"

class XZQProductViewController: XZQBaseViewController
{
    var products = [XZQProduct]()
    
    weak var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置collectionView
        setupCollectionView()
        
        XZQNetworkTool.shareNetworkTool.loadProductData { [weak self] (products) in
            self!.products = products
            self!.collectionView!.reloadData()
        }
    }
    
    // 设置collectionView
    private func setupCollectionView() {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.dataSource = self
        collectionView.backgroundColor = view.backgroundColor
        collectionView.dataSource = self
        
        let nib = UINib(nibName: String(XZQCollectionViewCell), bundle: nil)
        collectionView.registerNib(nib, forCellWithReuseIdentifier: collectionCellID)
        view.addSubview(collectionView)
        
        self.collectionView = collectionView
    }
}

extension XZQProductViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewFlowLayout {
    
    // MARK: - UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(collectionCellID, forIndexPath: indexPath) as! XZQCollectionViewCell
        
        
    }
    
}








