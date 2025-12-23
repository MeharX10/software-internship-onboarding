@main
struct App {
    static func main() {
        print("=== Guard Chaining ===")
        loadUserWebsite(profile: validProfile)
        loadUserWebsite(profile: invalidProfile)

        print("\n=== If-let Chaining ===")
        loadUserWebsiteIfLet(profile: validProfile)
        loadUserWebsiteIfLet(profile: invalidProfile)
    }
}
