//
//  XZQNewfeatureViewController.swift
//  DanTangFromQuanzai
//
//  Created by 权仔 on 16/8/10.
//  Copyright © 2016年 XZQ. All rights reserved.
//

import UIKit

class XZQNewfeatureViewController: UICollectionViewController
{
    private var layout: UICollectionViewFlowLayout = XZQNewfeatureLayout()
    
    init() {
        super.init(collectionViewLayout: layout)
        collectionView?.showsVerticalScrollIndicator = false
    }
    
    
     
    
    
}
