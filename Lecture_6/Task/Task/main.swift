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

exampleIntArray.pop()
exampleIntArray.push(1)
exampleIntArray.push(-96)
exampleIntArray.push(461)
print(exampleIntArray.array)
exampleIntArray.pop()
print(exampleIntArray.array)
exampleIntArray.push(2)
print(exampleIntArray.array)

exampleStringArray.push("Joker")
exampleStringArray.push("Panther")
print(exampleStringArray.array)
exampleStringArray.push("Mona")
print(exampleStringArray.array)
exampleStringArray.pop()
print(exampleStringArray.array)
exampleStringArray.push("Fox")
exampleStringArray.push("Joker")
exampleStringArray.push("Skull")
exampleStringArray.push("Queen")
exampleStringArray.push("Oracle")
exampleStringArray.push("Noir")
exampleStringArray.push("Crow")
exampleStringArray.push("Violet")

let arcana = [
    "any": "Any",
    "lovers": "Lovers",
    "magician": "Magician",
    "emperor": "Emperor",
    "chariot": "Chariot",
    "priestess": "Priestess",
    "hermit": "Hermit",
    "empress": "Empress",
    "faith": "Faith",
    "justice": "Justice"
]

print(exampleIntArray.array.filter { $0 > 1 })

print(exampleStringArray.array.map { (string) -> String in
        var output = ""
        
        func desc(name: String, arcanaName: String) -> String {
            return "\(name) using \(arcana[arcanaName]!) arcana"
        }
    
        switch string {
            case "Joker":
                output = desc(name: string, arcanaName: "any")
            case "Mona":
                output = desc(name: string, arcanaName: "magician")
            case "Fox":
                output = desc(name: string, arcanaName: "emperor")
            case "Panther":
                output = desc(name: string, arcanaName: "lovers")
            case "Skull":
                output = desc(name: string, arcanaName: "chariot")
            case "Queen":
                output = desc(name: string, arcanaName: "priestess")
            case "Oracle":
                output = desc(name: string, arcanaName: "hermit")
            case "Noir":
                output = desc(name: string, arcanaName: "empress")
            case "Violet":
                output = desc(name: string, arcanaName: "faith")
            case "Crow":
                output = desc(name: string, arcanaName: "justice")
            default:
                break
        }
    
        return output
})
