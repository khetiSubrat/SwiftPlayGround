//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)
       
        
        let button = UIButton()
        button.frame = CGRect(x: 150, y: label.frame.origin.y + label.frame.size.height + 10, width: 50, height: 50)
        button.titleLabel?.text = "Tap"
        
        view.addSubview(button)
        
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
