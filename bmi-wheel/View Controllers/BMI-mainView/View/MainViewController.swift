//
//  ViewController.swift
//  bmi-wheel
//
//  Created by Eddy R on 18/05/2020.
//  Copyright © 2020 Eddy R. All rights reserved.
import UIKit

class MainViewController: UIViewController {
  
  // MARK: -  🉑
  // Top container // ✔︎
  private var viewModelTopContainer = ViewModelTopContainer()
  @IBOutlet weak var mainTitle: UILabel!
  @IBOutlet weak var age: UITextField!
  @IBOutlet weak var weight: UITextField!
  @IBOutlet weak var height: UITextField!

  
  
  
  // Middle container // ✔︎
  @IBOutlet weak var containerMiddle: UIView! //!\ ◼︎◼︎◼︎ Important ◼︎◼︎◼︎ /!\\
  var balanceWeightView:BalanceWeight = BalanceWeight(frame: CGRect.zero)
  @IBOutlet weak var subViewMiddel01: UIView!
  
  // iVar
  private var showClass: String {
    return String(describing: type(of: self))
  }
  
  // MARK: - ✅ View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    print("\(#line) ▓ ( ˘ ³˘)♥ ▓▓ [ \(showClass) \(#function) ]")
    // Top container
    viewModelTopContainer.viewDidLoad() // ✔︎
    setupUIContainerTop() // ✔︎
    setupUIContainerMiddle() // ✔︎
    setBackgroundColorMainViewController() // ✔︎
    // STOP HERE 🚦🌁🏝☀️🏖🐬🏝🏞🏜🚦
  }
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print("\(#line) ▓ ( ˘ ³˘)♥ ▓▓ [ \(showClass) \(#function) ]")
    buildWheelWheight() // ✔︎
    
  }
  
  // MARK: - 💻 Own F
  // Top Container // ✔︎
  fileprivate func setupUIContainerTop() {
    self.age.text = viewModelTopContainer.myAge == nil ? "" : String(viewModelTopContainer.myAge)
    self.weight.text = viewModelTopContainer.myWeight == nil ? "" : String(viewModelTopContainer.myWeight)
    self.height.text = viewModelTopContainer.myHeight == nil ? "" : String(viewModelTopContainer.myHeight)
  }
  fileprivate func setupUIContainerMiddle() {
    containerMiddle.backgroundColor = .white
  }
  fileprivate func setBackgroundColorMainViewController() {
    // UIView TOP
    //view.backgroundColor = UIColor(red: 0/255, green: 228/255, blue: 249/255, alpha: 1)
  }
  fileprivate func buildWheelWheight() {
    //!\ ◼︎◼︎◼︎ Important ◼︎◼︎◼︎ /!\\
    let m :CGFloat = containerMiddle.frame.width * 0.02 // margin default 0.08 // optimal 0.02
    let y :CGFloat = 0 // y
    let w = containerMiddle.frame.width //width
    let h = containerMiddle.frame.height //height
    balanceWeightView =  BalanceWeight(frame: CGRect(x: 0 + m, y: y, width: w - (m * 2) , height: h))

    self.subViewMiddel01.addSubview(balanceWeightView)
  }
  
  // MARK: - 🖐 Handle U
}

extension MainViewController: UITextFieldDelegate {
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true)
    // est pas vide alors
    if (!(weight.text! == "") && !(height.text! == "")) {
      print("1")
      let imc = Cal.bmi(tall: Int(height.text!)!, weight: Float(weight.text!)!)
      balanceWeightView.animationArrowWith(bmiValue: CGFloat(imc))
      
      print(imc)
    } else {
      print("2")
    }
    
  
    
  }
}









