//  Repository.swift
//  DisplayAPIDataDemo
//
//  Created by Bhanu Pratap on 26/12/2025.
//

import Foundation

/// Represents a GitHub repository returned by the Apple org API
struct Repository: Decodable, Identifiable {

    /// Unique repository ID from GitHub
    let id: Int

    /// Repository name (e.g. swift, cups)
    let name: String

    /// Primary programming language used
    let language: String?

    /// Star count shows popularity
    let stargazers_count: Int

    /// Short description of the repository
    let description: String?
}


