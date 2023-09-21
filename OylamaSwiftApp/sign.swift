import SwiftUI
import Firebase
import GoogleSignIn

struct SignInPage: View {
    @EnvironmentObject var signInManager: GoogleSignInManager // GoogleSignInManager nesnesini kullanabilmek için çevresel nesneyi ekliyoruz
    @State private var isSignInSuccessful = false // Oturum açma işlemi başarılı mı değil mi kontrol etmek için bir durum

    var body: some View {
        VStack {
            Text("Google ile Giriş Yap") // Sayfa başlığı
                .font(.largeTitle)
            
            if isSignInSuccessful {
                // Kullanıcı doğrulandıysa ContentView'e geçiş yap
                NavigationLink(destination: ContentView(), isActive: $isSignInSuccessful) {
                    EmptyView()
                }
            } else {
                Button(action: {
                    // Google ile giriş yap butonuna tıklandığında çalışacak işlev
                    signInWithGoogle()
                }) {
                    Text("Google ile Giriş Yap")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
    }

    // Google ile giriş yap işlemini gerçekleştiren işlev
    private func signInWithGoogle() {
        // GoogleSignInManager nesnesi kullanarak giriş işlemini başlat
        signInManager.signIn { success in
            if success {
                // Doğrulama başarılı oldu, ContentView'e geçiş izni ver
                isSignInSuccessful = true
            } else {
                // Doğrulama başarısız oldu, hata mesajını yönetebilirsiniz
                // Örneğin, bir hata ile ilgili bir uyarı gösterebilirsiniz
                print("Google ile giriş yapma hatası")
            }
        }
    }
}
