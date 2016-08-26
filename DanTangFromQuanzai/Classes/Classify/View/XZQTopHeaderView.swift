//
//  XZQTopHeaderView.swift
//  DanTangFromQuanzai
//
//  Created by 权仔 on 16/8/26.
//  Copyright © 2016年 XZQ. All rights reserved.
//

import UIKit

protocol XZQTopHeaderViewDelegate: NSObjectProtocol {
    func topViewDidClickedMoreButton(button: UIButton)
}

class XZQTopHeaderView: UIView {
    weak var delegate: XZQTopHeaderViewDelegate?
    
    // 查看全部按钮
    @IBAction func viewAllButton(sender: UIButton) {
        
    }


}
