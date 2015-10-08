//
//  main.swift
//  SimpleCalc
//
//  Created by Vivian on 10/7/15.
//  Copyright © 2015 Vivian. All rights reserved.
//

import Foundation

print("Enter an expression separated by returns:")

func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData,encoding:NSUTF8StringEncoding) as! String
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

func convert(incoming:String) -> Int {
    return NSNumberFormatter().numberFromString(incoming)!.integerValue
}

let first = input()
let firstArr = first.characters.split{$0 == " "}.map(String.init)

if firstArr.count == 1 {
    let firstNumber = convert(firstArr[0])
    let operation = input()
    
    if (operation == "fact") {
        var total = 1
        for var i = firstNumber; i > 0; i-- {
            total *= i
        }
        print(total)
    } else {
        let secondNumber = convert(input())
        
        switch operation {
            case "+", "add":
                print(firstNumber + secondNumber)
            case "-", "sub":
                print(firstNumber - secondNumber)
            case "*", "mul":
                print(firstNumber * secondNumber)
            case "/", "div":
                print(firstNumber / secondNumber)
            case "%", "mod":
                print(firstNumber % secondNumber)
            default:
                print("You will need to enter a number followed by +, -, *, /, %, or fact.")
        }
    }
} else {
    let extOperation = input()
    
    switch extOperation {
        case "count":
            print(firstArr.count)
        case "avg":
            var sum = 0
            for var i = 0; i < firstArr.count; i++ {
                sum += Int(firstArr[i])!
            }
            let avg = Float(sum) / Float(firstArr.count)
            print(avg)
        default:
            print("You will need to enter numbers followed by count or avg.")
    }
}

