//
//  main.swift
//  Calculator
//
//  Created by Xiangyu Ju on 15/10/7.
//  Copyright © 2015年 Xiangyu Ju. All rights reserved.
//

import Foundation

print("Calculator:")

//Input
func input() -> String {
    
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    
    let inputData = keyboard.availableData
    
    let result = NSString(data: inputData, encoding: NSUTF8StringEncoding) as! String
    
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
}

//convert String to Int or Double
func convertInt(incoming:String) -> Int {
    
    return NSNumberFormatter().numberFromString(incoming)!.integerValue
    
}

func convertDouble(incoming:String) -> Double {
    
    return NSNumberFormatter().numberFromString(incoming)!.doubleValue
    
}

var inputStr = input()

//basic opearation: +, -, *, /, %
if inputStr.rangeOfString(" ") == nil {
    
    var number1 = convertDouble(inputStr)
    
    var operation = input()
    
    var number2 = convertDouble(input())
    
    var result = 0.0
    
    switch operation {
        
    case "add":
        
        result = number1 + number2
        
    case "sub":
        
        result = number1 - number2
        
    case "mul":
        
        result = number1 * number2
        
    case "div":
        
        result = number1 / number2
        
    case "mod":
        
        result = number1 % number2
        
    default:
        
        print("Input Error")
    }

    print("Result: " + String(stringInterpolationSegment: result))
    
} else {
    
    //new (multi-operand) operations
    var StringArr = inputStr.componentsSeparatedByString(" ")
    
    var operation = StringArr[StringArr.count - 1]
    
    switch operation {
        
    case "count":
        
        var result = 0
        
        result = StringArr.count - 1
        
        print("Result:" + String(result))
        
    case "avg":
        
        var result = 0.0
        
        for index in 0...StringArr.count - 2 {
        
            result = result + convertDouble(StringArr[index])
            
        }
        
        result = result / Double(StringArr.count - 1)
        
        print("Result:" + String(result))
        
    case "fact":
        
        var result = 1
        
        if StringArr.count > 2 {
            
            print("Input Error: Fact can only accept one number.")
            
        } else {
            
            if StringArr[0].rangeOfString(".") != nil {
                
                print("Input Error: Fact can only accept one nonnegative integer.")
                
            } else if StringArr[0].rangeOfString("-") != nil {
                
                print("Input Error: Fact can only accept one nonnegative integer.")
                
            } else if convertInt(StringArr[0]) == 0 {
                
                print("Result:" + String(result))
                
            } else {
                
                for index in 1...convertInt(StringArr[0]) {
                    
                    result = result * index
                    
                }
                
                print("Result:" + String(result))
                
            }
            
        }
        
    default:
        
        print("Input Error")
    }
    
}


