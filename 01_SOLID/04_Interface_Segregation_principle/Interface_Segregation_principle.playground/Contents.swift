import UIKit

class Document {
    
}

protocol Machine {
    func print(d: Document)
    func scan(d: Document)
    func fax(d: Document)
}

class MFP: Machine {
    func print(d: Document) {
        
    }
    
    func scan(d: Document) {
        
    }
    
    func fax(d: Document) {
        
    }
    
}

enum NoReuiredFunctionality: Error {
    case doseNotFax
}

//class OldFashionedPrinter: Machine {
//    func print(d: Document) {
//        
//    }
//    
//    func scan(d: Document) {
//        
//    }
//    
//    func fax(d: Document) {
//        throw NoReuiredFunctionality.doseNotFax
//    }
//    
//}

protocol Printer {
    func print(d: Document)
}

protocol Scanner {
    func Scan(d: Document)
}

protocol Fax {
    func fax(d: Document)
}


class OrdinaryPrinter: Printer {
    func print(d: Document) {
        
    }
    
}

class Photocopier: Printer, Scanner {
    func print(d: Document) {
        
    }
    
    func Scan(d: Document) {
        
    }
    
    
}

protocol MultiFunctionDevice: Printer, Scanner, Fax {
}

class MultiFunctionMachine: MultiFunctionDevice {
    
    let printer: Printer
    let scanner: Scanner
    
    init(printer: Printer, scanner: Scanner) {
        self.printer = printer
        self.scanner = scanner
    }
    
    func print(d: Document) {
        
    }
    
    func Scan(d: Document) {
        
    }
    
    func fax(d: Document) {
        
    }
}
