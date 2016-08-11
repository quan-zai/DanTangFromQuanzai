//
//  XZQNetWorkTool.swift
//  DanTangFromQuanzai
//
//  Created by 权仔 on 16/8/10.
//  Copyright © 2016年 XZQ. All rights reserved.
//

import Foundation
import Alamofire
import SVProgressHUD
import SwiftyJSON

class XZQNetworkTool: NSObject
{
    /// 单例
    static let shareNetworkTool = XZQNetworkTool()
    
    /// 获取首页数据 (XZQHomeItem是model)
    func loadHomeInfo(id: Int, finished:(homeItems: [XZQHomeItem]) -> ()) {
        //        let url = BASE_URL + "v1/channels/\(id)/items?gender=1&generation=1&limit=20&offset=0"
        let url = BASE_URL + "v1/channels/\(id)/items"
        let params = ["gender": 1,
                      "generation": 1,
                      "limit": 20,
                      "offset": 0]
        Alamofire
            .request(.GET, url, parameters: params)
            .responseJSON { (response) in
                guard response.result.isSuccess else {
                    SVProgressHUD.showErrorWithStatus("加载失败...")
                    return
                }
                if let value = response.result.value {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    let message = dict["message"].stringValue
                    guard code == RETURN_OK else {
                        SVProgressHUD.showInfoWithStatus(message)
                        return
                    }
                    let data = dict["data"].dictionary
                    //  字典转成模型
                    if let items = data!["items"]?.arrayObject {
                        var homeItems = [XZQHomeItem]()
                        for item in items {
                            let homeItem = XZQHomeItem(dict: item as! [String: AnyObject])
                            homeItems.append(homeItem)
                        }
                        finished(homeItems: homeItems)
                    }
                }
        }
    }
    
    /// 获取首页顶部选择数据
    func loadHomeTopData(finished:(xzq_channels: [XZQChannel]) -> ()) {
        
        let url = BASE_URL + "v2/channels/preset"
        let params = ["gender": 1,
                      "generation": 1]
        Alamofire
            .request(.GET, url, parameters: params)
            .responseJSON { (response) in
                guard response.result.isSuccess else {
                    SVProgressHUD.showErrorWithStatus("加载失败...")
                    return
                }
                if let value = response.result.value {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    let message = dict["message"].stringValue
                    guard code == RETURN_OK else {
                        SVProgressHUD.showInfoWithStatus(message)
                        return
                    }
                    SVProgressHUD.dismiss()
                    let data = dict["data"].dictionary
                    if let channels = data!["channels"]?.arrayObject {
                        var xzq_channels = [XZQChannel]()
                        for channel in channels {
                            let xzq_channel = XZQChannel(dict: channel as! [String: AnyObject])
                            xzq_channels.append(xzq_channel)
                        }
                        finished(xzq_channels: xzq_channels)
                    }
                }
        }
    }
    
    /// 搜索界面数据
    func loadHotWords(finished:(words: [String]) -> ()) {
        SVProgressHUD.showWithStatus("正在加载...")
        let url = BASE_URL + "v1/search/hot_words"
        Alamofire
            .request(.GET, url)
            .responseJSON { (response) in
                guard response.result.isSuccess else {
                    SVProgressHUD.showErrorWithStatus("加载失败...")
                    return
                }
                if let value = response.result.value {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    let message = dict["message"].stringValue
                    guard code == RETURN_OK else {
                        SVProgressHUD.showInfoWithStatus(message)
                        return
                    }
                    SVProgressHUD.dismiss()
                    if let data = dict["data"].dictionary {
                        if let hot_words = data["hot_words"]?.arrayObject {
                            finished(words: hot_words as! [String])
                        }
                    }
                }
        }
    }
    
    /// 根据搜索条件进行搜索
    func loadSearchResult(keyword: String, sort: String, finished:(results: [XZQSearchResult]) -> ()) {
        SVProgressHUD.showWithStatus("正在加载...")
        let url = "http://api.dantangapp.com/v1/search/item"
        
        let params = ["keyword": keyword,
                      "limit": 20,
                      "offset": 0,
                      "sort": sort]
        Alamofire
            .request(.GET, url, parameters: params as? [String : AnyObject])
            .responseJSON { (response) in
                guard response.result.isSuccess else {
                    SVProgressHUD.showErrorWithStatus("加载失败...")
                    return
                }
                if let value = response.result.value {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    let message = dict["message"].stringValue
                    guard code == RETURN_OK else {
                        SVProgressHUD.showInfoWithStatus(message)
                        return
                    }
                    SVProgressHUD.dismiss()
                    let data = dict["data"].dictionary
                    if let items = data!["items"]?.arrayObject {
                        var results = [XZQSearchResult]()
                        for item in items {
                            let result = XZQSearchResult(dict: item as! [String: AnyObject])
                            results.append(result)
                        }
                        finished(results: results)
                    }
                }
        }
    }
    
