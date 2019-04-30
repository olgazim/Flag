
import UIKit

@IBDesignable
class IsraelFlag: UIView {

    var scale: CGFloat = 1.0
    
    var width: CGFloat {
        
        return min(self.bounds.size.height,
                   self.bounds.size.width)
    }
    
    private var flagTotalHeight: CGFloat {
        
        return 8 * 8 * width / (11 * 10) * scale
    }
    
    private var flafWidth: CGFloat {
        
        return flagTotalHeight * 11 / 8
    }
    
    private var middleWhiteBandHeight: CGFloat {
        
        return 16 * flagTotalHeight / 32
    }
    
    private var circleRadiusForTrinagle: CGFloat {
        
        return (middleWhiteBandHeight * 3 / 5) / 2
    }
    
    // White band coordinates
    private var whiteBandX1Y1: CGPoint {
        
        return CGPoint(x: bounds.maxX / 10,
                       y: bounds.midY - flagTotalHeight / 2)
    }
    
    private var whiteBandX1Y2: CGPoint {
        
        return CGPoint(x: bounds.maxX / 10,
                       y: bounds.midY + flagTotalHeight / 2)
    }
    
    private var whiteBandX2Y1: CGPoint {
        
        return CGPoint(x: bounds.maxX * 9 / 10,
                       y: bounds.midY - flagTotalHeight / 2)
    }
    
    private var whiteBandX2Y2: CGPoint {
        
        return CGPoint(x: bounds.maxX * 9 / 10,
                       y: bounds.midY + flagTotalHeight / 2)
    }
    
    // Blue Bands coordinates
    private var blueBandFirstX1Y1: CGPoint {
        
        return CGPoint(x: bounds.maxX / 10,
                       y: bounds.midY - 13 * flagTotalHeight / 32 )
    }
    
    private var blueBandFirstX1Y2: CGPoint {
        
        return CGPoint(x: bounds.maxX / 10,
                       y: bounds.midY - 8 * flagTotalHeight / 32 )
    }
    
    private var blueBandFirstX2Y1: CGPoint {
        
        return CGPoint(x: bounds.maxX * 9 / 10,
                       y: bounds.midY - 13 * flagTotalHeight / 32 )
    }
    
    private var blueBandFirstX2Y2: CGPoint {
        
        return CGPoint(x: bounds.maxX * 9 / 10,
                       y: bounds.midY - 8 * flagTotalHeight / 32 )
    }
    
    private var blueBandSecondX1Y1: CGPoint {
        
        return CGPoint(x: bounds.maxX / 10,
                       y: bounds.midY + 8 * flagTotalHeight / 32 )
    }
    
    private var blueBandSecondX1Y2: CGPoint {
        
        return CGPoint(x: bounds.maxX / 10,
                       y: bounds.midY + 13 * flagTotalHeight / 32 )
    }
    
    private var blueBandSecondX2Y1: CGPoint {
        
        return CGPoint(x: bounds.maxX * 9 / 10,
                       y: bounds.midY + 8 * flagTotalHeight / 32 )
    }
    
    private var blueBandSecondX2Y2: CGPoint {
        
        return CGPoint(x: bounds.maxX * 9 / 10,
                       y: bounds.midY + 13 * flagTotalHeight / 32 )
    }
    
    
    // Triangle coordinates
    private var firstTriangleNodeX1Y1: CGPoint {
        
        return CGPoint(x: bounds.midX,
                       y: bounds.midY + middleWhiteBandHeight / 2 - middleWhiteBandHeight / 5)
    }
    
    private var firstTriangleNodeX2Y2: CGPoint {
        
        return CGPoint(x: bounds.midX - 3 * circleRadiusForTrinagle /  sqrt(3) / 2,
                       y: bounds.midY + circleRadiusForTrinagle - 3 * circleRadiusForTrinagle / 2)
    }
    
    private var firstTriangleNodeX3Y2: CGPoint {
        
        return CGPoint(x: bounds.midX + 3 * circleRadiusForTrinagle /   sqrt(3) / 2,
                       y: bounds.midY + circleRadiusForTrinagle - 3 * circleRadiusForTrinagle / 2)
    }
    
