//
//  Constants.swift
//  FoodHub
//
//  Created by Bhavesh Sharma on 13/03/21.
//

import Foundation

class Constants{
    
    static let foodList:[FoodData] =
        [
            FoodData(img: "redsauce", name: "Red Sauce Pasta", calories: "260", price: 12.5, detail: "Pasta is a type of food typically made from an unleavened dough of wheat flour mixed with water or eggs, and formed into sheets or other shapes, then cooked by boiling or baking."),
            FoodData(img: "pizza2", name: "Pizza", calories: "1200", price: 15.99, detail: "Pizza is a type of food typically made from an unleavened dough of wheat flour mixed with water or eggs, and formed into sheets or other shapes, then cooked by boiling or baking."),
            FoodData(img: "white-sauce-pasta", name: "White Sauce Pasta", calories: "400", price: 4.97, detail: "This white sauce is also known as béchamel sauce and has it's origin in French cuisine. Classic béchamel sauce is made with butter, flour and milk. For this pasta, I add cream and this pasta is super cheesy and creamy, just like my family likes it. So this sauce is kind of a mix between alfredo and béchamel."),
            FoodData(img: "noodles", name: "Noodles", calories: "219", price: 5.25, detail: "Noodles are a type of food made from unleavened dough which is rolled flat and cut, stretched or extruded, into long strips or strings."),
            FoodData(img: "sandwich", name: "Sandwich", calories: "266", price: 4.29, detail: "A sandwich is a food typically consisting of vegetables, sliced cheese or meat, placed on or between slices of bread, or more generally any dish wherein bread serves as a container or wrapper for another food type."),
            FoodData(img: "sushi", name: "Sushi", calories: "250 ", price: 12.99, detail: "Sushi (すし, 寿司, 鮨, pronounced [sɯɕiꜜ] or [sɯꜜɕi]) is a traditional Japanese dish of prepared vinegared rice (鮨飯, sushi-meshi), usually with some sugar and salt, accompanying a variety of ingredients (ネタ, neta), such as seafood, often raw, and vegetables."),
            FoodData(img: "hotdog", name: "Hot dog", calories: "290 ", price: 25, detail: "A hot dog (also spelled hotdog) is a food consisting of a grilled or steamed sausage served in the slit of a partially sliced bun. It can also refer to the sausage itself. The sausage used is a wiener (Vienna sausage) or a frankfurter (Frankfurter Würstchen, also just called frank)."),
            FoodData(img: "tomato-and-basil-bruschetta", name: "Tomato and Basil bruschetta", calories: "17", price: 70, detail: "Tomato bruschetta is one of the best Italian appetizers. Its recipe includes just bread, tomato, olive oil, basil and garlic: their tastes and colors bring to the mind the Classical Age, a time of long past when Roman merchant ships crossed the Mediterranean sea, carrying jars full of wheat and wine."),
            FoodData(img: "poutine", name: "Poutine", calories: "513", price: 3.99, detail: "Poutine, a Canadian dish made of french fries topped with cheese curds and gravy. It first appeared in 1950s rural Québec snack bars and was widely popularized across Canada and beyond in the 1990s. It has become a symbol of Québécois and Canadian cuisine and culture."),
            FoodData(img: "bannock", name: "Bannock", calories: "309", price: 15, detail: "Delicious and versatile, bannock is a simple bread that was once a key staple in the diets of Canada’s Aboriginal people. Modern takes on bannock include baked versions (which are heavy/dense) and fried versions (which are crispy and fluffy on the inside). In recent years, bannock has seen a surge in popularity, with new twists and variations popping up in bakeries and cafes nationwide – you have to try it!"),
            FoodData(img: "Nova Scotian Lobster Rolls", name: "Nova Scotian Lobster Rolls", calories: "600", price: 20, detail: "Canada is a massive country, with spectacular seafood from coast to coast. Not-to-be-missed experiences include Atlantic and Pacific salmon, smoked salmon, arctic char, and of course, East Coast lobsters. Nova Scotian lobster rolls are a Canadian favourite.!"),
            FoodData(img: "Saskatoon berry pie", name: "Saskatoon berry pie", calories: "85", price: 18, detail: "The Saskatoon berry is often described as having a sweet and almondy flavour, which makes it an ideal candidate for the perfect pie. Truly, a slice of this will change your life. It’s no wonder the city of Saskatoon was actually named after it, rather than the other way around."),
            FoodData(img: "Peameal Bacon", name: "Peameal Bacon", calories: "157", price: 13.25, detail: "This special Canadian twist on bacon is made from lean boneless pork loin, which is trimmed, wet-cured and then rolled in cornmeal, giving it its distinctive yellow crust. It’s juicier than American-style bacon, but also leaner and, some might say, more delicious."),
            FoodData(img: "Split Pea Soup", name: "Split Pea Soup", calories: "61", price: 5, detail: "Ah, comfort food at its finest. With Québécois origins, split pea soup is traditionally composed of peas, pork and herbs blended together for pure, creamy deliciousness. A bowl of this will get you through the tough Canadian winters!"),
        ]
    
