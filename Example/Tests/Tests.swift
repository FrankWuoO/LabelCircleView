import XCTest
import LabelCircleView

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_text() {
        let text = "123"
        let view = LabelCircleView(text: text, percent: 1.0, color: UIColor.blue)
        XCTAssertEqual(text, view.text)
    }

    func test_percent() {
        let percent: Double = 0.25
        let view = LabelCircleView(text: "100", percent: percent, color: UIColor.blue)
        XCTAssertEqual(percent, view.percent)
    }
    
    func test_color() {
        let color: UIColor = UIColor.blue
        let view = LabelCircleView(text: "100", percent: 1.0, color: color)
        XCTAssertEqual(color, view.color)
    }
    
    func test_update() {
        let view = LabelCircleView(text: "100", percent: 1.0, color: UIColor.blue)
        let text: String = "232"
        let percent: Double = 0.34
        let color: UIColor = UIColor.yellow
        view.update(text: text, percent: percent, color: color)
        
        XCTAssertEqual(text, view.text)
        XCTAssertEqual(percent, view.percent)
        XCTAssertEqual(color, view.color)
    }
}