    private var secondTriangleNodeX1Y1: CGPoint {
        
        return CGPoint(x: bounds.midX,
                       y: bounds.midY - circleRadiusForTrinagle)
    }
    
    private var secondTriangleNodeX2Y2: CGPoint {
        
        return CGPoint(x: bounds.midX - 3 * circleRadiusForTrinagle /  sqrt(3) / 2,
                       y: bounds.midY - circleRadiusForTrinagle + 3 * circleRadiusForTrinagle / 2)
    }
    
    private var secondTriangleNodeX3Y2: CGPoint {
        
        return CGPoint(x: bounds.midX + 3 * circleRadiusForTrinagle / sqrt(3) / 2,
                       y: bounds.midY - circleRadiusForTrinagle + 3 * circleRadiusForTrinagle / 2)
    }
    
    private func pathForWhiteBand() -> UIBezierPath {

        let whiteBandPath = UIBezierPath()
        whiteBandPath.move(to: whiteBandX1Y1)
        whiteBandPath.addLine(to: whiteBandX1Y2)
        whiteBandPath.addLine(to: whiteBandX2Y2)
        whiteBandPath.addLine(to: whiteBandX2Y1)
        whiteBandPath.addLine(to: whiteBandX1Y1)
        UIColor.white.setFill()
        whiteBandPath.fill()
        return whiteBandPath
    }
    
    private func pathForFirstBlueBand() -> UIBezierPath {
        
        let firstBlueBandPath = UIBezierPath()
        firstBlueBandPath.move(to: blueBandFirstX1Y1)
        firstBlueBandPath.addLine(to: blueBandFirstX1Y2)
        firstBlueBandPath.addLine(to: blueBandFirstX2Y2)
        firstBlueBandPath.addLine(to: blueBandFirstX2Y1)
        firstBlueBandPath.addLine(to: blueBandFirstX1Y1)
        UIColor(displayP3Red: 0,
                green: 0.0824,
                blue: 0.7294,
                alpha: 1).setFill()
        firstBlueBandPath.fill()
        return firstBlueBandPath
    }
    
    private func pathForSecondBlueBand() -> UIBezierPath {
        
        let secondBlueBandPath = UIBezierPath()
        secondBlueBandPath.move(to: blueBandSecondX1Y1)
        secondBlueBandPath.addLine(to: blueBandSecondX1Y2)
        secondBlueBandPath.addLine(to: blueBandSecondX2Y2)
        secondBlueBandPath.addLine(to: blueBandSecondX2Y1)
        secondBlueBandPath.addLine(to: blueBandSecondX1Y1)
        UIColor(displayP3Red: 0,
                green: 0.0824,
                blue: 0.7294,
                alpha: 1).setFill()
        secondBlueBandPath.fill()
        return secondBlueBandPath
    }
    
    private func pathforFirstTriangle() -> UIBezierPath {
        
        let firstTrianglePath = UIBezierPath()
        firstTrianglePath.move(to: firstTriangleNodeX1Y1)
        firstTrianglePath.addLine(to: firstTriangleNodeX2Y2)
        firstTrianglePath.addLine(to: firstTriangleNodeX3Y2)
        firstTrianglePath.close()
        firstTrianglePath.lineWidth = 4
        return firstTrianglePath
    }
    
    private func pathforSecondTriangle() -> UIBezierPath {
        
        let secondTrianglePath = UIBezierPath()
        secondTrianglePath.move(to: secondTriangleNodeX1Y1)
        secondTrianglePath.addLine(to: secondTriangleNodeX2Y2)
        secondTrianglePath.addLine(to: secondTriangleNodeX3Y2)
        secondTrianglePath.close()
        
        secondTrianglePath.lineWidth = 4
        return secondTrianglePath
    }
    
    override func draw(_ rect: CGRect) {
        
        UIColor.white.setStroke()
        pathForWhiteBand().stroke()
        UIColor(displayP3Red: 0,
                green: 0.0824,
                blue: 0.7294,
                alpha: 1).setStroke()
        pathForFirstBlueBand().stroke()
        pathForSecondBlueBand().stroke()
        pathforFirstTriangle().stroke()
        pathforSecondTriangle().stroke()
    }
}