    static let timHortan = [
        FoodData(img: "originalblendcoffee", name: "Original Blend Coffee", calories: "120", price: 5.5, detail: "A true classic - our Original Blend is rich, smooth, delicious and ready to brew in convenient K-Cup® pods for your Keurig® brewer."),
        FoodData(img: "specialitytea", name: "Tea", calories: "100", price: 3.5, detail: "A true classic Tea - our Original Blend is rich, smooth, delicious and ready to brew in convenient K-Cup® pods for your Keurig® brewer."),
        FoodData(img: "originalbreakfastwrap", name: "Wrap", calories: "400", price: 9.5, detail: "A true classic Wrap - our Original Blend is rich, smooth, delicious and ready to brew in convenient K-Cup® pods for your Keurig® brewer."),
        FoodData(img: "hotchoclate", name: "Hot Choclate", calories: "500", price: 5.5, detail: "A hot choclate - our Original Blend is rich, smooth, delicious and ready to brew in convenient K-Cup® pods for your Keurig® brewer."),
        FoodData(img: "latte", name: "Latte", calories: "300", price: 10.5, detail: "Latte true classic Coffee - our Original Blend is rich, smooth, delicious and ready to brew in convenient K-Cup® pods for your Keurig® brewer."),
        FoodData(img: "baconroll", name: "baconroll", calories: "600", price: 20.5, detail: "A true classic Wrap - our Original Blend is rich, smooth, delicious and ready to brew in convenient K-Cup® pods for your Keurig® brewer."),
        FoodData(img: "caramelmacchiato", name: "Caramel macchiato", calories: "220", price: 9.5, detail: "Caramel macchiato - our Original Blend is rich, smooth, delicious and ready to brew in convenient K-Cup® pods for your Keurig® brewer."),
        FoodData(img: "darkroastcoffee", name: "Dark roast coffee", calories: "350", price: 11.5, detail: "Dark roast coffee A true classic Coffee - our Original Blend is rich, smooth, delicious and ready to brew in convenient K-Cup® pods for your Keurig® brewer."),
    ]
    
    static let ZenCourtyard = [
        FoodData(img: "goong", name: "Goong Hom Sabai", calories: "120", price: 35.5, detail: "Deep fried noodles wrapped prawns."),
        FoodData(img: "tord", name: "Tord Man Pla", calories: "300", price: 43.5, detail: "Thai fish cake, fresh fish on the table."),
        FoodData(img: "gai", name: "Gai Sai Takrai", calories: "400", price: 39.5, detail: "Crisp fried chicken with lemon grass."),
        FoodData(img: "sambal", name: "Sambal balado", calories: "500", price: 5.5, detail: "Indonesian crisp fried beef."),
        FoodData(img: "kae", name: "Kae phad prik", calories: "300", price: 10.5, detail: "Lamb with oyster sauce and chili."),
        FoodData(img: "latte", name: "Latte", calories: "300", price: 10.5, detail: "Latte true classic Coffee - our Original Blend is rich, smooth, delicious and ready to brew in convenient K-Cup® pods for your Keurig® brewer."),
    ]
    
    static let piazza = [
        FoodData(img: "originallapiazapizza",name: "The Original La Piazza Pizza",calories: "450",price: 10.99,detail: "Tomato, mozzarella, sun dried tomato, basil pesto, roasted garlic, goats cheese, oregano."),
        
        FoodData(img: "pepproni",name: "Pepperoni Pizza",calories: "500",price: 12.99,detail: "Pork, tomato, mozzarella, pepperoni, chilli oil, oregano."),
        
        FoodData(img: "pennyarrabiataa",name: "Penne Arrabiata",calories: "300",price: 9.99,detail: "Tomato sauce, garlic, chilli, parsley."),
        
        FoodData(img: "spaghetti",name: "Spaghetti Aglio Olio E Peperoncino",calories: "150",price: 7.99,detail: "[Vegan] Garlic, extra virgin olive oil, chilli, parsley."),
        
        FoodData(img: "lasagna",name: "Lasagna Di Pasta Fresca Al Ragu Di Agnello",calories: "200",price: 8.99,detail: "Lamb Lasagne."),
        
        FoodData(img: "pennybascila",name: "Penne Al Pomodoro Fresco E Basilica",calories: "100",price: 10.99,detail: "Lamb Lasagne."),
    ]
    
    static let cakery = [
        FoodData(img: "frostbrownie", name: "Froast Brownie", calories: "150", price: 4.5, detail: "Pair it with the Best Brownie Recipe and you will be in heaven! The Perfect."),

        FoodData(img: "whoopie", name: "Chocolate Chip Whoopie Pie", calories: "386", price: 5.99, detail: "These sweet treats combine the cream-filled goodness of whoopie pies with the classic flavors of chocolate chip cookies."),

      FoodData(img: "saltedcaramel", name: "Salted Caramel Brownie", calories: "386", price: 4.99, detail: "These salted caramel brownies feature a homemade caramel sauce and are insanely fudgy."),
        
        FoodData(img: "sandwich", name: "Sandwich", calories: "266", price: 4.29, detail: "A sandwich is a food typically consisting of vegetables, sliced cheese or meat, placed on or between slices of bread, or more generally any dish wherein bread serves as a container or wrapper for another food type."),
     ]
    
    static let resaturantList:[RestaurantData] = [
        RestaurantData(img: "tim", name: "Tim Horton", rating: "4.2", dishes: "Canadian",foodList: timHortan),
        RestaurantData(img: "la-piazza", name: "La Piazza", rating: "3.8", dishes: "Italian",foodList: piazza),
        RestaurantData(img: "red-zen", name: "Red ZenCourtyard", rating: "4.8", dishes: "Thai ,Indonesian",foodList: ZenCourtyard),
        RestaurantData(img: "baton", name: "Baton Rouge", rating: "5.0", dishes: "Indian, Italian",foodList: foodList.shuffled()),
        RestaurantData(img: "cakery", name: "The bill chill cakery", rating: "3.2", dishes: "Indian, German",foodList: cakery),
        RestaurantData(img: "le-cirque", name: "Le cirque", rating: "4.1", dishes: "Indian, Thai, Chinese",foodList: foodList),
    ]
        
    static let LOCAL_DATA = "LOCAL_DATA"
    
}


