import Foundation

// MARK: - Example data source
struct UserProfile {
    let username: String?
    let email: String?
    let website: String?
}

// MARK: - Function using guard chaining
func loadUserWebsite(profile: UserProfile?) {

    // guard chaining ensures early exit
    guard
        let profile = profile,
        let username = profile.username,
        let email = profile.email,
        let websiteString = profile.website,
        let websiteURL = URL(string: websiteString)
    else {
        print("❌ Missing required user information")
        return
    }

    print("✅ Guard success:")
    print("User:", username)
    print("Email:", email)
    print("Website:", websiteURL.absoluteString)
}

// MARK: - Function using if-let chaining
func loadUserWebsiteIfLet(profile: UserProfile?) {

    if let profile = profile,
       let username = profile.username,
       let email = profile.email,
       let websiteString = profile.website,
       let websiteURL = URL(string: websiteString) {

        print("✅ if-let success:")
        print("User:", username)
        print("Email:", email)
        print("Website:", websiteURL.absoluteString)

    } else {
        print("❌ Missing required user information")
    }
}

// MARK: - Test cases

let validProfile = UserProfile(
    username: "bhanu",
    email: "bhanu@example.com",
    website: "https://focusbear.io"
)

let invalidProfile = UserProfile(
    username: "bhanu",
    email: nil,
    website: "https://focusbear.io"
)
