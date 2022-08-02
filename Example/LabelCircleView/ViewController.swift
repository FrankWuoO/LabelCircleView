//
//  ViewController.swift
//  LabelCircleView
//
//  Created by Frank on 07/27/2022.
//  Copyright (c) 2022 Frank. All rights reserved.
//

import LabelCircleView
import UIKit

class ViewController: UIViewController {
    @IBOutlet var container: UIStackView!

    lazy var circleView: LabelCircleView = {
        return LabelCircleView(text: "200", percent: 1, color: UIColor(red: 0, green: 196 / 255, blue: 1, alpha: 1))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        container.addArrangedSubview(circleView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func colorForPercentage(_ percentage: Double) -> UIColor {
        if percentage >= 0.5 {
            return UIColor(red: 0, green: 196 / 255, blue: 1, alpha: 1)
        }
        else if percentage >= 0.25 {
            return UIColor(red: 1, green: 192 / 255, blue: 0, alpha: 1)
        }
        else {
            return UIColor(red: 1, green: 25 / 255, blue: 25 / 255, alpha: 1)
        }
    }
    
    @IBAction func updateSlider(_ sender: UISlider) {
        let percent = Double(sender.value / sender.maximumValue)
        let value = Int(sender.value)
        circleView.update(text: "\(value)", percent: percent, color: colorForPercentage(percent))
    }
}
