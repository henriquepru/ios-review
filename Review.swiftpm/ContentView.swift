import SwiftUI

struct ContentView: View {
    typealias Main = HightOrderFunctions
    var body: some View {
        VStack {
            Text("Sorts")
            Text("\(Main.sort().description)\n")
        }
    }
}

struct HightOrderFunctions {
    //MARK: - Sorts
    static func sort(numbers: [Int] = [1,3,8,6,7,3,13,4,99,31]) -> [Int] {
        return numbers.sorted()
    }
    static func sortAscending(numbers: [Int] = [1,3,8,6,7,3,13,4,99,31]) -> [Int] {
        return numbers.sorted(by: >)
    }
    static func sortDescending(numbers: [Int] = [1,3,8,6,7,3,13,4,99,31]) -> [Int] {
        return numbers.sorted(by: <)
    }
    static func sortEvenFirst(_ a : Int, _ b : Int) -> Bool {
        return a % 2 == 0
    }
    static func sortBy(numbers: [Int] = [1,3,8,6,7,3,13,4,99,31, 2], by: (Int, Int) -> Bool) -> [Int] {
        return numbers.sorted(by: by)
    }
    //MARK: - Maps
    static func mapToString(numbers: [Int] = [1,3,8,6,7,3,13,4,99,31, 2]) -> [String] {
        return numbers.map(String.init)
    }
    //MARK: - Filters
    static func filterEven(numbers: [Int] = [1,3,8,6,7,3,13,4,99,31, 2]) -> [Int] {
        return numbers.filter { $0 % 2 == 0 }
    }
    //MARK: - Reduces
    static func longString(numbers: [Int] = [1,3,8,6,7,3,13,4,99,31, 2]) -> String {
        return numbers.reduce("") { (result, a) -> String in
            return result + String(a)
        }
    }
    static func sumAll(numbers: [Int] = [1,3,8,6,7,3,13,4,99,31, 2]) -> Int {
        return numbers.reduce(0) { (result, a) -> Int in
            return result + a
        }
    }
}
