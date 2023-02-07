//
//  CalculateViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculateBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //heightSliderを動かした際のアクション
    //小数点以下2桁まで表示し％をつける
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height)m"
    }
    
    //weightSliderを動かした際のアクション
    //整数で表示しKgをつける
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weight)Kg"
    }
    
    
    //calculateボタンを押したら各スライダーの値をheightとweihgtにセットし、calculatorBrainのcalculateBMIメソッドで計算。
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weihgt = weightSlider.value
        calculatorBrain.calculateBMI(height: height, weight: weihgt)
        
        //"goToResult"セグエを使用しResultViewContorllerへ
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    
    //セグエのidentifierが"goToResult"なら、セグエを通しbmi・advice・colorをResultViewContorllerの各オブジェクトにセット
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "goToResult", let destinationVC = segue.destination as? ResultsViewController else { return }
    
        destinationVC.bmiValue = calculatorBrain.getBMIVlaue()
        destinationVC.advice = calculatorBrain.getAdvice()
        destinationVC.color = calculatorBrain.getColor()
    }
}


