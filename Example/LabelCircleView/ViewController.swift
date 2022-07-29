//
//  ViewController.swift
//  LabelCircleView
//
//  Created by Frank on 07/27/2022.
//  Copyright (c) 2022 Frank. All rights reserved.
//

import UIKit
import LabelCircleView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let circleView = LabelCircleView(text: "120", percent: 0.85, color: UIColor(red: 0, green: 196/255, blue: 1, alpha: 1))
        circleView.frame = CGRect(origin: CGPoint(x: 20, y: 40), size: circleView.frame.size)
        view.addSubview(circleView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

