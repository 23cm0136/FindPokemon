//
//  ContentView.swift
//  iOS201poke_36
//
//  Created by cmStudent on 2024/04/16.
//

import SwiftUI
import AVFoundation


struct ContentView: View {
    
    // OkashiDataを参照する状態変数
//    @StateObject var pokeDataList = PokemonData()
//    @StateObject var randomDataList = PokemonData()
//    @State var selectedPokemon: PokemonItem? = nil
//    @State var translationMap: Dictionary<String,String> = [:]
    // 検索ワードを保持する変数
//    @State var inputText = ""
//    @State var isShowRandom = false
//    @State var isShowSearch = false
//    @State var isShowDatail = false
    
//    let oggURL = URL(string: "https://raw.githubusercontent.com/PokeAPI/cries/main/cries/pokemon/latest/25.ogg")!
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("23CM0136 モンカ")
                    .padding(.bottom)
                Image("pokemonlogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                ZStack {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 120, height: 120)
                    Circle()
                        .fill(Color.indigo.opacity(0.7))
                        .frame(width: 100, height: 80)
                        .overlay(
                            Circle()
                                .stroke(Color.yellow, lineWidth: 5)
                        )
                        .offset(x: 60)
                    Circle()
                        .fill(Color.indigo.opacity(0.7))
                        .frame(width: 100, height: 80)
                        .overlay(
                            Circle()
                                .stroke(Color.yellow, lineWidth: 5)
                        )
                        .offset(x: -60)
                    Circle()
                        .fill(Color.indigo)
                        .frame(width: 100, height: 100)
                    
                    Text("📖 図   鑑 📖")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.yellow)
                }
                .frame(width: 250, height: 80,alignment: .center)
                .padding(.bottom, 30)
                
                NavigationLink(destination: SearchPage()) {
                    Text("検索")
                        .frame(width: 200, alignment: .center)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(50)
                        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 5)
                }
                Text("英語名及びIDで検索する")
                    .padding(.bottom)
                
                NavigationLink(destination: RandomPage()) {
                    Text("ランダム")
                        .frame(width: 200, alignment: .center)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(50)
                        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 5)
                }
                Text("適当に見てみて")
                    .padding(.bottom)
                
                NavigationLink(destination: GameView()) {
                    Text("ミニゲーム")
                        .frame(width: 200, alignment: .center)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(50)
                        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 5)
                }
                Text("画像を見てポケモンを指す")
                    .padding(.bottom)
             
                Button {
                    
                } label: {
                    Text("施工中...")
                        .frame(width: 200, alignment: .center)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.gray.opacity(0.5))
                        .cornerRadius(50)
                        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 5)
                }
                Text("今は荒れ地だ")
            }
        }
    } // bodyView end

//    func translatedName(from name: String) -> String {
//        return translationMap[name] ?? name
//    }
//        
//    func loadTranslationMap() {
//        // 从 JSON 文件加载字典
//        if let url = Bundle.main.url(forResource: "pokemon_name_converter", withExtension: "json") {
//
//            do {
//                let jsonString = try String(contentsOf: url)
//                            
//                let data = jsonString.data(using: .utf8)!
//                
//                let decoder = JSONDecoder()
//                let translationArray = try decoder.decode([Translation].self, from: data)
//                // 将数组转换为字典
//                translationMap = Dictionary(uniqueKeysWithValues: translationArray.map { ($0.en.lowercased(), $0.ja) })
//                //print(translationMap)
//            } catch {
//                print("Error loading translation map: \(error)")
//            }
//        } else {
//            print("Translation map file not found")
//        }
//    }
    
//    func convertOGGtoMP3(oggURL: URL, completion: @escaping (URL?) -> Void) {
//        // 创建 AVAsset
//        let asset = AVURLAsset(url: oggURL)
//            guard let exporter = AVAssetExportSession(asset: asset, presetName: AVAssetExportPresetAppleM4A) else {
//                completion(nil)
//                return
//        }
//        
//        // 设置输出文件路径
//        let outputURL = FileManager.default.temporaryDirectory.appendingPathComponent("audio.m4a")
//        print("Output file URL:", outputURL)
//            exporter.outputURL = outputURL
//            exporter.outputFileType = .m4a
//        
//        // 开始转换
//        exporter.exportAsynchronously {
//            switch exporter.status {
//                case .completed:
//                    print("Export completed successfully.")
//                    completion(outputURL)
//                case .failed:
//                    print("Export failed with error:", exporter.error ?? "Unknown error")
//                    completion(nil)
//                case .cancelled:
//                    print("Export cancelled.")
//                    completion(nil)
//                default:
//                    print("Export status:", exporter.status.rawValue)
//                    completion(nil)
//                }
//        }
//    }
    
    
} // ContentView end





