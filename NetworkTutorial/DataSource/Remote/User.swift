//
//  User.swift
//  NetworkTutorial
//
//  Created by 이병훈 on 1/11/25.
//

import Foundation

// MARK: container

// TODO: 왜 container를 쓸까?
/// 추측: decode 해야할게 있고 안해도 될게 있어서
struct User: Decodable {
    let id: Int
    let name: String
    let city: String
    let postalCode: String
    let email: String
    let phone: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case details
        
        enum DetailsKeys: String, CodingKey {
            case address
            case contacts
            
            enum AddressKeys: String, CodingKey {
                case city
                case postalCode
            }
            
            enum ContactsKeys: String, CodingKey {
                case email
                case phone
            }
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        
        let detailsContainer = try container.nestedContainer(keyedBy: CodingKeys.DetailsKeys.self, forKey: .details)
        
        let addressContainer = try detailsContainer.nestedContainer(keyedBy: CodingKeys.DetailsKeys.AddressKeys.self, forKey: .address)
        
        self.city = try addressContainer.decode(String.self, forKey: .city)
        self.postalCode = try addressContainer.decode(String.self, forKey: .postalCode)
        
        let contactsContainer = try detailsContainer.nestedContainer(keyedBy: CodingKeys.DetailsKeys.ContactsKeys.self, forKey: .contacts)
        
        self.email = try contactsContainer.decode(String.self, forKey: .email)
        self.phone = try contactsContainer.decode(String.self, forKey: .phone)
    }
}

// 일반적인 방법

/// 추측: 모든 데이터를 디코딩 해야 하는경우에는 아래 방법이 낫지 않나?

//struct User: Decodable {
//    let id: Int
//    let name: String
//    let details: DetailsInfo
//    
//    struct DetailsInfo: Decodable {
//        var address: AddressInfo
//        let contacts: ContactsInfo
//    }
//
//    struct AddressInfo: Decodable {
//        let city: String
//        let postalCode: String
//    }
//
//    struct ContactsInfo: Decodable {
//        let email: String
//        let phone: String
//    }
//    
//    enum CodingKeys: CodingKey {
//        case id
//        case name
//        case details
//    }
//}
