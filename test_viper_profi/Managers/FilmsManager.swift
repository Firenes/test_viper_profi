//
//  BooksManager.swift
//  test_viper_profi
//
//  Created by Nikita Shumilin on 26.10.2021.
//

import Foundation

class FilmsManager {
    static var shared: FilmsManager = {
        let um = FilmsManager()
        return um
    }()
    
    var films: [Films] = [
        Films(id: "1", title: "Дом, который построил Джек", description: "", director: "Ларс фон Триер", country: "Дания, Франция", year: 2018, image: nil, isFavorite: false),
        Films(id: "2", title: "Догвилль", description: "", director: "Ларс фон Триер", country: "Дания, Нидерланды", year: 2003, image: nil, isFavorite: false),
        Films(id: "3", title: "Антихрист", description: "", director: "Ларс фон Триер", country: "Дания, Германия", year: 2009, image: nil, isFavorite: false),
        Films(id: "4", title: "Трудно быть Богом", description: "", director: "Алексей Герман", country: "Россия", year: 2013, image: nil, isFavorite: false),
        Films(id: "5", title: "Хрусталёв, машину!", description: "", director: "Алексей Герман", country: "Россия, Франция", year: 1998, image: nil, isFavorite: false),
        Films(id: "6", title: "Андрей Рублёв", description: "", director: "Андрей Тарковский", country: "СССР", year: 1966, image: nil, isFavorite: false),
        Films(id: "7", title: "Сталкер", description: "", director: "Андрей Тарковский", country: "СССР", year: 1979, image: nil, isFavorite: false),
        Films(id: "8", title: "Жертвоприношение", description: "", director: "Андрей Тарковский", country: "СССР", year: 1986, image: nil, isFavorite: false),
        Films(id: "9", title: "Ностальгия", description: "", director: "Андрей Тарковский", country: "СССР", year: 1983, image: nil, isFavorite: false),
        Films(id: "10", title: "Убийство священного олена", description: "", director: "Йоргос Лантимос", country: "Ирландия, Великобритания", year: 2017, image: nil, isFavorite: false),
        Films(id: "11", title: "Лобстер", description: "", director: "Йоргос Лантимос", country: "Ирландия, Великобритания", year: 2015, image: nil, isFavorite: false),
        Films(id: "12", title: "Гнев человеческий", description: "", director: "Гай Ричи", country: "Великобритания", year: 2021, image: nil, isFavorite: false),
        Films(id: "13", title: "Джентельмены", description: "", director: "Гай Ричи", country: "Великобритания", year: 2019, image: nil, isFavorite: false),
        Films(id: "14", title: "Большой куш", description: "", director: "Гай Ричи", country: "Великобритания, США", year: 2000, image: nil, isFavorite: false),
        Films(id: "15", title: "Карты, деньги, два ствола", description: "", director: "Гай Ричи", country: "Великобритания", year: 1998, image: nil, isFavorite: false)
    ]
    
    func fetchData(сompletion: ([Films]) -> ()) {
        сompletion(films)
    }
    
    func setFavorite(id: String, _ isFavorite: Bool, completion: () -> ()) {
        films.indices.forEach { index in
            if films[index].id == id {
                films[index].isFavorite = isFavorite
                completion()
                return
            }
        }
    }
}
