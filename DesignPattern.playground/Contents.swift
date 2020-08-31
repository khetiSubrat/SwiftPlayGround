import UIKit
import EventKit

var str = "Hello, playground"

// SOLID Principle

protocol SwitchOperation {
    func turnOff()
    func turnOn()
}

protocol ModeOperation {
    func changeMode()
}

protocol FanSpeedOperation {
    func controlWindSpeed()
}

protocol Humidable {
    func changeHumidity(_ value: Int)
}

class HumidityController: Humidable {
    func changeHumidity(_ value: Int) {
        print("You have change the value")
    }
}

class Switch:SwitchOperation {
    func turnOff() {
        
    }
    func turnOn() {
        print("Fan is switched on")
    }
}

class Mode: ModeOperation {
    func changeMode() {
        
    }
}

class FanSpeed: FanSpeedOperation {
    func controlWindSpeed() {
        
    }
}


typealias ProtocolOperation = SwitchOperation & ModeOperation & FanSpeedOperation


class AirconditionNew: ProtocolOperation {
    let modeController: Mode
    let fansSpeedController:FanSpeed
    let switchController:Switch
    
    
    init(mode: Mode, fanSpeed: FanSpeed, swi: Switch) {
        self.modeController = mode
        self.fansSpeedController = fanSpeed
        self.switchController = swi
        
    }
    
    func turnOff() {
        switchController.turnOff()
    }
    
    func turnOn() {
        switchController.turnOn()
    }
    
    func changeMode() {
        modeController.changeMode()
    }
    
    func controlWindSpeed() {
        fansSpeedController.controlWindSpeed()
    }

}



let a = AirconditionNew(mode: Mode(), fanSpeed: FanSpeed(), swi: Switch())
a.turnOn()

// Dependency Inversion Principle

protocol DataBase {
    func saveConversation(conversation: Any)
}

class CoreDataBase {
    let dataBaseController: DataBase
    init(dataBaseController: DataBase ) {
        self.dataBaseController =  dataBaseController
    }
    func saveConversation() {
        let conversation = [Any]()
        self.dataBaseController.saveConversation(conversation: conversation)
    }
}


class CoreDataController: DataBase {
    func saveConversation(conversation: Any) {
        print("Conversation is Saved")
    }
}

let coreDataBase = CoreDataBase(dataBaseController: CoreDataController())
coreDataBase.saveConversation()


// Factory Design Pattern

/*The Factory Method is one of the more useful creational patterns out there. It typically involves a “Factory” object that produces a variety of "products." Product objects are all related—either through sharing a parent class, or conforming to the same protocol. The Factory object contains all the logic that allows it to instantiate the correct product to return to the caller.

Use Cases

As usual, we point out a few signs that indicate when the pattern should apply.

There exists several, similar objects: they share a parent class or conform to the same protocol
A decision is to be made about which of these objects to instantiate*/

// Abstract the process of object creation

protocol Toy {
    func play()
}

class Train: Toy {
    func play() {
        print("Playing a Train")
    }
}

class Ball: Toy {
    func play() {
        print("Playing a Ball")
    }
}


class TrainFactory {
    static func productToy(_ age: Int) -> Toy {
        switch age {
        case 0...6:
            return Train()
        case 7...10:
            return Ball()
        default:
            return Ball()
        }
    }
}

var toy = TrainFactory.productToy(6)
toy.play()
toy = TrainFactory.productToy(10)
toy.play()


protocol Login {
    func doLogin(where userName: String, password: String)
}

class FBLogin:Login {
    func doLogin(where userName: String, password: String) {
        print("The username for FB \(userName)")
    }
}

class TwitterLogin:Login {
    func doLogin(where userName: String, password: String) {
        print("The username for Twitter \(userName)")
    }
}


class FactoryLogin {
    static func whichLoginToReturn(_ type: String)->Login {
        if type == "FaceBook" {
            return FBLogin()
        }
        return TwitterLogin()
    }
}

var loginObject = FactoryLogin.whichLoginToReturn("FaceBook")
loginObject.doLogin(where: "Subrat", password: "124")
loginObject = FactoryLogin.whichLoginToReturn("Twitter")
loginObject.doLogin(where: "Subrat", password: "1234")

