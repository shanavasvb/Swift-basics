import Foundation

// MARK: - User Model
struct User {
    let username: String
    let password: String
    let email: String?
    
    init(username: String, password: String, email: String? = nil) {
        self.username = username
        self.password = password
        self.email = email
    }
}

// MARK: - Authentication Manager
class AuthenticationManager {
    private var registeredUsers: [String: User] = [:]
    private var currentUser: User?
    
    // Register a new user
    @discardableResult
    func register(username: String, password: String, email: String? = nil) -> Bool {
        // Check if username already exists
        guard registeredUsers[username] == nil else {
            print("❌ Registration failed: Username '\(username)' already exists")
            return false
        }
        
        // Validate password strength (minimum 6 characters)
        guard password.count >= 6 else {
            print("❌ Registration failed: Password must be at least 6 characters")
            return false
        }
        
        let newUser = User(username: username, password: password, email: email)
        registeredUsers[username] = newUser
        print("✅ User '\(username)' registered successfully")
        return true
    }
    
    // Login with username and password
    @discardableResult
    func login(username: String, password: String) -> Bool {
        // Use guard let to safely unwrap the optional user
        guard let user = registeredUsers[username] else {
            print("❌ Login failed: Username '\(username)' not found")
            return false
        }
        
        // Verify password
        guard user.password == password else {
            print("❌ Login failed: Incorrect password")
            return false
        }
        
        currentUser = user
        print("✅ Welcome, \(username)!")
        return true
    }
    
    // Logout current user
    func logout() {
        guard let user = currentUser else {
            print("⚠️  No user is currently logged in")
            return
        }
        
        print("👋 Goodbye, \(user.username)!")
        currentUser = nil
    }
    
    // Get current logged-in user
    func getCurrentUser() -> User? {
        return currentUser
    }
    
    // Display user info using optional chaining
    func displayUserInfo() {
        if let user = currentUser {
            print("👤 Current User: \(user.username)")
            // Using nil coalescing operator
            let emailDisplay = user.email ?? "No email provided"
            print("📧 Email: \(emailDisplay)")
        } else {
            print("⚠️  No user is currently logged in")
        }
    }
}

// MARK: - Demo Usage
print("=== User Authentication Demo ===\n")

let authManager = AuthenticationManager()

// Test 1: Register users
print("--- Test 1: User Registration ---")
authManager.register(username: "shanavas", password: "secure123", email: "shanavas@example.com")
authManager.register(username: "sidharth", password: "pass456")
authManager.register(username: "shanavas", password: "another") // Duplicate username
authManager.register(username: "test", password: "123") // Weak password
print()

// Test 2: Login attempts
print("--- Test 2: Login Attempts ---")
authManager.login(username: "shanavas", password: "secure123") // Success
authManager.displayUserInfo()
print()

authManager.logout()
print()

authManager.login(username: "shanavas", password: "wrongpass") // Wrong password
authManager.login(username: "nonexistent", password: "pass") // User doesn't exist
print()

// Test 3: Successful login and user info
print("--- Test 3: User Info Display ---")
authManager.login(username: "sidharth", password: "pass456")
authManager.displayUserInfo()
print()

authManager.logout()
print()

print("=== Demo Complete ===")
