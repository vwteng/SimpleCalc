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

let firstNumber = convert(firstArr[0])
let operation = input()

switch operation {
    case "+", "add":
        let secondNumber = convert(input())
        print(firstNumber + secondNumber)
    case "-", "sub":
        let secondNumber = convert(input())
        print(firstNumber - secondNumber)
    case "*", "mul":
        let secondNumber = convert(input())
        print(firstNumber * secondNumber)
    case "/", "div":
        let secondNumber = convert(input())
        print(firstNumber / secondNumber)
    case "%", "mod":
        let secondNumber = convert(input())
        print(firstNumber % secondNumber)
    case "fact":
        if (firstArr.count == 1) {
            var total = 1
            for var i = firstNumber; i > 0; i-- {
                total *= i
            }
            print(total)
        } else {
           print("You can only enter one number to factor.")
        }
    case "count":
        print(firstArr.count)
    case "avg":
        var sum = 0
        for var i = 0; i < firstArr.count; i++ {
            sum += Int(firstArr[i])!
        }
        let avg = Double(sum) / Double(firstArr.count)
        print(avg)
    default:
        print("Invalid input, cannot calculate.")
}
