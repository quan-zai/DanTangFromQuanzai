//
//  XZQCollectionViewCell.swift
//  DanTangFromQuanzai
//
//  Created by 权仔 on 16/8/25.
//  Copyright © 2016年 XZQ. All rights reserved.
//

import UIKit
import Kingfisher

protocol XZQCollectionViewCellDelegate: NSObjectProtocol {
    func collectionViewCellDidClickedLikeButton(button: UIButton)
}

class XZQCollectionViewCell: UICollectionViewCell {

    weak var delegate: XZQCollectionViewCellDelegate?
    
    var result: XZQSearchResult? {
        didSet {
            let url = result!.cover_image_url!
            
            productImageView.kf_setImageWithURL(NSURL(string: url)!, placeholderImage: nil, optionsInfo: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
                self.placeholderBtn.hidden = true
            }
            likeButton.setTitle(" " + String(result!.favorites_count!) + " ", forState: .Normal)
            titleLabel.text = result!.name
            priceLabel.text = "¥" + String(result!.price!)
        }
    }
    
    var product: XZQProduct? {
        didSet {
            let url = product!.cover_image_url!
            
            productImageView.kf_setImageWithURL(NSURL(string: url)!, placeholderImage: nil, optionsInfo: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
                self.placeholderBtn.hidden = true
            }
            likeButton.setTitle(" " + String(product!.favorites_count!) + " ", forState: .Normal)
            titleLabel.text = product!.name
            priceLabel.text = "¥" + String(product!.price!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    /// 占位图片
    @IBOutlet weak var placeholderBtn: UIButton!
    
    /// 背景图片
    @IBOutlet weak var productImageView: UIImageView!
    
    /// 标题
    @IBOutlet weak var titleLabel: UILabel!
    
    /// 价格
    @IBOutlet weak var priceLabel: UILabel!
    
    /// 喜欢按钮
    @IBOutlet weak var likeButton: UIButton!
    
    
    @IBAction func likeButtonClick(sender: AnyObject) {
        delegate?.collectionViewCellDidClickedLikeButton(sender as! UIButton)
    }

    
    
    
    
    
}
