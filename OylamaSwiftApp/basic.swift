import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                BoxView(imageName: "person1", name: "İsim Soyisim 1")
                    .frame(height: 200)
                
                BoxView(imageName: "person2", name: "İsim Soyisim 2")
                    .frame(height: 200)
                
                BoxView(imageName: "person3", name: "İsim Soyisim 3")
                    .frame(height: 200)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BoxView: View {
    @State private var voteCount: Int = 0
    let imageName: String
    let name: String

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color(red: 0.23, green: 0.23, blue: 0.23))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                UserView(imageName: imageName, name: name, voteCount: $voteCount)
                    .padding()
                    .foregroundColor(.white)
                    .font(.title)
                
                VoteCounter(count: voteCount)
                    .foregroundColor(.white)
                    .font(.headline)
                    .offset(x: geometry.size.width / 2 - 60, y: -geometry.size.height / 2 + 20)
            }
        }
    }
}

struct UserView: View {
    let imageName: String
    let name: String
    @Binding var voteCount: Int
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .background(
                    Image("Youtube")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                )
                .overlay(
                    Circle().stroke(Color(red: 0.2, green: 0.2, blue: 0.2), lineWidth: 4)
                )
                .padding(.bottom, 10)
            
            Text(name)
                .font(.headline)
                .padding(.bottom, 10)
            
            Button(action: {
                // Oylama sayısını artır
                self.voteCount += 1
                print("Oy Verildi, Yeni Oy Sayısı: \(self.voteCount)")
            }) {
                Text("Oyla")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
    }
}

struct VoteCounter: View {
    var count: Int
    
    var body: some View {
        HStack {
            Text("Oy Sayısı:")
            Text("\(count)")
        }
    }
}
