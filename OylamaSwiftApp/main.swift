import SwiftUI

struct ContentView: View {
    @State private var votedUsers: Set<String> = Set()
    @State private var isAnyBoxSelected: Bool = false

    var body: some View {
        ScrollView {
            VStack(spacing: 70) {
                BoxView(voteData: VoteData(), imageName: "person1", name: "İsim Soyisim 1", votedUsers: $votedUsers, isAnyBoxSelected: $isAnyBoxSelected)
                    .frame(height: 200)
                
                BoxView(voteData: VoteData(), imageName: "person2", name: "İsim Soyisim 2", votedUsers: $votedUsers, isAnyBoxSelected: $isAnyBoxSelected)
                    .frame(height: 200)
                
                BoxView(voteData: VoteData(), imageName: "person3", name: "İsim Soyisim 3", votedUsers: $votedUsers, isAnyBoxSelected: $isAnyBoxSelected)
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
    @State private var voteData: VoteData
    let imageName: String
    let name: String
    @Binding var votedUsers: Set<String>
    @Binding var isAnyBoxSelected: Bool

    init(voteData: VoteData, imageName: String, name: String, votedUsers: Binding<Set<String>>, isAnyBoxSelected: Binding<Bool>) {
        self._voteData = State(initialValue: voteData)
        self.imageName = imageName
        self.name = name
        self._votedUsers = votedUsers
        self._isAnyBoxSelected = isAnyBoxSelected
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(isAnyBoxSelected ? (voteData.isSelected ? Color.green : Color.red) : Color(red: 0.15, green: 0.15, blue: 0.15))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                UserView(imageName: imageName, name: name, voteData: $voteData, votedUsers: $votedUsers, isAnyBoxSelected: $isAnyBoxSelected)
                    .padding()
                    .foregroundColor(.white)
                    .font(.title)
                
                VoteCounter(count: voteData.voteCount)
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
    @Binding var voteData: VoteData
    @Binding var votedUsers: Set<String>
    @Binding var isAnyBoxSelected: Bool
    
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
                // Kullanıcının daha önce oy kullanıp kullanmadığını kontrol et
                if !votedUsers.contains(name) && !isAnyBoxSelected {
                    // Oy sayısını artır
                    voteData.voteCount += 1
                    print("Oy Verildi, Yeni Oy Sayısı: \(voteData.voteCount)")
                    
                    // Kullanıcıyı oy kullandı olarak işaretle
                    votedUsers.insert(name)
                    
                    // Bu Box'ı seçili olarak işaretle
                    voteData.isSelected = true
                    isAnyBoxSelected = true
                } else {
                    
                    print("Bu kullanıcı zaten oy kullandı veya başka bir kutu seçili.")
                }
                
                
            }) {
                Text("Oyla")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(10)
                    .disabled(isAnyBoxSelected) // Butonu pasif yap
                    .opacity(isAnyBoxSelected ? 0.5 : 1.0)
                    .disabled(isAnyBoxSelected)
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

struct VoteData {
    var voteCount: Int = 0
    var isSelected: Bool = false
}
