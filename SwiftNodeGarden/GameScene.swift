//
//  GameScene.swift
//  SwiftNodeGarden
//
//  Created by Thomas on 11/30/15.
//  Copyright (c) 2015 Tommy Flanagan. All rights reserved.
//
import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    override func didMove(to view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode()
        myLabel.text = "Node Garden"
        myLabel.color = UIColor.gray
        myLabel.fontSize = 25;
        myLabel.position = CGPoint(x:self.frame.midX, y:self.frame.midY);
        self.addChild(myLabel)
        
        scene?.backgroundColor = SKColor.black
        self.physicsWorld.gravity = CGVector(dx: 0,dy: 0)
        
        for _ in 0..<10 {
            let field = SKFieldNode.radialGravityField()
            field.strength = 0.01
            field.region = SKRegion(radius: 200)
            field.physicsBody = SKPhysicsBody(circleOfRadius: 1)
            field.physicsBody!.affectedByGravity = true
            field.physicsBody!.isDynamic = true
            field.physicsBody?.mass = 0.01
            field.falloff = 0
            field.position = CGPoint(x: CGFloat(Int(arc4random()) % Int(self.frame.maxX)), y: CGFloat(Int(arc4random()) % Int(self.frame.maxY)))
            
            let node = SKShapeNode(circleOfRadius: 3)
            node.fillColor = SKColor.white
            
            field.addChild(node)
            self.addChild(field)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.location(in: self)
            
            let field = SKFieldNode.radialGravityField()
            field.strength = 0.01
            field.region = SKRegion(radius: 200)
            field.physicsBody = SKPhysicsBody(circleOfRadius: 1)
            field.physicsBody!.affectedByGravity = true
            field.physicsBody!.isDynamic = true
            field.physicsBody?.mass = 0.01
            field.falloff = 0
            field.position = location
            
            let node = SKShapeNode(circleOfRadius: 3)
            node.fillColor = SKColor.white
            
            field.addChild(node)
            self.addChild(field)
        }
    }
   
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        /* contact occured between two nodes */
        
        
    }
}
