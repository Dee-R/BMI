//
//  ViewController.swift
//  bmi-wheel
//
//  Created by Eddy R on 18/05/2020.
//  Copyright © 2020 Eddy R. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
 
  //  var containerWheel: UIView! = nil
  var balanceW: BalanceWeight! = nil
  var rectWindow: CGRect {
    return view.bounds
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.darkGray
    // 📢 : rect for balanceWeight. // ✔︎
    let margin: CGFloat = 0
    let heightRectContainerWheel:CGFloat =  250
    let widthRectContainerWheel: CGFloat = rectWindow.width - margin
    let rectContainerWheel: CGRect = CGRect(x: 0 + margin / 2, y: view.frame.midY, width: widthRectContainerWheel, height: heightRectContainerWheel)
    
    // 📢 : balance itself. // ✔︎
    balanceW =  BalanceWeight(frame: rectContainerWheel)
    self.view.addSubview(balanceW)
  }
  @IBAction func sliderChanged(_ sender: UISlider) {
    sender.minimumValue = 0
    sender.maximumValue = 180
    print(sender.value)
    balanceW.animationArrow(with: CGFloat(sender.value))
  }
}


class BalanceWeight: UIView {
  // MARK: - 🉑 Setting
  var arrow: CAShapeLayer! = nil
  var centerPoint: CGPoint {
    let x = self.bounds.size.width / 2
    let y = self.bounds.size.height
    return CGPoint(x: x, y: y)
  }
  // MARK: - ⚙️ Init
  // ✔︎
  override init(frame: CGRect) {
    super.init(frame: frame)
    initBalanceWeight()
  }
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    initBalanceWeight()
  }
  private func initBalanceWeight() {
    print("  💟 setUpBalanceWeight 💟")
    layer.backgroundColor = UIColor.gray.cgColor
    
    buildRadianCircle()
    showMiddlePoint()
  }
  // ✘
  private func buildRadianCircle() {
    // ✔︎
    makeRadianCircle(angleStart: .pi, angleEnd: 4 * .pi / 3, color: UIColor.circleBlue.cgColor)
    makeEdgeBetweenCircle(edge: 4 * .pi / 3)
    makeRadianCircle(angleStart: 4 * .pi / 3, angleEnd: 5 * .pi / 3,color: UIColor.circleGreen.cgColor)
    makeEdgeBetweenCircle(edge: 5 * .pi / 3)
    makeRadianCircle(angleStart: 5 * .pi / 3, angleEnd: 0,color: UIColor.circleRed.cgColor)
    maskRadians()
    makeArrow()
  }
  private func makeRadianCircle(angleStart: CGFloat, angleEnd: CGFloat, color:CGColor = UIColor.orange.cgColor) {
    print("\(#line) ▓▓▓▓▓▓▓▓ ( ˘ ³˘)♥ ▓▓▓▓▓▓▓▓  func \(#function)")
    // ✔︎
    // creation - position - addition - configuration
    let balance = CAShapeLayer()
    balance.frame = self.bounds
    balance.backgroundColor = UIColor.clear.cgColor
    balance.fillColor = color
    
    self.layer.addSublayer(balance)

    // MARK: - 🉑 Setting
    let radius = bounds.height >= bounds.width / 2 ? bounds.width / 2 : bounds.height
    
    let path = UIBezierPath()
    path.move(to: centerPoint)
    path.addArc(withCenter: centerPoint, radius: radius, startAngle: angleStart , endAngle: angleEnd, clockwise: true)
    path.addLine(to: centerPoint)
    balance.path = path.cgPath
  }
  private func makeEdgeBetweenCircle(edge e: CGFloat, color:CGColor = UIColor.white.cgColor) {
    // ✔︎
    print("\(#line) ▓▓▓▓▓▓▓▓ ( ˘ ³˘)♥ ▓▓▓▓▓▓▓▓  func \(#function)")
    let edge = CAShapeLayer()
    edge.frame = self.bounds
    edge.backgroundColor = UIColor.clear.cgColor
    edge.strokeColor = color
    edge.lineWidth = 2
    self.layer.addSublayer(edge)
    
    // MARK: - 🉑 Setting
    let radius = bounds.height >= bounds.width / 2 ? bounds.width / 2 : bounds.height
    
    let path = UIBezierPath()
    path.move(to: centerPoint)
    path.addArc(withCenter: centerPoint, radius: radius, startAngle: e, endAngle: e, clockwise: true)
    path.addLine(to: centerPoint)
    edge.path = path.cgPath
    
    
  }
  private func maskRadians() {
    // ✔︎
    let mask = CAShapeLayer()
    mask.frame = self.bounds
    mask.fillColor = UIColor.white.cgColor
    self.layer.addSublayer(mask)
    
    // MARK: - 🉑 Setting
    var radius:CGFloat = 0
    if bounds.height >= bounds.width / 2 {
      print("  💟 A height est superieur ou egal a :  width / 2 💟")
      print("  💟🐝\(#line)💟▓▒░ height - width ░▒▓💟",bounds.height, bounds.width / 2,"💟")
      print("  💟🐝\(#line)💟▓▒░ radius vaut  ░▒▓💟",bounds.width / 2,"💟")
      radius = (bounds.width / 2) * 0.66
    } else {
      print("  💟 B height est inferieur a :  width / 2 💟")
      print("  💟🐝\(#line)💟▓▒░ height - width ░▒▓💟",bounds.height, bounds.width / 2,"💟")
      print("  💟🐝\(#line)💟▓▒░ radius vaut  ░▒▓💟",bounds.height,"💟")
      radius = (bounds.height) * 0.66
    }
    
    let path = UIBezierPath()
    path.move(to: centerPoint)
    path.addArc(withCenter: centerPoint, radius: radius, startAngle: .pi, endAngle: 0, clockwise: true)
    
    mask.path = path.cgPath
  }
  private func makeArrow() {
    // ✔︎
    // creation
    arrow = CAShapeLayer()
    // position
    arrow.frame = bounds
    // addition
    self.layer.addSublayer(arrow)
    
    // configuration
    // MARK: - 🉑 Setting
    var radius:CGFloat = 0
    var baseTriangleForArrow: CGFloat = 0
    
    // you can custom them
    let rangeValueRadiusScale: CGFloat = 0.75 // top of triangle 1.0 = 100% | 0.75 = 75%
    let rangeValueBaseTriangleScale: CGFloat = 1 / 2 // base of triangle ( left and right )
    
    // ✔︎
    if bounds.height >= bounds.width / 2 {
      radius = (bounds.width / 2) * rangeValueRadiusScale
      baseTriangleForArrow = (bounds.width / 2) * rangeValueBaseTriangleScale
    } else {
      radius = (bounds.height) * rangeValueRadiusScale
      baseTriangleForArrow = (bounds.height) * rangeValueBaseTriangleScale
    }
    
    let path = UIBezierPath()
    //    arrow.backgroundColor = UIColor.blue.cgColor
    arrow.fillColor = UIColor.blue.cgColor
    path.move(to: CGPoint(x: centerPoint.x - baseTriangleForArrow, y: bounds.height)) // ✘
    path.addArc(withCenter: centerPoint, radius: radius, startAngle: 3 * .pi / 2 , endAngle: 3 * .pi / 2, clockwise: true)
    path.addLine(to: CGPoint(x: centerPoint.x + baseTriangleForArrow, y: bounds.height)) // ✘
    arrow.path = path.cgPath
  }
  private func showMiddlePoint() {
    let middleView = UIView(frame: CGRect(origin: centerPoint, size: CGSize(width: 5, height: 5)))
    middleView.backgroundColor = UIColor.white
    addSubview(middleView)
  }
  // source  https://gist.github.com/cemolcay/9525d28a203da83d333545fc6e0d4371
  
  //action
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("began")
    animationArrow()
  }
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    
  }
  /// animation for arrow
  fileprivate func animationArrow(with rotation: CGFloat = .pi) {
    // ⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬ animation
    self.arrow.setAnchorPoint(CGPoint(x: 0.5, y: 1))
    self.arrow.transform = CATransform3DMakeRotation(.pi * rotation / 180 , 0, 0, 1)
//    UIView.animate(withDuration: 3) {
//
//    }
  }
}

