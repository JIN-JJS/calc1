//
//  CalcInsider.swift
//  Calc2
//
//  Created by Da Hae Lee on 2022/10/14.
//

import Foundation
import AVFoundation

// 말하는 계산기
class CalcInsider {
    // 연산의 결과를 저장
    private var result: Int = 0
    // 한글 연산자를 저장
    var operatorString: String = ""
    
    // TTS 기능의 인스턴스
    let synthesizer: AVSpeechSynthesizer = AVSpeechSynthesizer()
    
    // 두 수를 이용해서 결과 값 반환하는 메서드
    func getResult(oper: String, first: Int, second: Int) -> Int {
        switch oper {
        case operatorSymbolEnum.plus.rawValue:
            result = first + second
        case operatorSymbolEnum.minus.rawValue:
            result = first - second
        case operatorSymbolEnum.multiply.rawValue:
            result = first * second
        case operatorSymbolEnum.divide.rawValue:
            result = first / second
        default:
            break
        }
        return result
    }
    
    // TTS로 연산 결과를 들려줍니다.
    // 유남생왓암생
    func canYouHearMe(string: String) {
        let utterane = AVSpeechUtterance(string: string)
        synthesizer.speak(utterane)
    }
}
