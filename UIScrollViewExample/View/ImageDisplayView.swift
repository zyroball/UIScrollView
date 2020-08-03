//
//  ImageDisplayView.swift
//  UIScrollViewExample
//
//  Created by yu_ookubo on 2020/08/03.
//  Copyright © 2020 yu_ookubo. All rights reserved.
//

import UIKit

class ImageDisplayView:
    UIView,
    UIScrollViewDelegate
{
    @IBOutlet var mainScrollView: UIScrollView!
    @IBOutlet var mainContentView: UIView!
    @IBOutlet var contentSizeWidth: NSLayoutConstraint!
    
    public func updateView()
    {
        mainScrollView.delegate     = self
        mainScrollView.contentSize  = CGSize(width: UIScreen.main.bounds.size.width*10,
                                             height: UIScreen.main.bounds.size.height)
        contentSizeWidth.constant   = mainScrollView.contentSize.width //スクロールサイズを指定
        
        var count = 0 //カウントする
        //10枚を表示させる
        //ロールケーキ10個分
        while count < 10
        {
            if let zoomView: ZoomingView = Bundle.main.loadNibNamed("ImageDisplayView",
                                                                    owner: self,
                                                                    options: nil)?[1] as? ZoomingView
            {//例外処理を考慮したいのでif let形式で取得
             //これだと記述ミスがあってもクラッシュしない。
                zoomView.imageView.image = UIImage(named: "image")
                zoomView.frame = CGRect(x: (CGFloat)(count)*UIScreen.main.bounds.size.width,
                                        y: 0,
                                        width: UIScreen.main.bounds.size.width,
                                        height: UIScreen.main.bounds.size.height)
                mainContentView.addSubview(zoomView) //描画
            }
            count += 1
        }
    }
}

class ZoomingView: UIView
{
    @IBOutlet var imageView: UIImageView!
}
