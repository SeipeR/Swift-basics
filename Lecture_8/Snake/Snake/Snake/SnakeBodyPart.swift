//
//  SnakeBodyPart.swift
//  Snake
//
//  Created by Дамир Доронкин on 19.03.2021.
//

import UIKit
import SpriteKit

class SnakeBodyPart: SKShapeNode {
    let diametr: CGFloat = 10.0
    
    init(atPoint point: CGPoint) {
        super.init()
        
        path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: diametr, height: diametr)).cgPath
        fillColor = .systemGreen
        strokeColor = .systemGreen
        lineWidth = 5
        self.position = point
        
        self.physicsBody = SKPhysicsBody(circleOfRadius: diametr - 4.0, center: CGPoint(x: 5, y: 5))
        self.physicsBody?.categoryBitMask = CollisionCategory.Snake
        self.physicsBody?.contactTestBitMask = CollisionCategory.EdgeBody | CollisionCategory.Apple
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
