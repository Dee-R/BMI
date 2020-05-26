//
//  ViewController.swift
//  bmi-wheel
//
//  Created by Eddy R on 18/05/2020.
//  Copyright © 2020 Eddy R. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  // MARK: - 🉑 Setting
  
  @IBOutlet weak var slider: UISlider!
  
  var imc: Float =  17.5
  var balanceW: BalanceWeight! = nil
  var rectWindow: CGRect {
    return view.bounds
  }
  
  // MARK: - ✅ Cycle Life
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.white
//    view.backgroundColor = UIColor.darkGray
    buildWheelWeight()
  }
  
  override func loadView() {
    super.loadView()
    setsPositionThumbSlider()
  }
 
  // MARK: - 💻 Own F
  func buildWheelWeight(){
    // 📢 : rect for balanceWeight. // ✔︎
    let margin: CGFloat = 0
    let heightRectContainerWheel:CGFloat =  250
    let widthRectContainerWheel: CGFloat = rectWindow.width - margin
    let rectContainerWheel: CGRect = CGRect(x: 0 + margin / 2, y: view.frame.midY, width: widthRectContainerWheel, height: heightRectContainerWheel)
    
    // 📢 : balance itself. // ✔︎
    balanceW =  BalanceWeight(frame: rectContainerWheel)
    self.view.addSubview(balanceW)
    
    slider.setValue(0.5, animated: false)
  }
  fileprivate func setsPositionThumbSlider() {
    slider.setValue(-90, animated: false)
    slider.setNeedsDisplay()
  }
  
  // MARK: - 🖐 Handle U
  @IBAction func sliderChanged(_ sender: UISlider) {
    sender.minimumValue = -90
    sender.maximumValue = 90
    print(sender.value)
    balanceW.animationArrow(with: CGFloat(sender.value))
  }
}





