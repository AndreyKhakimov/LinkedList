//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        self.view = view
        
        createBezier(on: view, path: getPath(), strokeColor: .purple, fillColor: .green)
        createBezier(on: view, path: getCurvePath(), strokeColor: .red, fillColor: .gray)
    }
    
    private func createBezier(on view: UIView, path: UIBezierPath, strokeColor: UIColor, fillColor: UIColor) {
        let shapeLayer = CAShapeLayer()
        let strokeColor = strokeColor.cgColor
        let fillColor = fillColor.cgColor
        
        view.layer.addSublayer(shapeLayer)
        shapeLayer.strokeColor = strokeColor
        shapeLayer.lineWidth = 5
        shapeLayer.fillColor = fillColor
        
        shapeLayer.path = path.cgPath
    }
    
    private func getPath() -> UIBezierPath {
        var path = UIBezierPath()
        path.move(to: CGPoint(x: 50, y: 50))
        path.addLine(to: CGPoint(x: 150, y: 50))
        path.addLine(to: CGPoint(x: 150, y: 150))
        path.close()
        
        path.move(to: CGPoint(x: 40, y: 60))
        path.addLine(to: CGPoint(x: 140, y: 160))
        path.addLine(to: CGPoint(x: 40, y: 160))
        
        
        path.close()
        
        
        let centerPoint = CGPoint(x: 95, y: 105)
        path.move(to: CGPoint(x: 180, y: 105))
        
        path.addArc(withCenter: centerPoint, radius: 85, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        
        return path
    }
    
    private func getCurvePath() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 10, y: 10))
        path.addCurve(to: CGPoint(x: 200, y: 200),
                      controlPoint1: CGPoint(x: 200, y: 20),
                      controlPoint2: CGPoint(x: 20, y: 200))
        return path
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
