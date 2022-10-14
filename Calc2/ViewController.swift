//
//  ViewController.swift
//  Calc2
//
//  Created by Da Hae Lee on 2022/10/13.
//

import UIKit

class ViewController: UIViewController {

    // IBOutlet variable
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // 연산자 앞의 숫자
    var firstNumberInput: String = ""
    // 연산자 뒤의 숫자
    var secondNumberInput: String = ""
    // 선택된 사칙연산의 심볼을 저장
    var operatorSymbol: String = ""
    // 연산의 결과를 저장
    var result: Int = 0
    // 사용자가 연산버튼을 눌렀는지 여부
    var flag: Bool = false
    
    // 계산기 클래스(CalcInsider)의 인스턴스
    let calcInsider = CalcInsider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    // MARK: - IBAction func
    // 연산 버튼
    // 사칙연산을 해줍니다.
    @IBAction func pressOperatorButton(_ sender: Any) {
        let button = sender as! UIButton
        let operatorButton = button.titleLabel?.text ?? ""
        flag = true
        
        switch operatorButton {
        case "➕":
            operatorSymbol = operatorSymbolEnum.plus.rawValue
            calcInsider.operatorString = "더하기"
        case "➖":
            operatorSymbol = operatorSymbolEnum.minus.rawValue
            calcInsider.operatorString = "빼기"
        case "✖️":
            operatorSymbol = operatorSymbolEnum.multiply.rawValue
            calcInsider.operatorString = "곱하기"
        case "➗":
            operatorSymbol = operatorSymbolEnum.divide.rawValue
            calcInsider.operatorString = "나누기"
        default:
            break
        }
        
        descriptionLabel.text = "현재 선택된 연산은 \(calcInsider.operatorString) 입니다."
    }

    // 연산의 결과를 화면에 보여줍니다!
    @IBAction func pressResultButton(_ sender: Any) {
        let firstNumberInt: Int = Int(firstNumberInput) ?? 0
        let secondNumberInt: Int = Int(secondNumberInput) ?? 0
        
        result = calcInsider.getResult(oper: operatorSymbol, first: firstNumberInt, second: secondNumberInt)
        
        let string: String = "\(firstNumberInt) \(calcInsider.operatorString) \(secondNumberInt)은 \(result)입니다."
        self.resultLabel.text = string
        
        // 첫번째 숫자는 이전의 결과값을 할당하고, 두번째 숫자는 초기화
        firstNumberInput = String(result)
        secondNumberInput = ""
        flag = false
        
        calcInsider.canYouHearMe(string: string)
    }
    
    // Input Number: 숫자를 입력해드립니다.
    @IBAction func pressNumberButton(_ sender: Any) {
        let button: UIButton = sender as! UIButton
        let buttonNumber: String = button.titleLabel?.text ?? ""
        print("\(buttonNumber)")
        
        if flag {
            // 두번째 넘버
            secondNumberInput += buttonNumber
            print("\(secondNumberInput)")
            resultLabel.text = secondNumberInput
        } else {
            // 첫번째 넘버
            firstNumberInput += buttonNumber
            print("\(firstNumberInput)")
            resultLabel.text = firstNumberInput
        }
        
    }
    
    // All Clear: 전부 지워드립니다.
    @IBAction func allClearButton(_ sender: Any) {
        firstNumberInput = ""
        secondNumberInput = ""
        resultLabel.text = ""
        descriptionLabel.text = "현재 선택된 연산이 없습니다."
        flag = false
    }
    
    
}
