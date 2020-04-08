import UIKit
import RxSwift
import RxCocoa

let disposeBag = DisposeBag()

let behaviorRelay = BehaviorRelay<Int>(value: 0)

let behaviorSubject = BehaviorSubject<Int>(value: 0)

let replaySubject = ReplaySubject<Int>.create(bufferSize: 4)
replaySubject.onNext(0)
replaySubject.onNext(1)
replaySubject.onNext(3)
replaySubject.onNext(4)
replaySubject.onNext(5)
replaySubject.onNext(6)
replaySubject.onNext(7)

behaviorRelay.accept(1)
behaviorRelay.subscribe( { print("Behavior Relay -> \($0)") })
    .disposed(by: disposeBag)
behaviorRelay.accept(2)
behaviorRelay.accept(3)

behaviorSubject.onNext(1)
behaviorSubject.subscribe( { print("Behavior Subject -> \($0)") })
    .disposed(by: disposeBag)
behaviorSubject.onNext(2)
behaviorSubject.onNext(3)

replaySubject.subscribe({ print("Replay Subject -> \($0)") })

replaySubject.onNext(8)


struct Person: Codable {
    let nameOf: String
    let age: Int
    
//    enum CodingKeys: String, CodingKey {
//        case name = "names"
//        case age = "age"
//    }
}

let json = """
{
    "name_of": "Melaka",
    "age": 29,
    "description": "A fruit with a distinctive scent."
}
""".data(using: .utf8)!

let decoder = JSONDecoder()
decoder.keyDecodingStrategy = .convertFromSnakeCase
let person = try decoder.decode(Person.self, from: json)

print(person.nameOf)