// Dercorator
protocol Beverage {
    func cost() -> Double
    func description() -> String
}

class Cofee: Beverage {
    func cost() -> Double {
        return 5.0
    }
    
    func description() -> String {
        return "Cofee"
    }
}

class Whimp: Beverage {
    let beverage: Beverage
    init(beverage: Beverage) {
        self.beverage = beverage
    }
    func cost() -> Double {
        return 10 + self.beverage.cost()
    }
    
    func description() -> String {
        return self.beverage.description() + "Whimp"
    }
}

var darkRoast: Beverage = Cofee()
darkRoast =  Whimp(beverage: darkRoast)

darkRoast.description()
darkRoast.cost()


//MARK: Adapter Design Pattern


enum AppDirectories : String {
    case Documents = "Documents"
    case Temp = "tmp"
}
 
protocol AppDirectoryNames {
    func documentsDirectoryURL() -> URL
    
    func tempDirectoryURL() -> URL
}
 
extension AppDirectoryNames {
    func documentsDirectoryURL() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    func tempDirectoryURL() -> URL {
        return FileManager.default.temporaryDirectory
    }
}



protocol EnemyAttacker {
    func fireWeapon()
    func driveFwd()
    func assignDriver()
}


struct MyClass:EnemyAttacker {
    func fireWeapon() {
        
    }
    
    func driveFwd() {
        
    }
    
    func assignDriver() {
        
    }
}


struct EnmeyAdapter : EnemyAttacker {
    var enemyRouter:EnemyReacteor
    
    init(enemy: EnemyReacteor) {
        self.enemyRouter = enemy
    }
    func fireWeapon() {
        self.enemyRouter.smashWithHead()
    }
    
    func driveFwd() {
        self.enemyRouter.walkFwd()
    }
    
    func assignDriver() {
        self.enemyRouter.reactToHuman()
    }
    
}

struct EnemyReacteor {
    func smashWithHead() {
        
    }
    
    func walkFwd() {
        
    }
    func reactToHuman() {
        
    }
}

let enemyAdapter = EnmeyAdapter(enemy: EnemyReacteor())


protocol Jump {
    func jumping()
    var numberLegs: Int {get set}
}

struct Dog: Jump {
    var numberLegs: Int
    
    
    func jumping() {
        
    }
    
    
}

struct Cow: Jump {
    var numberLegs: Int
    
    func jumping() {
        
    }
    
    
}

struct Frog {
    var fleg = 2
    func leap() {
        
    }
}


class JumpAdapter: Jump {
    var numberLegs: Int
    

    private let frog: Frog
    
    init(frog: Frog) {
        self.frog = frog
        self.numberLegs = frog.fleg
    }
    
    func jumping() {
        frog.leap()
    }
}
// MVVM

/*final class HomeViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet private weak var titleLabel: UILabel!

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions

    @IBAction func buttonTouchUp(_ sender: Any) {
         titleLabel.text = "toto"
    }
}*/

final class HomeViewController: UIViewController {

    // MARK: - public var

    var viewModel: HomeViewModel!

    // MARK: - Outlets

    @IBOutlet private weak var titleLabel: UILabel!

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        bind(to: viewModel)
        
        viewModel.addObserver(self,
                              forKeyPath: "title",
                              options: .new,
                              context: nil)

        viewModel.viewDidLoad()
    }

    // MARK: - Private func

    private func bind(to viewModel: HomeViewModel) {
        viewModel.titleText = { [weak self] title in
            self?.titleLabel.text = title
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        // if keyPath ==
    }

    // MARK: - Actions

    @IBAction func buttonTouchUp(_ sender: Any) {
         viewModel.buttonDidPress()
    }
}

@objc final class HomeViewModel: NSObject {

    // MARK: - Private properties

    @objc private let title: String

    // MARK: -  Initializer

    init(title: String) {
        self.title = title
    }

    // MARK: - Outputs

    var titleText: ((String) -> Void)?

    // MARK: - Inputs

    func viewDidLoad() {
        titleText?("")
    }

    func buttonDidPress() {
        titleText?(title)
    }
}


// Sample Observer

protocol Observe {
    func upddate()
}

class Observer: Observe {
    var id: String
    init(id: String) {
        self.id = id
    }
    func upddate() {
        print(self.id + " notify")
    }
}

