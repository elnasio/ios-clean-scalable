//
//  MainTab.swift
//  ios-scalable-project
//
//  Created by Mories Hutapea on 23/05/25.
//
import SwiftUI

enum MainTab: Int, CaseIterable {
    case home
    case profile
    case article

    var title: LocalizedStringKey {
        switch self {
        case .home: .init("Home")
        case .profile: .init("Profile")
        case .article: .init("Article")
        }
    }

    var icon: String {
        switch self {
        case .home: return "house"
        case .profile: return "person"
        case .article: return "doc.text"
        }
    }

    @ViewBuilder
    var view: some View {
        switch self {
        case .home: HomeScreen()
        case .profile: ProfileScreen()
        case .article: ArticleScreen()
        }
    }
}
