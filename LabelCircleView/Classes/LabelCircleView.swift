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

    public init(appearance: Appearance = .default, text: String, percent: Double, color: UIColor) {
        self.appearance = appearance
        self.text = text
        self.percent = percent
        self.color = color

        super.init(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        backgroundColor = UIColor.clear
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        drawBackgroundArc(on: context)
        drawValueArc(on: context)
        drawText(on: context)
    }
}

extension LabelCircleView {
    func radians(_ degree: Double) -> Double {
        return degree * Double.pi / 180
    }

    func drawBackgroundArc(on context: CGContext) {
        let size = frame.size

        let startAngle = radians(-90)
        let endAngle = radians(270)

        context.addArc(center: CGPoint(x: size.width / 2, y: size.height / 2),
                       radius: size.width / 2 - appearance.arcLineWidth,
                       startAngle: startAngle, endAngle: endAngle, clockwise: false)
        appearance.backgroundArcColor.setStroke()

        context.setLineWidth(appearance.arcLineWidth)
        context.setLineCap(.butt)

        context.drawPath(using: .stroke)
    }

    func drawValueArc(on context: CGContext) {
        let size = frame.size

        let fixAngle: Double = -90
        let startAngle = radians(270)
        let endAngle = radians(360 * (1 - percent) + fixAngle)

        context.addArc(center: CGPoint(x: size.width / 2, y: size.height / 2),
                       radius: size.width / 2 - appearance.arcLineWidth,
                       startAngle: startAngle, endAngle: endAngle, clockwise: true)
        color.setStroke()

        context.setLineWidth(appearance.arcLineWidth)
        context.setLineCap(.butt)

        context.drawPath(using: .stroke)
    }

    func drawText(on context: CGContext) {
        let font = UIFont.systemFont(ofSize: 15, weight: .medium)

        let style = NSMutableParagraphStyle()
        style.alignment = .center

        let attributes: [NSAttributedString.Key: Any] = [.font: font,
                                                         .foregroundColor: UIColor.black,
                                                         .paragraphStyle: style]

        let rect = CGRect(x: 0, y: bounds.size.height / 2, width: bounds.size.width, height: bounds.size.height)
        text.draw(with: rect, options: [.usesFontLeading], attributes: attributes, context: nil)
    }
}
