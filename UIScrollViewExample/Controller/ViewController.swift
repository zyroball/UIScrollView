//
//  ViewController.swift
//  UIScrollViewExample
//
//  Created by yu_ookubo on 2020/08/03.
//  Copyright © 2020 yu_ookubo. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    //MARK: Life Cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        loadImage()
    }

    //MARK: Private
    private func loadImage()
    {
        if let imageDisplayView: ImageDisplayView = Bundle.main.loadNibNamed("ImageDisplayView",
                                                                             owner: self,
                                                                             options: nil)?.first as? ImageDisplayView
        {
            imageDisplayView.updateView()
            imageDisplayView.frame = CGRect(x: 0,
                                            y: 0,
                                            width: UIScreen.main.bounds.size.width,
                                            height: UIScreen.main.bounds.size.height)

            view.addSubview(imageDisplayView)
        }
    }
}

