import UIKit
import GoogleSignIn
import AuthenticationServices
import FirebaseAuth

class AuthRootViewController: UIViewController, ASAuthorizationControllerPresentationContextProviding {
    var serviceViewModel: ServicesViewModel?
    var navigateToEmailSignin: (() -> Void)?
    
    @IBOutlet weak var loginWithEmailButtom: UIButton!
    @IBOutlet var signInButton: GIDSignInButton!
    @IBOutlet weak var appleSignIn: ASAuthorizationAppleIDButton!
  
    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        configureGoogleSignInButton()
        loginWithEmailButtom.addTarget(self, action: #selector(moveToLogin), for: .touchUpInside)
    }
    
    @objc
    func moveToLogin() {
        navigateToEmailSignin?()
    }
    
    @IBAction func didTapAppleSignIn(_ sender: Any) {
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        request.requestedScopes = [.fullName, .email]

        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()

    }
    
    func configureGoogleSignInButton() {
        signInButton.style = .wide
        let signInConfig = GIDConfiguration.init(clientID: "1020653200021-se4ko8phdmla3chhpit3nej980a254bb.apps.googleusercontent.com")
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { _, error in
            guard error == nil else { return }
            
            // If sign in succeeded, display the app's main content View.
        }
    }

    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return view.window!
    }
}

extension AuthRootViewController: ASAuthorizationControllerDelegate {
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {

        switch authorization.credential {
        case let credentials as ASAuthorizationAppleIDCredential:
            // break
            let user = User(credentials: credentials)
            performSegue(withIdentifier: "segue", sender: user)
        default: break

        }
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
    // Handle error.
        if error is ASAuthorizationError {

        print("Authorization Error Occured", error)
        }
    }
}

extension AuthRootViewController: Storyboardable {
    static var storyboard: Storyboard { .auth }
}
