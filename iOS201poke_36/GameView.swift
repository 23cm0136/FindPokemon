//
//  GameView.swift
//  iOS201poke_36
//
//  Created by cmStudent on 2024/04/30.
//

import SwiftUI

struct GameView: View {
    @StateObject var pokeDataList = PokemonData()
    @State var translationMap: Dictionary<String,String> = [:]
    @State var selectedPokemon: PokemonItem?
    @State var showCorrectMessage = false
    @State var showWrongMessage = false
    
    var body: some View {
        VStack {
            Text("誰〜だ〜?")
                .font(.title)
                .foregroundStyle(.blue)
                .onAppear {
                    Task {
                        await pokeDataList.gamePokemon()
                        selectedPokemon = pokeDataList.pokemonList.randomElement()
                    }
                    loadTranslationMap()
                }
            if let selectedPokemon = selectedPokemon {
                AsyncImage(url: selectedPokemon.bigImage) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                } placeholder: {
                    ProgressView()
                }
                
                List(pokeDataList.pokemonList) {pokemon in
                    Button(action: {
                        if pokemon == selectedPokemon {
                            showCorrectMessage = true
                        } else {
                            showWrongMessage = true
                        }
                    }, label: {
                        Text(translatedName(from: pokemon.name))
                    })
                }
            } else {
                Text("少々お待ちください")
            }
            
            if showCorrectMessage {
                
                Text("Right! 素晴らし！")
                    .foregroundColor(.green)
                    .padding()
                
            } else if showWrongMessage {
                Text("Wrong!\nこれは\" \(translatedName(from: selectedPokemon?.name ?? "")) \"です")
                    .foregroundColor(.red)
                    .padding()
            }
        } // VStack
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

#Preview {
    GameView()
}
