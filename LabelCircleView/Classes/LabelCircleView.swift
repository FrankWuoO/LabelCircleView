//
//  LabelCircleView.swift
//  LabelCircleView
//
//  Created by cheng-en wu on 2022/7/27.
//

import UIKit

class LabelCircleView: UIControl {
    
    let maximumValue: Double
    let minimumValue: Double
    var currentValue: Double
    
    init(maximumValue: Double, minimum: Double, current: Double) {
        self.maximumValue = maximumValue
        self.minimumValue = minimum
        self.currentValue = current
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.orange
    }
    
}
