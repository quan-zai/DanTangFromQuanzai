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
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
