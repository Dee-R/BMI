//
//  BalanceWeight.swift
//  bmi-wheel
//
//  Created by Eddy R on 22/05/2020.
//  Copyright © 2020 Eddy R. All rights reserved.
//

import UIKit

class BalanceWeight: UIView {
  // MARK: - 🉑 Setting
  var arrow: CAShapeLayer! = nil
  var centerPoint: CGPoint {
    let x = self.bounds.size.width / 2
    let y = self.bounds.size.height
    return CGPoint(x: x, y: y)
  }
  
  
  
  // MARK: - ⚙️ Init // ✔︎
  override func draw(_ rect: CGRect) {
    super.draw(rect)
//    makeTextOnRadian()
  }
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.layer.masksToBounds = true
    initBalanceWeight()
    // set initial position
    self.arrow.setAnchorPoint(CGPoint(x: 0.5, y: 1))
    
    // set de position by default
    let rotationPosition: CGFloat = CGFloat(CalculNeedle.calculAndScale(imc: 18.5))
    self.arrow.transform = CATransform3DMakeRotation( .pi * ( rotationPosition - (90)) / 180  , 0, 0, 1)
  }
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    initBalanceWeight()
  }
  private func initBalanceWeight() {
    //    print("  💟 setUpBalanceWeight 💟")
    //    layer.backgroundColor = UIColor.gray.cgColor
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
    makeTextOnRadians()
    
  
    makeArrow()
    maskRadians()
    makeNumbertOnRadians()
    
  }
  
  
  // MARK: - Lego
  
  private func makeRadianCircle(angleStart: CGFloat, angleEnd: CGFloat, color:CGColor = UIColor.orange.cgColor) {
    //    print("\(#line) ▓▓▓▓▓▓▓▓ ( ˘ ³˘)♥ ▓▓▓▓▓▓▓▓  func \(#function)")
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
    //    print("\(#line) ▓▓▓▓▓▓▓▓ ( ˘ ³˘)♥ ▓▓▓▓▓▓▓▓  func \(#function)")
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
  private func makeTextOnRadians(){
    let radians: CGFloat = bounds.height >= bounds.width / 2 ? bounds.width / 2 : bounds.height
    let _: CGFloat = radians - (radians * 1/6)
    
    let configTextArc: [[String : Any]] = [
      ["text" : "En Sous-Poids",
       "radius": radians - (radians * 1/6) ,
       "angle" : 210,
       "centered" : true,
       "txtColor" : UIColor.white,
       "txtSize": 19.0
      ],
      ["text" : "Normal",
       "radius": radians - (radians * 1/6),
       "angle" : 270,
       "centered" : true,
       "txtColor" : UIColor.white,
       "txtSize": 19.0
      ],
      ["text" : "En Surpoids",
       "radius": radians - (radians * 1/6),
       "angle" : 330,
       "centered" : true,
       "txtColor" : UIColor.white,
       "txtSize": 19.0
      ],
    ]
    
    for i in 0..<configTextArc.count {
      let text: NSAttributedString = NSAttributedString(string: configTextArc[i]["text"] as! String,
          attributes: [NSAttributedString.Key.foregroundColor: configTextArc[i]["txtColor"] as! UIColor,
                       NSAttributedString.Key.font: UIFont.systemFont(ofSize: CGFloat(configTextArc[i]["txtSize"] as! Double) )])
          
      let _ = DrawTextOnArc(on: self.layer,
                        text: text,
                        angle: CGFloat(configTextArc[i]["angle"] as! Int),
                        radius: configTextArc[i]["radius"] as! CGFloat,
                        textCenter: configTextArc[i]["centered"] as! Bool )
    }
    
    
//    let text: NSAttributedString = NSAttributedString(string: "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45",
//    attributes: [NSAttributedString.Key.foregroundColor: UIColor.black,
//                  NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)])
//    let _ = DrawTextOnArc(on: self.layer,
//                  text: text,
//                  angle: 180,
//                  radius: radiusRadiansColored )
  }
    private func makeNumbertOnRadians(){
      var radius:CGFloat = 0
      if bounds.height >= bounds.width / 2 {
        //      print("  💟 A height est superieur ou egal a :  width / 2 💟")
        //      print("  💟🐝\(#line)💟▓▒░ height - width ░▒▓💟",bounds.height, bounds.width / 2,"💟")
        //      print("  💟🐝\(#line)💟▓▒░ radius vaut  ░▒▓💟",bounds.width / 2,"💟")
        radius = (bounds.width / 2) * 0.66
      } else {
        //      print("  💟 B height est inferieur a :  width / 2 💟")
        //      print("  💟🐝\(#line)💟▓▒░ height - width ░▒▓💟",bounds.height, bounds.width / 2,"💟")
        //      print("  💟🐝\(#line)💟▓▒░ radius vaut  ░▒▓💟",bounds.height,"💟")
        radius = (bounds.height) * 0.66
      }
      
//        let _: CGFloat = radians - (radians * 1/6)
        
        let configTextArc: [[String : Any]] = [
          ["text" : "16.0",
          "radius": radius - (radius * 1/12) ,
          "angle" : 181,
          "centered" : false,
          "txtColor" : UIColor.black,
          "txtSize": 15.0
          ],
          ["text" : "18.5",
          "radius": radius - (radius * 1/12) ,
          "angle" : 240,
          "centered" : true,
          "txtColor" : UIColor.black,
          "txtSize": 15.0
          ],
          ["text" : "25.0",
          "radius": radius - (radius * 1/12) ,
          "angle" : 300,
          "centered" : true,
          "txtColor" : UIColor.black,
          "txtSize": 15.0
          ],
          ["text" : "40.0",
          "radius": radius - (radius * 1/12) ,
          "angle" : 343,
          "centered" : false,
          "txtColor" : UIColor.black,
          "txtSize": 15.0
          ],
        ]
        
        for i in 0..<configTextArc.count {
          let text: NSAttributedString = NSAttributedString(string: configTextArc[i]["text"] as! String,
              attributes: [NSAttributedString.Key.foregroundColor: configTextArc[i]["txtColor"] as! UIColor,
                          NSAttributedString.Key.font: UIFont.systemFont(ofSize: CGFloat(configTextArc[i]["txtSize"] as! Double) )])
              
          let _ = DrawTextOnArc(on: self.layer,
                            text: text,
                            angle: CGFloat(configTextArc[i]["angle"] as! Int),
                            radius: configTextArc[i]["radius"] as! CGFloat,
                            textCenter: configTextArc[i]["centered"] as! Bool )
        }
        
        
    //    let text: NSAttributedString = NSAttributedString(string: "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45",
    //    attributes: [NSAttributedString.Key.foregroundColor: UIColor.black,
    //                  NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)])
    //    let _ = DrawTextOnArc(on: self.layer,
    //                  text: text,
    //                  angle: 180,
    //                  radius: radiusRadiansColored )
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
      //      print("  💟 A height est superieur ou egal a :  width / 2 💟")
      //      print("  💟🐝\(#line)💟▓▒░ height - width ░▒▓💟",bounds.height, bounds.width / 2,"💟")
      //      print("  💟🐝\(#line)💟▓▒░ radius vaut  ░▒▓💟",bounds.width / 2,"💟")
      radius = (bounds.width / 2) * 0.66
    } else {
      //      print("  💟 B height est inferieur a :  width / 2 💟")
      //      print("  💟🐝\(#line)💟▓▒░ height - width ░▒▓💟",bounds.height, bounds.width / 2,"💟")
      //      print("  💟🐝\(#line)💟▓▒░ radius vaut  ░▒▓💟",bounds.height,"💟")
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
    let rangeValueRadiusScale: CGFloat = 0.80 // top of triangle 1.0 = 100% | 0.75 = 75% default
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
    arrow.fillColor = UIColor.white.cgColor
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
  func animationArrow(with rotation: CGFloat = .pi) {
    // ⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬⌬ animation
    self.arrow.setAnchorPoint(CGPoint(x: 0.5, y: 1))
    self.arrow.transform = CATransform3DMakeRotation(.pi * rotation / 180 , 0, 0, 1)
    //    UIView.animate(withDuration: 3) {
    //
    //    }
  }
  
  func scaleNeedle(imc : Float) -> Float{
    let a: [Float] = [16.0, 18.5]
    let b: [Float] = [18.5, 25]
    let c: [Float] = [25, 40]
    
    if imc < 16 {
      return 0
    }
    if imc <= a[1] {
      let old = (imc - a[0]) / (a[1] - a[0])
      let new = ((60 - 0) * old) + 0
      return new
    }
    if (imc <= b[1]) {
      let old = (imc - b[0]) / (b[1] - b[0])
      let new = ((120 - 60) * old) + 60
      return new
      
    }
    if (imc <= c[1]) {
      let old = (imc - c[0]) / (c[1] - c[0])
      let new = ((180 - 120) * old) + 120
      return new
    }
    if imc > 40 {
      return 180
    }
    return 0
    
    //    if imc > 40 {
    //      return 180
    //    } else if (imc <= 40.0) {
    //      let old = (imc - c[0]) / (c[1] - c[0])
    //      let new = ((180 - 0) * old) + 0
    //      return new
    //    } else if (imc <= 25.0) {
    //      let old = (imc - b[0]) / (b[1] - b[0])
    //      let new = ((120 - 0) * old) + 0
    //      return new
    //    } else if (imc <= 18.5) {
    //
    //    } else {
    //      return 0
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


// -----------

