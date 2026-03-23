import UIKit

class AuthViewController: UIViewController {

    // UI Elements for login and registration
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Additional setup if needed
    }

    // Function for login action
    @IBAction func loginTapped(_ sender: UIButton) {
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            print("Email and Password are required!")
            return
        }
        login(email: email, password: password)
    }

    // Function for registration action
    @IBAction func registerTapped(_ sender: UIButton) {
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            print("Email and Password are required!")
            return
        }
        register(email: email, password: password)
    }

    private func login(email: String, password: String) {
        // Add your login logic here
        print("Logging in with email: \(email)")
        // Call your authentication service
    }

    private func register(email: String, password: String) {
        // Add your registration logic here
        print("Registering with email: \(email)")
        // Call your authentication service
    }
}