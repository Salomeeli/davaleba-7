import Foundation

//1. შექმენით Enum-ი სახელით WeekDay შესაბამისი ქეისებით. დაწერეთ ფუნქცია რომელიც იღებს ამ ენამის ტიპს და ბეჭდავს გადაწოდებული დღე სამუშაოა თუ დასვენების.

enum WeekDay: String{
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    case Sunday
    
    func dayType() -> (String) {
        switch self {
        case.Monday, .Tuesday, .Wednesday, .Thursday, .Friday:
            return "სამუშაო დღე"
        case.Saturday, .Sunday:
            return "დასვენების დღე"
        }
    }
}
print((WeekDay).Monday.dayType())
print((WeekDay).Sunday.dayType())


//2.შექმენით Enum-ი სახელად GialaSquad, რომელიც აღწერს გია სურამელაშვილის ფანკლუბის წევრების დონეებს ქეისებით : “TsigroviManto”, “MoshishvlebuliMkerdi”, “TuGapatio”. შექმენით ფროფერთი GialaSquad-ში, რომელსაც ექნება ინფორმაცია თუ რა ღირს თითოეული დონე თვეში (დონეები დალაგებულია ძვირიდან იაფისაკენ). დაუმატეთ მეთოდი რომელიც დაბეჭდავს თითოეული დონის ფასს

enum GialoSquad {
    case TsigroviManto
    case MoshishvlebuliMkerdi
    case TuGapatio
    
    var price: Int{
        switch self {
        case .TsigroviManto:
            return 299
        case .MoshishvlebuliMkerdi:
            return 199
        case .TuGapatio:
            return 99
        }
    }
    func montlyPayment(){
        print(self.price)
    }
}
var highLevel = GialoSquad.TsigroviManto
highLevel.montlyPayment()

//ვერ გავიგე რატომ არ ბეჭდავს :(

// 3. შექმენით enum-ი Weather შემდეგი ქეისებით, Sunny, Cloudy, Rainy და Snowy. ამ ქეისებს უნდა ჰქონდეს associated value Celsius-ის სახით. დაწერეთ function რომელიც მიიღებს ამ enum-ს, და მოგვცემს რეკომენდაციას რა უნდა ჩავიცვათ შესაბამისი ამინდის მიხედვით.

enum Weather {
    case Sunny(Celsius: Double)
    case Cloudy(Celsius: Double)
    case Rainy(Celsius: Double)
    case Snowy(Celsius: Double)
}
func whatToWear(for recomendation: Weather) {
    switch recomendation {
    case .Sunny(let Celsius) where Celsius > 25:
        print("ჩაიცვი შორტები და მაისური")
    case.Cloudy(let Celsius) where Celsius > 20:
        print("დაიხურე ქუდი")
    case.Rainy(let Celsius) where Celsius > 15:
        print("ჩაიცვი საწვიმარი")
    case.Snowy(let Celsius) where Celsius > 0:
        print("ჩაიცვი ყველაფერი")
    case .Sunny, .Cloudy, .Rainy, .Snowy: break
    }
}
whatToWear(for: .Sunny(Celsius: 27))

//4.შექმენით struct-ი Kanye, ფროფერთებით: album, releaseYear. ამის შემდეგ შექმენით array-ი Kanye-ს ტიპის, ჩაამატეთ რამოდენიმე Kanye-ს ობიექტი, და შეავსეთ მასივი კანიეებით. დაწერეთ ფუნქცია, რომელიც მიიღებს ამ კანიეების მასივს და წელს. ფუნქციამ უნდა დაგვიბრუნოს ყველა ალბომი რომელიც გამოშვებულია

struct Kanye {
    var album: String
    let releaseYear: UInt
}

var arrayOfAlbums: [Kanye] = [
    Kanye(album: "The College Dropout", releaseYear: 2004),
    Kanye(album: "Graduation", releaseYear: 2007),
    Kanye(album: "808s & Heartbreak", releaseYear: 2008),
    Kanye(album: "My Beautiful Dark Twisted Fantasy", releaseYear: 2010)]

for item in arrayOfAlbums {
    item.releaseYear > 2000
    print(item.album)
    
}
//ვიცი, რომ ფუნქცია უნდა :(

//5.შექმენით String-ის ტიპის lazy property wrapper სახელად, cachedData. ინიციალიზება გაუკეთეთ ქლოჟერით რომელიც აბრუნებს სტრინგს მნიშვნელობით “lazy ინიციალიზებულია”. მიწვდით ამ ფროფერთის და დაბეჭდეთ მისი მნიშვნელობა

@propertyWrapper
struct cachedDate {
    lazy var value: String = self.initializer()
    let initializer: () -> String
    init(wrappedValue initializer: @escaping @autoclosure () -> String) {
        self.initializer = initializer
    }
    var wrappedValue: String {
        mutating get {
            value
        }
    }
}
struct someStruct {
    @cachedDate var cachedData: String = "lazy ინიციალიზებულია"
}
var data = someStruct()
print(data.cachedData)


