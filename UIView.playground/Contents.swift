//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    override func loadView() {
        setupViews()
    }
    
    private func setupViews() {
        self.view = getRootView()
        let redView = getRedView()
        //        redView.clipsToBounds = true
        let greenView = getGreenView()
        let whiteView = getWhiteView()
        let pinkView = getPinkView()
        set(view: greenView, toCenterOfView: redView)
        
        
        whiteView.center = CGPoint(
            x: greenView.bounds.midX,
            y: greenView.bounds.midY
        )
        //        redView.transform = CGAffineTransform(rotationAngle: .pi / 4)
        self.view.addSubview(redView)
        self.view.addSubview(pinkView)
        redView.addSubview(greenView)
        redView.addSubview(whiteView)
    }
    
    private func getRootView() -> UIView {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }
    
    private func getRedView() -> UIView {
        let viewFrame = CGRect(x: 100,
                               y: 20,
                               width: 100,
                               height: 100
        )
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .red
        return view
    }
    
    private func getGreenView() -> UIView {
        let viewFrame = CGRect(x: 0,
                               y: 0,
                               width: 50,
                               height: 50
        )
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .green
        return view
    }
    
    private func getWhiteView() -> UIView {
        let viewFrame = CGRect(x: 0,
                               y: 0,
                               width: 10,
                               height: 10
        )
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .white
        return view
    }
    
    private func getPinkView() -> UIView {
        let viewFrame = CGRect(x: 50,
                               y: 300,
                               width: 70,
                               height: 70
        )
        view
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .systemPink
        view.layer.borderWidth = 3
        view.layer.borderColor = CGColor(red: 10, green: 170, blue: 200, alpha: 1)
        view.layer.cornerRadius = 5
        view.layer.shadowOpacity = 0.7
        view.layer.shadowRadius = 10
        view.layer.shadowColor = CGColor(red: 0, green: 170, blue: 200, alpha: 1)
        let subLayer = CALayer()
        subLayer.backgroundColor = UIColor.purple.cgColor
        subLayer.frame = CGRect(x: 5,
                                y: 5,
                                width: 15,
                                height: 15
        )
        subLayer.cornerRadius = subLayer.frame.width / 2
        view.layer.addSublayer(subLayer)
        print(view.frame)
        view.layer.anchorPoint = CGPoint(x: 0.5, y: 0.3)
        view.transform = CGAffineTransform(rotationAngle: .pi / 4)
        print(view.frame)
        return view
    }
    
    private func set(view moveView: UIView, toCenterOfView baseView: UIView) {
        let moveViewWidth = moveView.frame.width
        let moveViewHeight = moveView.frame.height
        
        let baseViewWidth = baseView.frame.width
        let baseViewHeight = baseView.frame.height
        
        let newXCoordinate = (baseViewWidth - moveViewWidth) / 2
        let newYCoordinate = (baseViewHeight - moveViewHeight) / 2
        moveView.frame.origin = CGPoint(x: newXCoordinate, y: newYCoordinate)
    }
    
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
