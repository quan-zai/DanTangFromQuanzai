//
//  XZQNewfeatureViewController.swift
//  DanTangFromQuanzai
//
//  Created by 权仔 on 16/8/10.
//  Copyright © 2016年 XZQ. All rights reserved.
//

import UIKit
import SnapKit

let newFeatureID = "newFeatureID"

class XZQNewfeatureViewController: UICollectionViewController
{
    private var layout: UICollectionViewFlowLayout = XZQNewfeatureLayout()
    
    init() {
        super.init(collectionViewLayout: layout)
        collectionView?.showsVerticalScrollIndicator = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.registerClass(XZQNewfeatureCell.self, forCellWithReuseIdentifier: newFeatureID)
    }
    
}

extension XZQNewfeatureViewController {
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return kNewFeatureCount
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(newFeatureID, forIndexPath: indexPath) as! XZQNewfeatureCell
        cell.imageIndex = indexPath.item
        
        return cell
    }
    
    // 完全显示一个cell 之后调用
    override func collectionView(collectionView: UICollectionView, didEndDisplayingCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        let path = collectionView.indexPathsForVisibleItems().last!
        if path.item == (kNewFeatureCount - 1) {
            let cell = collectionView.cellForItemAtIndexPath(path) as! XZQNewfeatureCell
            cell.startBtnAnimation()
        }
        
    }
    
}

// XZQNewfeatureCell
private class XZQNewfeatureCell: UICollectionViewCell {
    
    private lazy var iconView = UIImageView()
    
    private lazy var startButton: UIButton = {
        let btn = UIButton()
        
        btn.setBackgroundImage(UIImage(named:"btn_begin"), forState: .Normal)
        
        btn.addTarget(self, action: #selector(startButtonClick), forControlEvents: .TouchUpInside);
        btn.layer.masksToBounds = true
        btn.hidden = true
        
        return btn
    }()
    
    private var imageIndex: Int? {
        didSet {
            iconView.image = UIImage(named: "walkthrough_\(imageIndex! + 1)")
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startBtnAnimation() {
        startButton.hidden = false
        
        // 执行动画
        startButton.transform = CGAffineTransformMakeScale(0.0, 0.0)
        startButton.userInteractionEnabled = false
        
        UIView.animateWithDuration(2, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 5, options: UIViewAnimationOptions(rawValue: 0), animations: { 
                // 清空形变
            self.startButton.transform = CGAffineTransformIdentity
            }) { (_) in
                self.startButton.userInteractionEnabled = true
        }
    }
    
    func setupUI() {
        contentView.addSubview(iconView)
        contentView.addSubview(startButton)
        
        iconView.snp_makeConstraints { (make) in
            make.edges.equalTo(contentView)
        }
        
        startButton.snp_makeConstraints { (make) in
            make.bottom.equalTo(contentView.snp_bottom).offset(-50)
            make.size.equalTo(CGSizeMake(150, 40))
            make.centerX.equalTo(0)
        }
    }
        
    @objc func startButtonClick() {
        UIApplication.sharedApplication().keyWindow!.rootViewController = XZQTabBarController()
    }
}


// XZQNewfeatureLayout
private class  XZQNewfeatureLayout: UICollectionViewFlowLayout
{
    // 准备布局
    private override func prepareLayout()
    {
        // 设置 layout 布局
        itemSize = UIScreen.mainScreen().bounds.size
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        scrollDirection = .Horizontal
        
        // 设置 contentView 属性
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.bounces = false
        collectionView?.pagingEnabled = true
    }
}
