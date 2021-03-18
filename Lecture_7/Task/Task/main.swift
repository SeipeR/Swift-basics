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
    
    func addMember(role: Roles, member: PersonaUser) -> ([Roles: PersonaUser]?, PartyManagementError?) {
        var tempParty = party
        tempParty[role] = member
        
        guard tempParty[Roles.leader]!.name == Members.joker else {
            print("\nОШИБКА!!! Лидером отряда может быть только Joker!\n")
            return (nil, PartyManagementError.noLeader)
        }
        
        guard tempParty[Roles.nav]!.name == Members.oracle else {
            print("\nОШИБКА!!! Навигатором отряда может быть только Oracle!\n")
            return (nil, PartyManagementError.noNavigator)
        }
        
        guard tempParty.count <= 5 else {
            print("\nОШИБКА!!! Нельзя добавить ещё одного члена отряда!\n")
            return (nil, PartyManagementError.partyFull)
        }
        
        party = tempParty
        
        print("\(member.name.rawValue) (\(member.arcana.rawValue)) присоединяется к отряду")
        printCurrentParty(members: party)

        return (party, nil)
    }
    
    func deleteMember(member: Roles) -> ([Roles: PersonaUser]?, PartyManagementError?) {
        guard party[member] != nil else{
            print("\nОшибка!!! Член отряда отсутствует!\n")
            return (nil, PartyManagementError.memberNotExist)
        }
        guard member != Roles.leader else {
            print("\nОШИБКА!!! Невозможно удалить лидера отряда\n")
            return (nil, PartyManagementError.deleteLeader)
        }
        
        guard member != Roles.nav else {
            print("\nОШИБКА!!! Невозможно удалить навигатора отряда\n")
            return (nil, PartyManagementError.deleteNavigator)
        }
        
        print("\(party[member]!.name.rawValue) (\(party[member]!.arcana.rawValue)) покидает отряд")
        party[member] = nil
        
        printCurrentParty(members: party)
        
        return (party, nil)
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
test.addMember(role: .leader, member: PersonaUser(arcana: .emperor, name: .fox))
test.addMember(role: .nav, member: PersonaUser(arcana: .justice, name: .crow))
test.addMember(role: .memberOne, member: PersonaUser(arcana: .chariot, name: .skull))
test.addMember(role: .memberTwo, member: PersonaUser(arcana: .lovers, name: .panther))
test.addMember(role: .memberThree, member: PersonaUser(arcana: .faith, name: .violet))
test.addMember(role: .memberFour, member: PersonaUser(arcana: .magician, name: .mona))
test.deleteMember(member: .memberThree)
test.deleteMember(member: .nav)
test.deleteMember(member: .memberThree)
test.deleteMember(member: .leader)
test.addMember(role: .memberThree, member: PersonaUser(arcana: .faith, name: .violet))
test.deleteMember(member: .memberTwo)
