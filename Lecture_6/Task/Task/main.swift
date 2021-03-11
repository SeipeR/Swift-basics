import Foundation

struct Fifo<T> {
    var array = [T]()
    
    mutating func push(_ element: T) {
        print("Элемент \(element) добавлен в очередь")
        return array.append(element)
    }
    
    mutating func pop() -> T? {
        if array.count != 0{
            print("Элемент \(array[0]) извлечён из очереди")
            return array.removeFirst()
        } else {
            print("Извлекать нечего, очередь пуста!")
            return nil
        }
    }
}

var exampleIntArray = Fifo<Int>()
var exampleStringArray = Fifo<String>()

exampleIntArray.push(1)
exampleIntArray.push(-96)
exampleIntArray.push(461)
print(exampleIntArray.array)
exampleIntArray.pop()
print(exampleIntArray.array)
exampleIntArray.pop()
exampleIntArray.pop()
print(exampleIntArray.array)
exampleIntArray.pop()

exampleStringArray.push("Joker")
exampleStringArray.push("Panther")
print(exampleStringArray.array)
exampleStringArray.push("Mona")
print(exampleStringArray.array)
exampleStringArray.pop()
print(exampleStringArray.array)

