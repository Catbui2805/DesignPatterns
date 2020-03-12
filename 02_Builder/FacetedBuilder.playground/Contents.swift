import UIKit

class Person: CustomStringConvertible {
    // Address
    var streetAddress = ""
    var postcode = ""
    var city = ""
    
    // employment
    var companyName = ""
    var position = ""
    var annualIncome = 0
    
    var description: String {
        return "I live at \(streetAddress), \(postcode), \(city)." +
            "I work at \(companyName) as \(position), earning \(annualIncome)"
    }
}

class PersonBuilder {
    var person = Person()
    var lives: PersonAddressBuilder {
        return PersonAddressBuilder(person)
    }
    
    var works: PersonJobBuilder {
        return PersonJobBuilder(person)
    }
    
    func build() -> Person {
        return person
    }
    
}

class PersonAddressBuilder: PersonBuilder {
    internal init(_ person: Person) {
        super.init()
        self.person = person
    }
    
    func at(_ streetAddress: String) -> PersonAddressBuilder {
        person.streetAddress = streetAddress
        return self
    }
    
    func withPostcode(_ postcode: String) -> PersonAddressBuilder {
        person.postcode = postcode
        return self
    }
    
    func inCity(_ city: String) -> PersonAddressBuilder {
        person.city = city
        return self
    }
    
}

class PersonJobBuilder: PersonBuilder {
    internal init(_ person: Person) {
        super.init()
        self.person = person
    }
    
    func at(_ companyName: String) -> PersonJobBuilder {
        person.companyName = companyName
        return self
    }
    
    func asA(_ position: String) -> PersonJobBuilder {
        person.position = position
        return self
    }
    
    func earning(_ annualIncome: Int) -> PersonJobBuilder {
        person.annualIncome = annualIncome
        return self
    }
}


func main() {
    let pb = PersonBuilder()
    let p = pb.lives.at("12 Truong Dinh").inCity("HaNoi").withPostcode("10000")
        .works.at("To Huu").asA("Engineer").earning(1000)
        .build()
    print(p)
}


main()
