//
//  main.swift
//  Array fun
//
//  Created by Derry Cheng on 10/13/15.
//  Copyright © 2015 Derry Cheng. All rights reserved.
//

import Foundation

func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData,
        encoding:NSUTF8StringEncoding) as! String
    return
        result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}
func convert(incoming:String) -> Double {
    return NSNumberFormatter().numberFromString(incoming)!.doubleValue
}


print("Please enter a list of integers, separated by commas.")

let userInput = input()
let userInputArr = userInput.componentsSeparatedByString(",")

var gamestatus : Int = 0

print("")
print("What would you like to do with these numbers?")
print("Enter: Add/Multiply/Count/Average")

while (gamestatus == 0){
    var unknowncommand = 0;
    let task = input().lowercaseString;
    if (task == "0"){
        gamestatus = 1
        print("")
    } else {
        func add(list : [String]) -> Double{
            var total : Double = 0
            for (var i = 0; i<userInputArr.count; i++){
                total += convert(userInputArr[i])
            }
            return total;
        }

        func mul(list : [String]) -> Double{
            var total : Double = 1
            for (var i = 0; i<userInputArr.count; i++){
                total *= convert(userInputArr[i])
            }
            return total;
        }

        func count(list : [String]) -> Double{
            return Double(list.count);
        }

        func avg(list : [String]) -> Double{
            return add(list)/count(list);
        }
        
        
        func Operator(list:[String], task: String) -> Double{
            switch task{
            case "add":
                return add(userInputArr)
            case "multiply":
                return mul(userInputArr)
            case "count":
                return count(userInputArr)
            case "average":
                return avg(userInputArr);
            default:
                unknowncommand = 1
                print("Unknown command")
                print("")
                return 0.0;
            }
        }
        
        var result = Operator(userInputArr, task: task )
        
            if(unknowncommand != 1){
                if result%1 != 0 {
                    print("")
                    print("The result is \(result)")
                } else {
                    var resultInt = Int(result)
                    print("")
                    print("The result is \(resultInt)")
                }
            }
        print("What else would you like to do with these numbers?")
        print("Enter: Add/Multiply/Count/Average. To abort, enter 0")
        
    }
}




