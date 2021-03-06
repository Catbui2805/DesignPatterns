import UIKit

enum Color {
    case red
    case green
    case blue
}

enum Size {
    case small
    case medium
    case large
    case yuge
}

class Product {
    var name: String
    var color: Color
    var size: Size
    
    init(_ name: String, _ color: Color, _ size: Size) {
        self.name = name
        self.color = color
        self.size = size
    }
}

class ProductFilter {
    func filterByColor(_ products: [Product], _ color: Color) -> [Product] {
        var result = [Product]()
        for p in products {
            if p.color == color {
                result.append(p)
            }
        }
        
        return result
    }
    
    func filterBySize(_ products: [Product], _ size: Size) -> [Product] {
        var result = [Product]()
        for p in products {
            if p.size == size {
                result.append(p)
            }
        }
        
        return result
    }
    
    func filterBySizeAndColor(_ producs: [Product], _ size: Size, _ color: Color) -> [Product] {
        var result = [Product]()
        for p in producs {
            if p.size == size && p.color == color {
                result.append(p)
            }
        }
        return result
    }
}



// Specification
protocol Specification {
    associatedtype T
    func isSatisfied(_ item: T) -> Bool
}

protocol Filter {
    associatedtype T
    func filter<Spec: Specification>(_ items: [T], _ spec: Spec) -> [T]
        where Spec.T == T
}

class ColorSpecification: Specification {
    typealias T = Product
    let color: Color

    init(_ color: Color) {
        self.color = color
    }

    func isSatisfied(_ item: Product) -> Bool {
        return item.color == self.color
    }

}

class SizeSpecification: Specification {
    typealias T = Product
    let size: Size

    init(_ size: Size) {
        self.size = size
    }

    func isSatisfied(_ item: Product) -> Bool {
        return item.size == self.size
    }
}

class BetterFilter: Filter {
    typealias T = Product

    func filter<Spec: Specification>(_ items: [Product], _ spec: Spec) -> [T] where Spec.T == T {
        var result = [Product]()
        for item in items {
            if spec.isSatisfied(item){
                result.append(item)
            }
        }
        return result
    }

}

class AndSpecification<T, SpecA: Specification, SpecB: Specification>: Specification where T == SpecA.T, T == SpecB.T {

    let first: SpecA
    let second: SpecB

    init(_ first: SpecA, _ second: SpecB) {
        self.first = first
        self.second = second
    }

    func isSatisfied(_ item: T) -> Bool {
        return first.isSatisfied(item) && second.isSatisfied(item)
    }

}


func main() {
    let apple = Product("Apple", .green, .small)
    let tree = Product("Tree", .green, .large)
    let house = Product("House", .blue, .large)
    
    let products = [apple, tree, house]
    
    let pf = ProductFilter()
    print("Product old:")
    for p in pf.filterByColor(products, .green) {
        print(" - \(p.name) is green")
    }
    
    let bf = BetterFilter()
    print("Green products (new):")
    for p in bf.filter(products, ColorSpecification(.green)) {
        print(" - \(p.name) is green")
    }


    let b = BetterFilter()
    print("Small products (new):")
    for p in b.filter(products, SizeSpecification(.small)) {
        print(" - \(p.name) is small")
    }

    print("Large blue items")
    for p in bf.filter(products, AndSpecification(
                        ColorSpecification(.blue),
                        SizeSpecification(.large))) {
        print(" - \(p.name) is green")
    }
}

main()
