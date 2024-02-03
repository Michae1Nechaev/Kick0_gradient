//
//  SquareView.swift
//  NMAKickTask0
//
//  Created by Нечаев Михаил on 01.02.2024.
//

import UIKit

final class SquareView: UIView {
    
    private enum Constants {
        static let cornerRadius: CGFloat = 6
    }
    
    private let gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor(red: 219 / 255, green: 71 / 255, blue: 71 / 255, alpha: 1),
            UIColor(red: 33 / 255, green: 91 / 255, blue: 163 / 255, alpha: 1)
        ].compactMap { $0.cgColor }
        gradient.startPoint = CGPoint(x: 0, y: 0.2)
        gradient.endPoint = CGPoint(x: 0.7, y: 0.7)
        gradient.cornerRadius = Constants.cornerRadius
        gradient.contentsGravity = .center
        return gradient
    }()
    
    private lazy var shadowLayer: CAShapeLayer = {
        let shadowLayer = CAShapeLayer()
       
        shadowLayer.path = UIBezierPath(
            roundedRect: bounds,
            cornerRadius: Constants.cornerRadius
        ).cgPath
        shadowLayer.backgroundColor = UIColor.black.cgColor
        shadowLayer.fillColor = UIColor.black.cgColor
        shadowLayer.shadowOffset = CGSize(width: 1, height: 12)
        shadowLayer.shadowRadius = Constants.cornerRadius
        shadowLayer.shadowOpacity = 0.5
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.contentsGravity = .center
                
        return shadowLayer
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = Constants.cornerRadius
        gradient.removeFromSuperlayer()
        gradient.frame = bounds
        layer.addSublayer(gradient)
        
        shadowLayer.removeFromSuperlayer()
        layer.insertSublayer(shadowLayer, at: 0)
    }
    
}
