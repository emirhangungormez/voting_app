import Firebase
import GoogleSignIn

class GoogleSignInManager: ObservableObject {
    @Published var isSignedIn: Bool = false

    init() {
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.first?.rootViewController
    }

    func signIn(completion: @escaping (Bool) -> Void) {
        GIDSignIn.sharedInstance()?.signIn()
        // Oturum açma işlemi başarı veya başarısız olduğunda completion kapatılabilir.
    }

    func signOut() {
        GIDSignIn.sharedInstance()?.signOut()
        isSignedIn = false
    }
}

extension GoogleSignInManager: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error != nil {
            // Oturum açma hatası oluştu.
            isSignedIn = false
            print("Google ile giriş yapma hatası: \(error.localizedDescription)")
        } else {
            // Oturum açma başarılı.
            isSignedIn = true
            print("Google ile giriş başarılı: \(user.profile.name ?? "")")
        }
    }
}
