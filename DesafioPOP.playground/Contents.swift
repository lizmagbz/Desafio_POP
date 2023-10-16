import UIKit

// Representa um vehiculo
protocol Vehicle {
    var brand: String { get set }
    var model: String { get set }
    
    func start() // inicio do motor do vehiculo
    
    func stop() // parada do motor do vehiculo
    
    func description() -> String
}

// Estruturas Car, Motorcycle e Bicycle conforme ao protocolo Vehicle
struct Car: Vehicle {
    var brand: String
    var model: String
    var numDoors: Int
    
    func start() {
        print("Ligando o motor do carro \(brand) \(model)...")
    }
    
    func stop() {
        print("Desligando o motor do carro \(brand) \(model)...")
    }
    
    func description() -> String {
        return "Marca: \(brand), Modelo: \(model), Número de Portas: \(numDoors)"
    }
}

struct Motorcycle: Vehicle {
    var brand: String
    var model: String
    var engineCapacity: Int
    
    func start() {
        print("Ligando o motor da moto \(brand) \(model)...")
    }
    
    func stop() {
        print("Desligando o motor da moto \(brand) \(model)...")
    }
    
    func description() -> String {
        return "Marca: \(brand), Modelo: \(model), Capacidade do Motor: \(engineCapacity)"
    }
}

struct Bicycle: Vehicle {
    var brand: String
    var model: String
    var numGears: Int
    
    func start() {
        print("Pedalando a bicicleta \(brand) \(model)...")
    }
    
    func stop() {
        print("Parando a bicicleta \(brand) \(model)...")
    }
    
    func description() -> String {
        return "Marca: \(brand), Modelo: \(model), Número de Marchas: \(numGears)"
    }
}

// Representa o tipo do vehiculo.
enum VehicleType {
    case Car
    case Motorcycle
    case Bicycle
}

// Lista de vehiculos de diferentes tipos.
class VehicleManager {
    var vehicles: [Vehicle] = []
    
    // Adicionando um vehiculo a lista.
    func addVehicle(vehicle: Vehicle) {
        vehicles.append(vehicle)
    }
    
    // Lista os vehiculos de um tipo específico.
    func listVehicles(ofType type: VehicleType) {
        for vehicle in vehicles {
            switch type {
            case .Car:
                if vehicle is Car {
                    print(vehicle.description())
                }
            case .Motorcycle:
                if vehicle is Motorcycle {
                    print(vehicle.description())
                }
            case .Bicycle:
                if vehicle is Bicycle {
                    print(vehicle.description())
                }
            }
        }
    }
    
    // Lista todos os vehiculos da lista.
    func startAllVehicles() {
        for vehicle in vehicles {
            vehicle.start()
        }
    }
    
    // Desliga todos os vehiculos da lista
    func stopAllVehicles() {
        for vehicle in vehicles {
            vehicle.stop()
        }
    }
}

// Exemplo de uso
let car1 = Car(brand: "Honda", model: "Civic", numDoors: 4)
let car2 = Car(brand: "Toyota", model: "Corolla", numDoors: 4)
let motorcycle = Motorcycle(brand: "Harley-Davidson", model: "Sportster", engineCapacity: 1200)
let bicycle = Bicycle(brand: "Trek", model: "FX", numGears: 21)

let manager = VehicleManager()
manager.addVehicle(vehicle: car1)
manager.addVehicle(vehicle: car2)
manager.addVehicle(vehicle: motorcycle)
manager.addVehicle(vehicle: bicycle)

manager.listVehicles(ofType: .Car)
manager.listVehicles(ofType: .Motorcycle)
manager.listVehicles(ofType: .Bicycle)

manager.startAllVehicles()
manager.stopAllVehicles()