class Subject {
    var observer: [Observer]?
    
    var state: String {
        didSet {
            self.notify()
        }
    }
    
    init(state: String) {
        self.observer = [Observer]()
        self.state = state
    }
    
    func add(observer: Observer) {
        self.observer?.append(observer)
    }
    
    func notify() {
        for o in self.observer! {
            o.upddate()
        }
    }
}

let ob1 = Observer(id: "First Observer")
let ob2 = Observer(id: "Second Observer")

let subject = Subject(state: "No change")
subject.add(observer: ob1)
subject.add(observer: ob2)

subject.state = "Some change"

// Adapter

protocol NewAngel {
    var angleV: Double { get }
    var angleH: Double { get }
}

struct OldAngle {
    let angleHorizontal: Float
    let angleVertical: Float

    init(angleHorizontal: Float, angleVertical: Float) {
        self.angleHorizontal = angleHorizontal
        self.angleVertical = angleVertical
    }
}

struct NewDeathStarSuperlaserTarget: NewAngel {

    private let target: OldAngle

    var angleV: Double {
        return Double(target.angleVertical)
    }

    var angleH: Double {
        return Double(target.angleHorizontal)
    }

    init(_ target: OldAngle) {
        self.target = target
    }
}




struct Worker {
    var name: String
    var department: String
}


protocol WorkerDataSource {
    var worker: [Worker] { get}
    func searchby(name: String) -> [Worker]
    func searchIn(department: String) -> [Worker]
}


class DataSourceBase: WorkerDataSource {
    var worker: [Worker] = [Worker]()
  
    func searchby(name: String) -> [Worker] {
        
        let result = self.worker.filter({(w: Worker)->(Bool) in
            if w.name == name {
                return true
            }
            
            return false
        })
        return result
    }
    
    func searchIn(department: String) -> [Worker] {
        let result = self.worker.filter({(w: Worker)->(Bool) in
            if w.department == department {
                return true
            }
            
            return false
        })
        return result
    }
    
    
}

class AssemblyDataSource: DataSourceBase {
    
    override init() {
        super.init()
        let w1 =  Worker(name: "Subrat", department: "cs")
        let w2 =  Worker(name: "Kanchan", department: "mba")
        
        worker.append(w1)
        worker.append(w2)
        
    }
}

class ProductionDataSource: DataSourceBase {
    override init() {
        super.init()
           let w1 =  Worker(name: "Subrat1", department: "cs1")
           let w2 =  Worker(name: "Kanchan1", department: "mba1")
           
            worker.append(w1)
            worker.append(w2)
    }
}




// MARK: Decorator

protocol Transporting {
  func getSpeed() -> Double
  func getTraction() -> Double
}

final class RaceCar: Transporting {
  private let speed = 10.0
  private let traction = 10.0
  
  func getSpeed() -> Double {
    return speed
  }
  
  func getTraction() -> Double {
    return traction
  }
}

let raceCar = RaceCar()
let defaultSpeed = raceCar.getSpeed()
let defaultTraction = raceCar.getTraction()


// Abstract Decorator
class TireDecorator: Transporting {
  // 1
  private let transportable: Transporting
  
  init(transportable: Transporting) {
    self.transportable = transportable
  }
  
  // 2
  func getSpeed() -> Double {
    return transportable.getSpeed()
  }
  
  func getTraction() -> Double {
    return transportable.getTraction()
  }
}


class OffRoadTireDecorator: Transporting {
  private let transportable: Transporting
  
  init(transportable: Transporting) {
    self.transportable = transportable
  }
  
  func getSpeed() -> Double {
    return transportable.getSpeed() - 3.0
  }
  
  func getTraction() -> Double {
    return transportable.getTraction() + 3.0
  }

}


// Create Race Car
let defaultRaceCar = RaceCar()
defaultRaceCar.getSpeed() // 10
defaultRaceCar.getTraction() // 10

// Modify Race Car
let offRoadRaceCar = OffRoadTireDecorator(transportable: defaultRaceCar)
offRoadRaceCar.getSpeed() // 7
offRoadRaceCar.getTraction() // 13


//Provides a dynamic way of changing object behavior through wrappers.
//Decorators share a base type with core objects, making them indistinguishable (and interchangeable) in our system. This allows usage without breaking client-side code.
//Multiple decorators can be applied to create a complex chain of behaviors.
//The order in which decorators are applied may change the final output.


