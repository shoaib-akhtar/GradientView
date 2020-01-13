//
//  GradientView.swift
//  Shoaib Akhtar
//
//  Created by Shoaib Akhtar on 14/10/2019.
//  Copyright © 202 Shoaib Akhtar. All rights reserved.
//

import UIKit
@IBDesignable
public class GradientView: UIView {

    @IBInspectable public var startColor:   UIColor = .black { didSet { updateColors() }}
    @IBInspectable public var endColor:     UIColor = .white { didSet { updateColors() }}
    @IBInspectable public var startLocation: Double =   0.05 { didSet { updateLocations() }}
    @IBInspectable public var endLocation:   Double =   0.95 { didSet { updateLocations() }}
    @IBInspectable public var horizontalMode:  Bool =  false { didSet { updatePoints() }}
    @IBInspectable public var diagonalMode:    Bool =  false { didSet { updatePoints() }}

    override public class var layerClass: AnyClass { return CAGradientLayer.self }

    private var gradientLayer: CAGradientLayer { return layer as! CAGradientLayer }

    private func updatePoints() {
        if horizontalMode {
            gradientLayer.startPoint = diagonalMode ? CGPoint(x: 1, y: 0) : CGPoint(x: 0, y: 0.5)
            gradientLayer.endPoint   = diagonalMode ? CGPoint(x: 0, y: 1) : CGPoint(x: 1, y: 0.5)
        } else {
            gradientLayer.startPoint = diagonalMode ? CGPoint(x: 0, y: 0) : CGPoint(x: 0.5, y: 0)
            gradientLayer.endPoint   = diagonalMode ? CGPoint(x: 1, y: 1) : CGPoint(x: 0.5, y: 1)
        }
        setNeedsDisplay()
    }
    
    private func updateLocations() {
        gradientLayer.locations = [startLocation as NSNumber, endLocation as NSNumber]
        setNeedsDisplay()
    }
    
    private func updateColors() {
        gradientLayer.colors    = [startColor.cgColor, endColor.cgColor]
        setNeedsDisplay()
    }
    
    private func setup() {
        updatePoints()
        updateLocations()
        updateColors()
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    
    required init?(coder aDecoder:NSCoder) {
        super.init(coder:aDecoder)
        setup()
    }

    private override init(frame:CGRect) {
        super.init(frame:frame)
        setup()
    }
}

