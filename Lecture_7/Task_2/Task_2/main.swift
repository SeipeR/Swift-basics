import Foundation

enum Arcana: String {
    case any = "Any"
    case lovers = "Lovers"
    case magician = "Magician"
    case emperor = "Emperor"
    case chariot = "Chariot"
    case priestess = "Priestess"
    case hermit = "Hermit"
    case empress = "Empress"
    case faith = "Faith"
    case justice = "Justice"
}

enum Members: String {
    case joker = "Ren Amamiya"
    case mona = "Morgana"
    case skull = "Ryuji Sakamoto"
    case panther = "Ann Takamaki"
    case fox = "Yusuke Kitagawa"
    case queen = "Makoto Nijima"
    case oracle = "Futaba Sakura"
    case noir = "Haru Okumura"
    case violet = "Sumire Yoshizawa"
    case crow = "Goro Akechi"
}

struct PersonaUser {
    let arcana: Arcana
    let name: Members
}

enum Roles: String {
    case leader = "Leader"
    case nav = "Navigator"
    case memberOne = "Member One"
    case memberTwo = "Member Two"
    case memberThree = "Member Three"
    case memberFour = "Member Four"
}

enum PartyManagementError: Error {
    case memberNotExist
    case partyFull
    case noLeader
    case deleteLeader
    case noNavigator
    case deleteNavigator
}

class PartyManagement {
    var party: [Roles: PersonaUser] = [
        Roles.leader: PersonaUser(arcana: .any, name: Members.joker),
        Roles.nav: PersonaUser(arcana: .hermit, name: Members.oracle)
    ]
    
    func addMember(role: Roles, member: PersonaUser) throws -> [Roles: PersonaUser] {
        var tempParty = party
        tempParty[role] = member
        
        guard tempParty[Roles.leader]!.name == Members.joker else {
            throw PartyManagementError.noLeader
        }
        
        guard tempParty[Roles.nav]!.name == Members.oracle else {
            throw PartyManagementError.noNavigator
        }
        
        guard tempParty.count <= 5 else {
            throw PartyManagementError.partyFull
        }
        
        party = tempParty
        print("\(member.name.rawValue) (\(member.arcana.rawValue)) присоединяется к отряду")
        test.printCurrentParty(members: test.party)
        
        return party
    }
    
    func deleteMember(member: Roles) throws -> [Roles: PersonaUser] {
        guard party[member] != nil else{
            throw PartyManagementError.memberNotExist
        }
        guard member != Roles.leader else {
            throw PartyManagementError.deleteLeader
        }
        
        guard member != Roles.nav else {
            throw PartyManagementError.deleteNavigator
        }
        
        print("\(party[member]!.name.rawValue) (\(party[member]!.arcana.rawValue)) покидает отряд")
        party[member] = nil
        
        printCurrentParty(members: party)
        
        return party
    }
    
    func printCurrentParty (members: [Roles: PersonaUser]) {
        print("\n----------\nТекущий отряд:")
        for member in members {
            print("\(member.key.rawValue): \(member.value.name.rawValue). Аркана: \(member.value.arcana.rawValue)")
        }
        print("----------\n")
    }
}

var test = PartyManagement()
do {
    try test.addMember(role: .leader, member: PersonaUser(arcana: .emperor, name: .fox))
} catch PartyManagementError.noLeader {
    print("\nОШИБКА!!! Лидером отряда может быть только Joker!\n")
}

do {
    try test.addMember(role: .nav, member: PersonaUser(arcana: .justice, name: .crow))
} catch PartyManagementError.noNavigator {
    print("\nОШИБКА!!! Навигатором отряда может быть только Oracle!\n")
}

try test.addMember(role: .memberOne, member: PersonaUser(arcana: .chariot, name: .skull))
try test.addMember(role: .memberTwo, member: PersonaUser(arcana: .lovers, name: .panther))
try test.addMember(role: .memberThree, member: PersonaUser(arcana: .faith, name: .violet))

do {
    try test.addMember(role: .memberFour, member: PersonaUser(arcana: .magician, name: .mona))
} catch PartyManagementError.partyFull {
    print("\nОШИБКА!!! Нельзя добавить ещё одного члена отряда!\n")
}

try test.deleteMember(member: .memberThree)

do {
    try test.deleteMember(member: .memberThree)
} catch PartyManagementError.memberNotExist {
    print("\nОшибка!!! Член отряда отсутствует!\n")
}

do {
    try test.deleteMember(member: .leader)
} catch PartyManagementError.deleteLeader {
    print("\nОШИБКА!!! Невозможно удалить лидера отряда\n")
}

do {
    try test.deleteMember(member: .nav)
} catch PartyManagementError.deleteNavigator {
    print("\nОШИБКА!!! Невозможно удалить навигатора отряда\n")
}

try test.deleteMember(member: .memberTwo)
