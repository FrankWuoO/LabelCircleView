//
//  LabelCircleView.swift
//  LabelCircleView
//
//  Created by cheng-en wu on 2022/7/27.
//

import UIKit

public class LabelCircleView: UIControl {
    public struct Appearance {
        public static let `default`: Appearance = Appearance(backgroundArcColor: UIColor(red: 247 / 255, green: 247 / 255, blue: 247 / 255, alpha: 1), arcLineWidth: 10)

        let backgroundArcColor: UIColor
        let arcLineWidth: CGFloat
    }

    let appearance: Appearance

    var text: String
    var percent: Double
    var color: UIColor
    
    private var suitableFrame: CGRect {
        var rect = bounds
        let shortLength = min(bounds.size.width, bounds.size.height)
        rect.size = CGSize(width: shortLength, height: shortLength)
        rect.origin = CGPoint(x: (frame.size.width - shortLength) / 2, y: (frame.size.height - shortLength) / 2)
        return rect
    }
    
    public init(appearance: Appearance = .default, text: String, percent: Double, color: UIColor) {
        self.appearance = appearance
        self.text = text
        self.percent = percent
        self.color = color

        super.init(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        backgroundColor = UIColor.clear
    }

    required init?(coder: NSCoder) {
        self.appearance = .default
        self.text = "100"
        self.percent = 1
        self.color = .blue
        super.init(coder: coder)
    }

    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        drawBackgroundArc(on: context)
        drawValueArc(on: context)
        drawText()
    }
    
    public func update(text: String? = nil, percent: Double? = nil, color: UIColor? = nil) {
        self.text = text ?? ""
        
        if let percent = percent {
            self.percent = percent
        }
        
        if let color = color {
            self.color = color
        }
        
        setNeedsDisplay()
    }
}

extension LabelCircleView {
    func radians(_ degree: Double) -> Double {
        return degree * Double.pi / 180
    }

    func drawBackgroundArc(on context: CGContext) {
        let startAngle = radians(-90)
        let endAngle = radians(270)

        context.addArc(center: CGPoint(x: suitableFrame.midX, y: suitableFrame.midY),
                       radius: suitableFrame.size.width / 2 - appearance.arcLineWidth,
                       startAngle: startAngle, endAngle: endAngle, clockwise: false)
        appearance.backgroundArcColor.setStroke()

        context.setLineWidth(appearance.arcLineWidth)
        context.setLineCap(.butt)

        context.drawPath(using: .stroke)
    }

    func drawValueArc(on context: CGContext) {
        let fixAngle: Double = -90
        let startAngle = radians(270)
        let endAngle = radians(360 * (1 - percent) + fixAngle)
        
        context.addArc(center: CGPoint(x: suitableFrame.midX, y: suitableFrame.midY),
                       radius: suitableFrame.size.width / 2 - appearance.arcLineWidth,
                       startAngle: startAngle, endAngle: endAngle, clockwise: true)
        color.setStroke()

        context.setLineWidth(appearance.arcLineWidth)
        context.setLineCap(.butt)

        context.drawPath(using: .stroke)
    }

    func drawText() {
        let font = UIFont.systemFont(ofSize: 15, weight: .medium)

        let style = NSMutableParagraphStyle()
        style.alignment = .center

        let attributes: [NSAttributedString.Key: Any] = [.font: font,
                                                         .foregroundColor: UIColor.black,
                                                         .paragraphStyle: style]

        var rect = suitableFrame
        rect.origin.y = rect.midY - font.lineHeight
        text.draw(with: rect, options: [.usesFontLeading, .usesLineFragmentOrigin], attributes: attributes, context: nil)
    }
}
