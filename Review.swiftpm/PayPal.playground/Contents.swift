import UIKit
import SwiftUI

var interview = "PayPal, Content Review"

//MARK: - Swift Review

//MARK: - Class vs Struct
/*
 - Class are reference types and structs value types
 - Use structures by default.
 - Use classes when you need Objective-C interoperability.
 - Only classes allow inheritance
 - Only classes have deinit()
 */
//MARK: - Map vs CompactMap
//map() transforms a sequence using a function we specify
//compactMap() does that same step but then unwraps its optionals and discards any nil values.

//MARK: - Delegates vs Closures
//Delegates
//Delegates, are a design pattern that allows one object to delegate responsibilities or functionalities to another object.
//The delegate pattern is huge in iOS. ex: UITableViewDelegate

//Delegate Example
protocol TaskDelegate: AnyObject {
    func didCompleteTask(result: String)
}

struct TaskManager {
    weak var delegate: TaskDelegate?

    func performTask() {
        let result = "Task completed successfully"
        delegate?.didCompleteTask(result: result)
    }
}

final class TaskHandler: TaskDelegate {
    func didCompleteTask(result: String) {
        print("TaskHandler received result: \(result)")
    }
}

var taskManager = TaskManager()
let taskHandler = TaskHandler()

taskManager.delegate = taskHandler
taskManager.performTask()


//Closures
//Closures are self-contained blocks of functionality that can be passed around and used in your code.
//Closures are often used for tasks like handling asynchronous operations, defining callbacks, or encapsulating functionality.
//In summary, closures are more general-purpose and self-contained blocks of code, while delegates are a design pattern facilitating communication and cooperation between objects.

// Closure example
let multiplyClosure: (Int, Int) -> Int = { (a, b) in
    return a * b
}
let result = multiplyClosure(3, 4)
print(result)


//MARK: - Double vs Float 🔢
//Used to represent Decimal numbers.
// It all about precision where
//Double: 15 decimal places / Float: 6 decimal places
//By Default just use Double
print(Double.pi)
print(Float.pi)

// And Memory usage 💾
print(MemoryLayout.size(ofValue: Double.pi))
print(MemoryLayout.size(ofValue: Float.pi))

//MARK: - Model-View-Presenter(MVP) vs Model-View-ViewModel(MVVM)
/*
 Architecture Key Words
 - Scalability
 - Maintainability
 - Reliability

 Model-View-Presenter(MVP)

 - The View here is the same as the view in Model-View-Controller pattern, except that the View should not interact with the Model directly, the View can interact only with the presenter
 - The Model is also the same as the model in Model-View-Controller pattern, but the Model also can not interact directly with the View, it should interact only with the Presenter
 - The Presenter is the new layer introduced by Model-View-Presenter pattern, the Presenter is an intermediate layer that handle the communication between View and Model. it solved a lot of MVC problems like testability, maintainability, scalability.

 Model-View-ViewModel(MVVM)

 - The MVVM pattern is derived from Model-View-Controller pattern the same as the MVP, it also has the same components and relations as the MVP, but the Presenter Layer is replaced by the ViewModel Layer and the communication between the View and the ViewModel done through Data Binding approach.

 - The ViewModel is at the heart of the MVVM architectural pattern and provides the connection between the business/presentation logic and the View/ViewController.

 - The ViewModel should be hocked up with View via Data Binding paradigms, the most widely used is Reactive Programming, there are many frameworks which implements Reactive programming like RxSwift, ReactiveCocoa and Bond

 - The ViewModel should represent the View’s current state at any time, and this means that, the ViewModel is a model that represents the View literally(for example if we have login screen that has two UITextfields for username and password. Then, the ViewModel should have two String properties which represents the username Textfield and password TextField) and this is very easy when you implement it using any reactive framework or using any data binding method
*/

//MARK: - When would you use @autoclosure?
/*
 - @autoclosure silently turns a function’s parameter into a closure so that it can be executed on demand rather than immediately.
 - Now, pick a specific example such as assert() and explain why it’s used – the autoclosure behavior here ensures our assertion doesn’t happen in release mode, so it won’t have a performance impact when we ship apps to the App Store.
 */

func someFunction(expression: @autoclosure () -> Bool) {
    if expression() {
        print("Expression is true")
    }
}

func noAutoclosureFunction(expression: () -> Bool) {
    if expression() {
        print("Expression is true")
    }
}

someFunction(expression: 5 > 3) // Using 5 > 3 instead of a closure
noAutoclosureFunction { return 5 > 3 } // Need to use the closure

// Self vs self
struct Network {
    static let apiVersion = 1.0

    func usginInside() {
        print(Network.apiVersion)
        print(Self.apiVersion)
    }
}

Network().usginInside()

print(Network.apiVersion)
//print(Self.apiVersion)  Don't Works - because need to be inside the Type



protocol StorageMechanism {
    associatedtype TypeOfStorage
}

//func implementingStorageFirst(_ mechanism: StorageMechanism) {
//    // ❌ Will not compile since StorageMechanism
//    //    has associatedtype defined inside it
//}

func implementingStorageSecond<T: StorageMechanism>(_ mechanism: T) {
    // ✅ Will Compile since we are now using generics
}

func implementingStorageThird(_ mechanism: some StorageMechanism) {
    // ✅ Will Compile since we are now using some keyword
}


// 1. ✅ Will compile
var var1: [some View] = [ Text("Sample Text"), Text("Sample Text") ]

//// 2. ❌ Will not compile
//var var2: [some View] = [ Text("Sample Text"), Label("Sample Text", systemImage: "bolt.fill") ]

// 3. ✅ Will Compile
var var3: [any View] = [ Text("Sample Text"), Label("Sample Text", systemImage: "bolt.fill") ]