    /// 获取单品数据
    func loadProductData(finished:(products: [XZQProduct]) -> ()) {
        SVProgressHUD.showWithStatus("正在加载...")
        let url = BASE_URL + "v2/items"
        let params = ["gender": 1,
                      "generation": 1,
                      "limit": 20,
                      "offset": 0]
        Alamofire
            .request(.GET, url, parameters: params)
            .responseJSON { (response) in
                guard response.result.isSuccess else {
                    SVProgressHUD.showErrorWithStatus("加载失败...")
                    return
                }
                if let value = response.result.value {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    let message = dict["message"].stringValue
                    guard code == RETURN_OK else {
                        SVProgressHUD.showInfoWithStatus(message)
                        return
                    }
                    SVProgressHUD.dismiss()
                    if let data = dict["data"].dictionary {
                        if let items = data["items"]?.arrayObject {
                            var products = [XZQProduct]()
                            for item in items {
                                if let itemData = item["data"] {
                                    let product = XZQProduct(dict: itemData as! [String: AnyObject])
                                    products.append(product)
                                }
                            }
                            finished(products: products)
                        }
                    }
                }
        }
    }
    
    /// 获取单品详情数据
    func loadProductDetailData(id: Int, finished:(productDetail: XZQProductDetail) -> ()) {
        SVProgressHUD.showWithStatus("正在加载...")
        let url = BASE_URL + "v2/items/\(id)"
        Alamofire
            .request(.GET, url)
            .responseJSON { (response) in
                guard response.result.isSuccess else {
                    SVProgressHUD.showErrorWithStatus("加载失败...")
                    return
                }
                if let value = response.result.value {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    let message = dict["message"].stringValue
                    guard code == RETURN_OK else {
                        SVProgressHUD.showInfoWithStatus(message)
                        return
                    }
                    SVProgressHUD.dismiss()
                    if let data = dict["data"].dictionaryObject {
                        let productDetail = XZQProductDetail(dict: data)
                        finished(productDetail: productDetail)
                    }
                }
        }
    }
    
    /// 商品详情 评论
    func loadProductDetailComments(id: Int, finished:(comments: [XZQComment]) -> ()) {
        SVProgressHUD.showWithStatus("正在加载...")
        let url = BASE_URL + "v2/items/\(id)/comments"
        let params = ["limit": 20,
                      "offset": 0]
        Alamofire
            .request(.GET, url, parameters: params)
            .responseJSON { (response) in
                guard response.result.isSuccess else {
                    SVProgressHUD.showErrorWithStatus("加载失败...")
                    return
                }
                if let value = response.result.value {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    let message = dict["message"].stringValue
                    guard code == RETURN_OK else {
                        SVProgressHUD.showInfoWithStatus(message)
                        return
                    }
                    SVProgressHUD.dismiss()
                    if let data = dict["data"].dictionary {
                        if let commentsData = data["comments"]?.arrayObject {
                            var comments = [XZQComment]()
                            for item in commentsData {
                                let comment = XZQComment(dict: item as! [String: AnyObject])
                                comments.append(comment)
                            }
                            finished(comments: comments)
                        }
                    }
                }
        }
    }
    
    /// 分类界面 顶部 专题合集
    func loadCategoryCollection(limit: Int, finished:(collections: [XZQCollection]) -> ()) {
        SVProgressHUD.showWithStatus("正在加载...")
        let url = BASE_URL + "v1/collections"
        let params = ["limit": limit,
                      "offset": 0]
        Alamofire
            .request(.GET, url, parameters: params)
            .responseJSON { (response) in
                guard response.result.isSuccess else {
                    SVProgressHUD.showErrorWithStatus("加载失败...")
                    return
                }
                if let value = response.result.value {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    let message = dict["message"].stringValue
                    guard code == RETURN_OK else {
                        SVProgressHUD.showInfoWithStatus(message)
                        return
                    }
                    SVProgressHUD.dismiss()
                    if let data = dict["data"].dictionary {
                        if let collectionsData = data["collections"]?.arrayObject {
                            var collections = [XZQCollection]()
                            for item in collectionsData {
                                let collection = XZQCollection(dict: item as! [String: AnyObject])
                                collections.append(collection)
                            }
                            finished(collections: collections)
                        }
                    }
                }
        }
    }
    
