//: [Previous](@previous)

import Foundation


struct Person: Decodable {
    
    let name: String
    let age: Int
    let department: Department
    
}

enum Department: Decodable {
    case rdd, hr, unknown
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let stringValue: String = try container.decode(String.self)
        
        switch stringValue.lowercased() {
        case "research":
            self = .rdd
        case "human-resource":
            self = .hr
        default:
            self = .unknown
        }
    }
}

let json = """
{
    "name": "Melaka",
    "age": 29,
    "department": "sd"
}
""".data(using: .utf8)!

let decoder = JSONDecoder()

let person = try decoder.decode(Person.self, from: json)



let department = Department.init(from: )
print(person.department)




//: [Next](@next)
