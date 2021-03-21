//
//  Snake.swift
//  Snake
//
//  Created by Дамир Доронкин on 19.03.2021.
//

import UIKit
import SpriteKit

class Snake: SKShapeNode {
    var body = [SnakeBodyPart]()
    let moveSpeed: CGFloat = 100.0
    var angle: CGFloat = 0.0
    
    convenience init(atPoint point: CGPoint) {
        self.init()
        
        let head = SnakeHead(atPoint: point)
        
        body.append(head)
        
        addChild(head)
    }
    
    func addBodyPart() {
        let newBodyPart = SnakeBodyPart(atPoint: CGPoint(x: body[0].position.x, y: body[0].position.y))
        
        body.append(newBodyPart)
        addChild(newBodyPart)
    }
    
    func move() {
        guard !body.isEmpty else {
            return
        }
        
        let head = body[0]
        
        moveHead(head)
        
        for index in (0..<body.count) where index > 0 {
            let pBodyPart = body[index - 1]
            let currentBodyPart = body[index]
            
            moveBodyPart(pBodyPart, currentBodyPart)
        }
    }
    
    func moveHead(_ head: SnakeBodyPart) {
        let dx = moveSpeed * sin(angle)
        let dy = moveSpeed * cos(angle)
        let nextPosition = CGPoint(x: head.position.x + dx, y: head.position.y + dy)
        let moveAction = SKAction.move(to: nextPosition, duration: 0.7)
        
        head.run(moveAction)
    }
    
    func moveBodyPart(_ p: SnakeBodyPart,_ c: SnakeBodyPart) {
        let moveAction = SKAction.move(to: CGPoint(x: p.position.x, y: p.position.y), duration: 0.1)
        
        c.run(moveAction)
    }
    
    func moveClockwise() {
        angle += CGFloat(Double.pi / 2)
    }
    
    func moveCounterClockwise() {
        angle -= CGFloat(Double.pi / 2)
    }
    
    func removeBodyPart() {
        for index in (0..<body.count) {
            body[index].removeFromParent()
        }
    }
}
