import Foundation

let value = 301

let hours = value / 60
let mins = (value % 60)

var timeComponents:[String] = []
hours > 0 ? timeComponents.append("\(hours)h") : nil
mins > 0 ? timeComponents.append(String(format: "%02dm",mins)) : nil


print(timeComponents.joined(separator: ":"))

let dataComponents = DateComponents(minute: value)

let timeInterval = TimeInterval(539 * 60)
let formatter = DateComponentsFormatter()
formatter.unitsStyle = .abbreviated
formatter.allowedUnits = [.day, .hour, .minute, .second]
formatter.string(from: timeInterval)

let split1 = Float(45.0 / 2.0)
let split = ceil(0.5)
//let angle = 27 + Int(round(Float(45 / 2)))
let x = 355 - Int(ceil(Float(45) / 2.0))