protocol MacBook {
    var cost : Double { get }
    var description : String { get }
}

class MacBookAir : MacBook {
    
    var cost: Double {
        get {
            return 999
        }
    }
    
    var description: String {
        get {
            return "MacBook Air"
        }
    }
    
}

class MacBookDecorator : MacBook {

    var cost: Double {
        get {
            return mbInstance.cost
        }
    }
    
    var description: String {
        get {
            return mbInstance.description
        }
    }
    
    let mbInstance : MacBook
    
    required init(macbook: MacBook) {
        self.mbInstance = macbook
    }
}

final class ProcessorUpgrade : MacBookDecorator {
    
    override var cost: Double {
        get {
            return mbInstance.cost + 499
        }
    }
    
    override var description: String {
        get {
            return mbInstance.description + ", i7 Processor"
        }
    }
    
    required init(macbook: MacBook) {
        super.init(macbook: macbook)
    }
    
}

let m = MacBookAir()
let p = ProcessorUpgrade(macbook: m)
print("The value is \(p.cost)")


// MARK: State Design Pattren




/*fileprivate protocol CoffeeMachineState {
    func isReadyToBrew() -> Bool
    func brew()
}

extension CoffeeMachineState {
    func isReadyToBrew() -> Bool {
        print("\(#function) not implemented for \(self) state")
        return false
    }
    
    func brew() {
        print("\(#function) not implemented for \(self) state")
    }
}

fileprivate struct StandbyState: CoffeeMachineState {
    
}

fileprivate struct FillWaterTankState: CoffeeMachineState {
    var context: CoffeeMachine
    
    func isReadyToBrew() -> Bool {
        guard context.isWaterTankFilled else {
            print("Fill water tank!")
            context.state = StandbyState()
            return false
        }
        context.state = EmptyCapsuleBinState(context: context)
        return context.state.isReadyToBrew()
    }
}

fileprivate struct EmptyCapsuleBinState: CoffeeMachineState {
    var context: CoffeeMachine
    
    func isReadyToBrew() -> Bool {
        guard context.isCapsuleBinEmpty else {
            print("Empty capsule bin tank!")
            context.state = StandbyState()
            return false
        }
        
        context.state = InsertCapsuleState(context: context)
        return context.state.isReadyToBrew()
    }
}

fileprivate struct InsertCapsuleState: CoffeeMachineState {
    var context: CoffeeMachine
    
    func isReadyToBrew() -> Bool {
        guard context.isCapsuleInserted else {
            print("Coffee capsule not inserted!")
            context.state = StandbyState()
            return false
        }
        
        return true
    }
}

fileprivate struct BrewCoffeeState: CoffeeMachineState {
    var context: CoffeeMachine
    
    func brew() {
        context.state = FillWaterTankState(context: context)
        guard context.state.isReadyToBrew() else {
            print("Something went wrong!")
            context.state = StandbyState()
            return
        }
        
        print("Coffee ready")
        context.state = StandbyState()
    }
}

class CoffeeMachine {
    fileprivate var isWaterTankFilled: Bool
    fileprivate var isCapsuleBinEmpty: Bool
    fileprivate var isCapsuleInserted: Bool
    
    fileprivate var state: CoffeeMachineState = StandbyState()

    required init(waterFilled: Bool, binEmpty: Bool, capsuleInserted: Bool) {
        isWaterTankFilled = waterFilled
        isCapsuleBinEmpty = binEmpty
        isCapsuleInserted = capsuleInserted
    }
    
    func brew() {
        state = BrewCoffeeState(context: self)
        state.brew()
    }
}

let coffeeMachine = CoffeeMachine(waterFilled: true, binEmpty: true, capsuleInserted: true)
coffeeMachine.brew()*/



class CoffeMachine {
    private var isWaterTankFilled: Bool
    private var isCapsuleBinEmpty: Bool
    private var isCapsuleInserted: Bool
    
    required init(waterFilled: Bool, binEmpty: Bool, capsuleInserted: Bool) {
        isWaterTankFilled = waterFilled
        isCapsuleBinEmpty = binEmpty
        isCapsuleInserted = capsuleInserted
    }
}



