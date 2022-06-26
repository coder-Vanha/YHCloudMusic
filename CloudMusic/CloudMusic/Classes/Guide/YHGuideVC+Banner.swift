//
//  YHGuideVC+Banner.swift
//  CloudMusic
//
//  Created by Vanha on 2020/10/4.
//  Copyright © 2020 wanwan. All rights reserved.
//

import UIKit

extension YHGuideVC {
    func settingBannerView() {
        bannerView?.dataSource = self
        bannerView?.delegate = self
        bannerView?.emptyImage = UIImage(named: IMAGE_PLACE_HOLDER)
        bannerView?.placeholderImage = UIImage(named: IMAGE_PLACE_HOLDER)
        bannerView?.bannerViewSelectorString = "sd_setImageWithURL:placeholderImage:"
        bannerView?.pageControlNormalColor = UIColor(hex: COLOR_LIGHT_GREY)
        bannerView?.pageControlHighlightColor = UIColor(hex: COLOR_PRIMARY)
        //指示器位置
        //        bannerView.pageControlAliment = .right
        
        //禁用自动滚动
        bannerView?.autoScroll=false
        //重新加载数据
        bannerView?.reloadData()
        
    }
    
}

extension YHGuideVC: YJBannerViewDataSource, YJBannerViewDelegate {
    func bannerViewImages(_ bannerView: YJBannerView!) -> [Any]! {
        return ["Guide1","Guide2","Guide3","Guide4","Guide5"]
    }
    
    func bannerView(_ bannerView: YJBannerView!, customCell: UICollectionViewCell!, index: Int) -> UICollectionViewCell! {
        //将Cell转为YJBannerViewCell
        let cell = customCell as! YJBannerViewCell
        cell.showImageViewContentMode = .scaleAspectFill
        
        return cell
        
    }
    
    
    func bannerView(_ bannerView: YJBannerView!, didSelectItemAt index: Int) {
        print("GuideVC on banner view click:\(index)")
    }
    
    
}