struct SearchPage: View {
    @State var inputText = ""
    @StateObject var pokeDataList = PokemonData()
    @State var translationMap: Dictionary<String,String> = [:]
    
    
    var body: some View {
        VStack {
            Text("直接入力 ポケモン検索")
//                .frame(alignment: .center)
                .font(.title)
                .padding()
//                .background(Color.blue.opacity(0.4))
            TextField("検索", text: $inputText, prompt: Text("英語の名前 及び ID を入力してください"))
                .onSubmit { // 入力した後の動き
                    // Taskは非同期で処理を実行できる
                    loadTranslationMap()
                    pokeDataList.pokemonList.removeAll()
                    Task {
                        await pokeDataList.searchPokemon(keyword:inputText)
                    } // Task end
                } // Submit end
                .submitLabel(.search)
                .padding()
            
            List (pokeDataList.pokemonList) { pokemon in
                VStack {
                    AsyncImage(url: pokemon.bigImage) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 200)
                    } placeholder: {
                        ProgressView()
                    }
                    HStack {
                        AsyncImage(url: pokemon.image) { image in // 读取完毕显示的内容
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 40)
                        } placeholder: { // 读取中显示的内容
                            ProgressView()
                        }
                        Text(translatedName(from: pokemon.name))
                    } // HStack
                    
                }
            } // List
            
        }
    }
    
    func translatedName(from name: String) -> String {
        return translationMap[name] ?? name
    }
        
    func loadTranslationMap() {
        // 从 JSON 文件加载字典
        if let url = Bundle.main.url(forResource: "pokemon_name_converter", withExtension: "json") {

            do {
                let jsonString = try String(contentsOf: url)
                            
                let data = jsonString.data(using: .utf8)!
                
                let decoder = JSONDecoder()
                let translationArray = try decoder.decode([Translation].self, from: data)
                // 将数组转换为字典
                translationMap = Dictionary(uniqueKeysWithValues: translationArray.map { ($0.en.lowercased(), $0.ja) })
                //print(translationMap)
            } catch {
                print("Error loading translation map: \(error)")
            }
        } else {
            print("Translation map file not found")
        }
    }
}

struct RandomPage: View {
    @StateObject var randomDataList = PokemonData()
    @State var selectedPokemon: PokemonItem? = nil
    @State var translationMap: Dictionary<String,String> = [:]
    @State var isShowDatail = false
        
    var body: some View {
        NavigationStack {
            NavigationLink {
                if let selectedPokemon = selectedPokemon {
                    DetailView(pokemon: selectedPokemon)
                }
            } label: {
                List(randomDataList.pokemonList) { pokemon in
                    
                    HStack {
                        AsyncImage(url: pokemon.image) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 40)
                        } placeholder: {
                            ProgressView()
                        }
                        .onTapGesture {
                            print("AsyncImage onTapGesture")
                            isShowDatail = false
                        }
                        Text(translatedName(from: pokemon.name))
                            .onTapGesture {
                                print("pokename押した")
                                isShowDatail = true
                                selectedPokemon = pokemon
                                print(isShowDatail)
                                print(selectedPokemon ?? "no Item")
                            }
                    }
                }
            }
            
        }
        .onAppear {
            Task {
                await randomDataList.randomPokemon()
            }
            loadTranslationMap()
        }
    }
    
    func translatedName(from name: String) -> String {
        return translationMap[name] ?? name
    }
        
    func loadTranslationMap() {
        // 从 JSON 文件加载字典
        if let url = Bundle.main.url(forResource: "pokemon_name_converter", withExtension: "json") {

            do {
                let jsonString = try String(contentsOf: url)
                            
                let data = jsonString.data(using: .utf8)!
                
                let decoder = JSONDecoder()
                let translationArray = try decoder.decode([Translation].self, from: data)
                // 将数组转换为字典
                translationMap = Dictionary(uniqueKeysWithValues: translationArray.map { ($0.en.lowercased(), $0.ja) })
                //print(translationMap)
            } catch {
                print("Error loading translation map: \(error)")
            }
        } else {
            print("Translation map file not found")
        }
    }
}

struct DetailView: View {
    let pokemon: PokemonItem
//    let soundURL: URL
    
    var body: some View {
        VStack {
            AsyncImage(url: pokemon.bigImage) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            Link("Cry音声のリンク", destination: pokemon.cry)
//            .onAppear {
////                let player = AVPlayer(url: soundURL)
//                do {
//                    let url_1 = URL(string: "https://raw.githubusercontent.com/PokeAPI/cries/main/cries/pokemon/latest/25.ogg")
//                    let audioPlayer = try AVAudioPlayer(contentsOf: url_1!)
//                    audioPlayer.play()
//                } catch {
//                    print("音声エラー")
//                }
//            }
        }.onAppear{print("DetailView: \(pokemon)")}
    }
    
}

struct Translation: Codable {
    let num: Int
    let ja: String
    let en: String
}

#Preview {
    ContentView()
}