    /// 顶部 专题合集 -> 专题列表
    func loadCollectionPosts(id: Int, finished:(posts: [XZQCollectionPost]) -> ()) {
        SVProgressHUD.showWithStatus("正在加载...")
        let url = BASE_URL + "v1/collections/\(id)/posts"
        let params = ["gender": 1,
                      "generation": 1,
                      "limit": 20,
                      "offset": 0]
        Alamofire
            .request(.GET, url, parameters: params)
            .responseJSON { (response) in
                guard response.result.isSuccess else {
                    SVProgressHUD.showErrorWithStatus("加载失败...")
                    return
                }
                if let value = response.result.value {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    let message = dict["message"].stringValue
                    guard code == RETURN_OK else {
                        SVProgressHUD.showInfoWithStatus(message)
                        return
                    }
                    SVProgressHUD.dismiss()
                    if let data = dict["data"].dictionary {
                        if let postsData = data["posts"]?.arrayObject {
                            var posts = [XZQCollectionPost]()
                            for item in postsData {
                                let post = XZQCollectionPost(dict: item as! [String: AnyObject])
                                posts.append(post)
                            }
                            finished(posts: posts)
                        }
                    }
                }
        }
    }
    
    /// 分类界面 风格,品类
    func loadCategoryGroup(finished:(outGroups: [AnyObject]) -> ()) {
        SVProgressHUD.showWithStatus("正在加载...")
        let url = BASE_URL + "v1/channel_groups/all"
        Alamofire
            .request(.GET, url)
            .responseJSON { (response) in
                guard response.result.isSuccess else {
                    SVProgressHUD.showErrorWithStatus("加载失败...")
                    return
                }
                if let value = response.result.value {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    let message = dict["message"].stringValue
                    guard code == RETURN_OK else {
                        SVProgressHUD.showInfoWithStatus(message)
                        return
                    }
                    SVProgressHUD.dismiss()
                    if let data = dict["data"].dictionary {
                        if let channel_groups = data["channel_groups"]?.arrayObject {
                            // outGroups 存储两个 inGroups 数组，inGroups 存储 XZQGroup 对象
                            // outGroups 是一个二维数组
                            var outGroups = [AnyObject]()
                            for channel_group in channel_groups {
                                var inGroups = [XZQGroup]()
                                let channels = channel_group["channels"] as! [AnyObject]
                                for channel in channels {
                                    let group = XZQGroup(dict: channel as! [String: AnyObject])
                                    inGroups.append(group)
                                }
                                outGroups.append(inGroups)
                            }
                            finished(outGroups: outGroups)
                        }
                    }
                }
        }
    }
    
    /// 底部 风格品类 -> 列表
    func loadStylesOrCategoryInfo(id: Int, finished:(items: [XZQCollectionPost]) -> ()) {
        SVProgressHUD.showWithStatus("正在加载...")
        let url = BASE_URL + "v1/channels/\(id)/items"
        let params = ["limit": 20,
                      "offset": 0]
        Alamofire
            .request(.GET, url, parameters: params)
            .responseJSON { (response) in
                guard response.result.isSuccess else {
                    SVProgressHUD.showErrorWithStatus("加载失败...")
                    return
                }
                if let value = response.result.value {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    let message = dict["message"].stringValue
                    guard code == RETURN_OK else {
                        SVProgressHUD.showInfoWithStatus(message)
                        return
                    }
                    SVProgressHUD.dismiss()
                    if let data = dict["data"].dictionary {
                        if let itemsData = data["items"]?.arrayObject {
                            var items = [XZQCollectionPost]()
                            for item in itemsData {
                                let post = XZQCollectionPost(dict: item as! [String: AnyObject])
                                items.append(post)
                            }
                            finished(items: items)
                        }
                    }
                }
        }
    }
}
