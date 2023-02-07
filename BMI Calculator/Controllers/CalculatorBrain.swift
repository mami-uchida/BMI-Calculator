//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by 内田麻美 on 2022/11/24.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

struct CalculateBrain {
    var bmi: BMI?
    
    
    //bmiを返すメソッド
    //bmiがnilじゃなかったらcalculateBMIのbmiのvalueを返し、nilならデフォルト0.0を返す
    func getBMIVlaue() -> String {
        let bmiToDecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiToDecimalPlace
    }
    
    
    //adviceを返すメソッド
    //adviceがnilじゃなかったらcalculateBMIのbmiのadviceを返し、nilならデフォルト "No adovece"を返す
    func getAdvice() -> String {
        return bmi?.advice ?? "No adovece"
    }
    
    //colorを返すメソッド
    //colorがnilじゃなかったらcalculateBMIのbmiのcolorを返し、nilならデフォルト blueを返す
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.blue
    }
    
    //bmiの計算をし、値によってadviceとcolorが変わるようにする
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more Pies!", color: UIColor.blue)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: UIColor.green)
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less Pies!", color: UIColor.systemPink)
        }
    }
}
