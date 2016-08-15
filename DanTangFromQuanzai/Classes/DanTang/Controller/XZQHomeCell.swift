//
//  XZQHomeCell.swift
//  DanTangFromQuanzai
//
//  Created by 徐正权 on 16/8/14.
//  Copyright © 2016年 XZQ. All rights reserved.
//

import UIKit
import Kingfisher

protocol XZQHomeCellDelegate: NSObjectProtocol {
    func homeCellDidClickedFavoriteButton(button: UIButton)
}

class XZQHomeCell: UITableViewCell {

    weak var delegate: XZQHomeCellDelegate?
    
    /// 背景图片
    @IBOutlet weak var bgImageView: UIImageView!
    
    /// 标题
    @IBOutlet weak var titleLabel: UILabel!
    
    /// 喜爱按钮
    @IBOutlet weak var favoriteBtn: UIButton!
    
    ///
    @IBOutlet weak var placeholderBtn: UIButton!
    
    var homeItem: XZQHomeItem? {
        didSet {
            let url = homeItem!.cover_image_url
            bgImageView.kf_setImageWithURL(NSURL(string: url!)!, placeholderImage: nil, optionsInfo: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
                self.placeholderBtn.hidden = true
            }
            titleLabel.text = homeItem!.title
            favoriteBtn.setTitle(" " + String(homeItem!.likes_count!) + " ", forState: .Normal)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        favoriteBtn.layer.cornerRadius = favoriteBtn.height * 0.5
        favoriteBtn.layer.masksToBounds = true
        favoriteBtn.layer.rasterizationScale = UIScreen.mainScreen().scale
        favoriteBtn.layer.shouldRasterize = true
        favoriteBtn.layer.cornerRadius = kCornerRadius
        bgImageView.layer.masksToBounds = true
        bgImageView.layer.shouldRasterize = true
        bgImageView.layer.rasterizationScale = UIScreen.mainScreen().scale

    }

    /**
     点击了喜欢按钮
     
     - parameter sender: 喜欢按钮
     */
    @IBAction func favoriteBtnClick(sender: AnyObject) {
        delegate?.homeCellDidClickedFavoriteButton(sender as! UIButton)
    }
    
    
}
