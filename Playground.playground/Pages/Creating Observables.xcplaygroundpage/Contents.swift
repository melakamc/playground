//: [Previous](@previous)

import RxSwift
import RxCocoa

extension ObservableType {
    func printNext(_ tag: String? = nil) -> Disposable {
        return subscribe(onNext: { value in
            if let tag = tag {
                print("\(tag) -> \(value)")
            } else {
                print("\(value)")
            }
        })
    }
    
    func delay(_ delay: Double, offset: Double = 0.1, closure: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay - offset) {
            closure()
        }
    }
    
}
//
//func printSecondBoundary() -> Disposable {
//    return Observable
//        .interval(.seconds(1), scheduler: MainScheduler.instance)
//        .delay(.milliseconds(100), scheduler: MainScheduler.instance)
//        .subscribe(onNext: { index in
//            print("----- t\(index + 1) -----\n")
//        })
//}

let observable = Observable<Int>.create { observer -> Disposable in
    // Simulating a very resource expensive operation
    print("Creating observable...")
    DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 1, execute: {
        observer.onNext(1)
        observer.onCompleted()
    })
    return Disposables.create()
    }
    .startWith(0)
    .share(replay: 0, scope: .forever)

let subscriptionA = observable.printNext("subscriptionA")
let subscriptionB = observable.printNext("subscriptionB")
let subscriptionC = observable.printNext("subscriptionC")





//: [Next](@next)
