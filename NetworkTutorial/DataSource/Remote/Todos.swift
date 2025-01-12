//
//  Todos.swift
//  NetworkTutorial
//
//  Created by 이병훈 on 1/11/25.
//

import Foundation

struct Todo: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}
