//
//  XZQConst.swift
//  DanTangFromQuanzai
//
//  Created by 权仔 on 16/8/10.
//  Copyright © 2016年 XZQ. All rights reserved.
//

import UIKit

enum XZQTopicType: Int {
    
    // 精选
    case Selection = 4
    
    // 美食
    case Food = 14
    
    // 家居
    case HouseHold = 16
    
    // 数码
    case Digital = 17
    
    // 美物
    case GoodThing = 13
    
    // 杂货
    case Grocery = 22
}

enum XZQShareButtonType: Int {
    
    // 微信朋友圈
    case WeChatTimeline = 0
    
    // 微信好友
    case WeChatSession = 1
    
    // 微博
    case Weibo = 2
    
    // QQ 空间
    case QZone = 3
    
    // QQ 好友
    case QQFriends = 4
    
    // 复制链接
    case CopyLink = 5
}

enum XZQOtherLoginButtonType: Int {
    
    // 微博
    case WeiboLogin = 100
    
    // 微信
    case WeChatLogin = 101
    
    // QQ
    case QQLogin = 102
}

// 服务器地址
let BASE_URL = "http://api.dantangapp.com/"

// 第一次启动
let XZQFirstLaunch = "firstLaunch"

// 是否登录
let isLogin = "isLogin"

// code码 200 操作成功
let RETURN_OK = 200

// 间距
let kMargin: CGFloat = 10.0

// 圆角
let kCornerRadius: CGFloat = 5.0

// 线宽
let kLineWidth: CGFloat = 1.0

// 首页顶部标签指示条的高度
let kIndicatorViewH: CGFloat = 2.0

// 新特性界面图片数量
let kNewFeatureCount = 4

// 顶部标题高度
let kTitlesViewH: CGFloat = 35

// 顶部标题的y
let kTitlesVieY: CGFloat = 64

// 动画时长
let kAnimationDuration = 0.25

// 屏幕的宽
let SCREENW = UIScreen.mainScreen().bounds.size.width

// 屏幕的高
let SCREENH = UIScreen.mainScreen().bounds.size.height

// 分类界面 顶部 item 的高
let kItemH: CGFloat = 75

// 分类界面 顶部 item 的宽
let kItemW: CGFloat = 150

// 我的界面头部图像的宽度
let kXZQMineHeaderImageHeight: CGFloat = 200

// 分享按钮背景高度
let kTopViewH: CGFloat = 230

/// RGBA的颜色设置
func XZQColor(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}

/// 背景灰色
func XZQGlobalColor() -> UIColor {
    return XZQColor(240, g: 240, b: 240, a: 1.0)
}

/// 红色
func XZQGlobalRedColor() -> UIColor {
    return XZQColor(245, g: 80, b: 83, a: 1.0)
}

/// iPhone 5
let isIPhone5 = SCREENH == 568 ? true : false
/// iPhone 6
let isIPhone6 = SCREENH == 667 ? true : false
/// iPhone 6P
let isIPhone6P = SCREENH == 736 ? true : false

















































