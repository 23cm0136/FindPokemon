//
//  RandomPoke.swift
//  iOS201poke_36
//
//  Created by cmStudent on 2024/04/26.
//

//import Foundation
//
//
//struct PokemonItem: Identifiable { // Identifiable：拥有唯一的ID的项目。使用时可以通过代入UUID，使其id唯一。
//    let id = UUID()
//    let name: String
//    let image: URL
//    let bigImage: URL
//    let cry: URL
//}
//
//
//class PokemonData: ObservableObject {
//    struct Pokemon: Codable {
//        let name: String?
//        let sprites: Sprites?
//        let cries: Cries?
//        
//        struct Cries: Codable {
//            let latest: URL?
//        }
//
//        struct Sprites: Codable {
//            let front_default: URL?
//            let other: Other?
//                
//            struct Other: Codable {
//                let home: Home?
//                    
//                struct Home: Codable {
//                    let front_shiny: URL?
//                }
//            }
//        }
//    }
//    
//    @Published var pokemonList: [PokemonItem] = []
//    
//    func searchPokemon(keyword: String) async { // httpなので、非同期で処理する async追加
//        // 検索キーワードをURLエンコードする
//        guard let keyword_encode = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
//        else {
//            return
//        }
//        // リクエストURLを作る
//        guard let req_url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(keyword_encode)")
//        else {
//            return
//        }
//        
//        do {
//            let(data, _) = try await URLSession.shared.data(from: req_url)
//            // 非同步处理从网站获取数据。原本URLSession会返回一个Data对象和一个URLResponse对象的元组
//            // 只需要data的数据，因此忽略了响应对象。 将网络返回的数据代入了data变量里。
//            let decoder = JSONDecoder() // 试图解析JSON数据
//            let json = try decoder.decode(Pokemon.self, from: data)
//            
//            DispatchQueue.main.async {
//                self.pokemonList.removeAll()
//                
//                if let name = json.name,
//                   let image = json.sprites?.front_default,
//                   let bigImage = json.sprites?.other?.home?.front_shiny,
//                   let cry = json.cries?.latest {
//                    let pokemon = PokemonItem(name: name, image: image, bigImage: bigImage, cry: cry)
//                    self.pokemonList.append(pokemon)
//                }
//            }
//        } catch {
//            print("エラー")
//        }
//    }
//
//    func randomPokemon() async { // httpなので、非同期で処理する async追加
//        DispatchQueue.main.async { // 在主线程上更新数据模型。避免后台更新数据模型。
//            self.pokemonList.removeAll()
//        }
//        
//        for _ in 1...5 {
//            let randomNumber = Int.random(in: 1...1025)
//            await searchPokemon(keyword: "\(randomNumber)")
//            
////            guard let url_encode = String(randomNumber).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
////            else {
////                return
////            }
////            
////            guard let req_url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(url_encode)")
////            else {
////                return
////            }
////            
////            do {
////                let(data, _) = try await URLSession.shared.data(from: req_url)
////                let decoder = JSONDecoder() // 试图解析JSON数据
////                let json = try decoder.decode(ResultJson.self, from: data)
//////                print(json)
////                
////                
////                DispatchQueue.main.async {
////                    if let name = json.name,
////                       let image = json.sprites?.front_default,
////                       let bigImage = json.sprites?.other?.home?.front_shiny,
////                       let cry = json.cries?.latest {
////                        let pokemonNew = RandomPokeItem(name: name, image: image, bigImage: bigImage, cry: cry)
////                        self.randomPokeList.append(pokemonNew)
////                    }
////
////                    print(self.randomPokeList)
////                }
////            } catch {
////                print("エラー")
////            }
//            
//        }
//    }
//}




