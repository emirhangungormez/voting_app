import SwiftUI
import Firebase
import GoogleSignIn

@main
struct MyApp: App {
    // Firebase ayarları için app delegate kaydı
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            Color(red: 0.8, green: 0.9, blue: 1.0) // Arkaplan rengini burada ayarlayabilirsiniz
                    .ignoresSafeArea()
            if signInManager.isSignedIn {
                // Kullanıcı doğrulandıysa ContentView'e git
                ContentView()
            } else {
                // Kullanıcı doğrulanmadıysa SignInPage'e git
                SignInPage()
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate, GIDSignInDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()

        // Google Sign-In için GIDSignInDelegate'i ayarlayın
        GIDSignIn.sharedInstance().clientID = "YOUR_CLIENT_ID" // OAuth 2.0 kimlik istemci kimliği
        GIDSignIn.sharedInstance().delegate = self

        return true
    }

    // Google ile oturum açma işlemi tamamlandığında bu işlev çağrılır
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            // Oturum açma işlemi başarısız oldu, hata mesajlarını yönetebilirsiniz
            print("Google ile oturum açma hatası: \(error.localizedDescription)")
        } else {
            // Oturum açma işlemi başarılı, kullanıcı bilgilerini alabilirsiniz
            let userID = user.userID // Kullanıcının Google ID'si
            let email = user.profile.email // Kullanıcının e-posta adresi
            let fullName = user.profile.name // Kullanıcının adı ve soyadı
            // Kullanıcı bilgilerini kullanarak giriş yapabilirsiniz

            // Örneğin, oturum açma işlemi başarılı olduğunda işaretleyiciyi ayarlayabilirsiniz
            signInManager.isSignedIn = true
        }
    }
}
