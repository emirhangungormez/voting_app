# Yol Haritası:

## Swift Framework Seçimi
Swift ile uygulama geliştirmek için bir çerçeve seçmeliyiz, örneğin SwiftUI veya KitUI olabilir.

## Veritabanı Oluşturma
SQLite, PostgreSQL veya MySQL gibi bir veritabanı kullanarak videoları ve oy bilgilerini saklayacak bir veritabanı oluşturmalıyız. Google Firebase'de pek tabii kullanılabilir.

## Kullanıcı Kimlik Doğrulama
Kullanıcıların kayıt olmasını ve oturum açmasını sağlamak için Google SSI ve Firebase kullanmalıyız. (XCode'da Swift odaklı proje oluşturduğunuza dikkat edin.) File > Add Package > URL > "https://github.com/firebase/firebase-ios-sdk.git" yazacağız.

**GoogleSSI**: Google SSI (Single Sign-In) kullanarak Google ile oturum açma işlemini gerçekleştirmek için Google Identity Platform'un Firebase Authentication hizmetini kullanılabilir. Firebase Authentication, Google hesapları, diğer kimlik sağlayıcıları ve özel kimlik doğrulama yöntemleriyle entegre edebilir ve bu sayede kullanıcıların uygulamanıza Google hesaplarıyla kolayca oturum açmalarını sağlayabilir.

İşte bu işlemi adım adım gerçekleştirmeniz gereken temel adımlar:

- **Adım 1 - Firebase Projesi Oluşturma:**
Firebase Console'a (https://console.firebase.google.com) gidin ve Google hesabınızla oturum açın veya yeni bir hesap oluşturun. Yeni bir Firebase projesi oluşturun veya mevcut bir projeyi seçin.

- **Adım 2 - Firebase Projeye Uygulamanızı Ekleyin:**
Proje dashboard'ında "Uygulama Ekle" seçeneğine tıklayın. Uygulamanızın platformunu seçin (iOS veya Android). Adım adım rehberi takip ederek gerekli ayarları yapın ve Firebase SDK'yı uygulamanıza entegre edin.

- **Adım 3 - Firebase Authentication Ayarlarını Yapın:**
Firebase Console'da sol taraftaki menüden "Authentication" bölümüne gidin. "Oturum Açma Yöntemleri" sekmesine tıklayın. "Google" seçeneğini etkinleştirin ve ayarlarını yapılandırın.

- **Adım 4 - Xcode'da Firebase SDK Eklemek:**
  Firebase Authentication'ı kullanmak için Firebase SDK'sını Xcode projenize ekleyin. Bu işlem için CocoaPods veya Swift Package Manager gibi yöntemler kullanılabilir.

```
import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct YourApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate


  var body: some Scene {
    WindowGroup {
      NavigationView {
        ContentView()
      }
    }
  }
}
```

## Oylama İşlevi
Kullanıcıların kişileri oylayabilmesini sağlamak için bir oylama sistemi oluşturun. IP adresleri veya kullanıcı kimlikleri ile oylama tekrarını engellemeliyiz.

## Güvenlik - (Google Firebase)
Kullanıcı kimlik bilgilerini koruma, güvenlik açıklarını kapatma ve diğer güvenlik önlemlerini uygulama konusunda dikkatli olmalıyız.

## Test ve Hata Ayıklama
Uygulamanızı test edin ve hata ayıklama yapmalıyız.

## Yayına Alma
Uygulamanızı bir sunucuya dağıtarak kullanıcıların erişimine açmalıyız. (Google Firebase kullanılacaktır.)

---