extension UIColor {
  static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
    return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
  }

  static let circleRed = UIColor.rgb(red: 188, green: 46, blue: 54)
  static let circleGreen = UIColor.rgb(red: 0, green: 188, blue: 77)
  static let circleBlue = UIColor.rgb(red: 0, green: 204, blue: 229)
}

extension UIView {
    func setAnchorPoint(_ newAnchorPoint: CGPoint) {
        var newPoint = CGPoint(x: bounds.size.width * newAnchorPoint.x, y: bounds.size.height * newAnchorPoint.y)
        var oldPoint = CGPoint(x: bounds.size.width * layer.anchorPoint.x, y: bounds.size.height * layer.anchorPoint.y);

        newPoint = newPoint.applying(transform)
        oldPoint = oldPoint.applying(transform)

        var position = layer.position

        position.x -= oldPoint.x
        position.x += newPoint.x

        position.y -= oldPoint.y
        position.y += newPoint.y

        layer.position = position
        layer.anchorPoint = newAnchorPoint
    }
}

extension CALayer {
  func setAnchorPoint(_ newAnchorPoint: CGPoint) {
    var newPoint = CGPoint(x: self.bounds.size.width * newAnchorPoint.x,
                           y: self.bounds.size.height * newAnchorPoint.y)
    var oldPoint = CGPoint(x: self.bounds.size.width * self.anchorPoint.x ,
                           y: self.bounds.size.height * self.anchorPoint.y)
    newPoint = __CGPointApplyAffineTransform(newPoint, self.affineTransform())
    oldPoint = __CGPointApplyAffineTransform(oldPoint, self.affineTransform())
    
    var position = self.position
    position.x -= oldPoint.x
    position.x += newPoint.x
    position.y -= oldPoint.y
    position.y += newPoint.y
    
    self.position = position
    self.anchorPoint = newAnchorPoint
  }
}



