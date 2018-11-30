//: A UIKit based Playground for presenting user interface
  
import UIKit
class colorTreeView: UIView{
    let  PI = 3.14
    let leftAngle:Double = 20
    let rightAngle:Double = 20
    let treeDepth:CGFloat = 9
    let leafColor:UIColor = UIColor(displayP3Red: 22.0, green: 0.0, blue: 0.5, alpha: 1.0)
    let trunkColor:UIColor = .darkGray
   
    func drawBranch(x1:CGFloat, y1:CGFloat, angle:Double, depth:CGFloat){
        var branchArmLen = depth
        if depth > 0 && depth < 3{
            branchArmLen = depth * 0.8
        } else {
            branchArmLen = depth * 0.5
        }
        if depth != 0 {
             let x2 = x1 + (CGFloat(cos(angle * PI/180)) * depth * branchArmLen)
             let y2 = y1 + (CGFloat(sin(angle * PI/180)) * depth * branchArmLen)
            drawLine(lineWidth: depth, fromPoint: CGPoint(x: x1, y: y1), toPoint: CGPoint(x: x2, y: y2))
            
            drawBranch(x1: x2, y1: y2, angle: angle - self.leftAngle, depth: depth - 1)
            drawBranch(x1: x2, y1: y2, angle: angle + self.rightAngle, depth: depth - 1)
        }
    }
    func drawLine(lineWidth:CGFloat, fromPoint:CGPoint, toPoint:CGPoint){
        let path = UIBezierPath()
        if (lineWidth < 5){
            self.leafColor.set()
            path.lineWidth = 1.0
        }
        else{
            self.trunkColor.set()
            path.lineWidth = 2.0
        }
        path.move(to: fromPoint)
        path.addLine(to: toPoint)
        path.stroke()
    }
    override func draw(_ rect: CGRect) {
       drawBranch(x1: self.frame.width / 2, y1: self.frame.height * 0.7, angle: -90, depth: self.treeDepth)
    }
}
let view = colorTreeView(frame: CGRect (x: 0, y: 0, width: 300, height: 300))
view.backgroundColor = .yellow

