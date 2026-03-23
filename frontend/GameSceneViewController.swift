import UIKit

class GameSceneViewController: UIViewController {
    var playerPosition: CGPoint = .zero
    var server: ServerConnection?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMovementControls()
        server = ServerConnection()
    }

    func setupMovementControls() {
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)

        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)

        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
    }

    @objc func handleSwipe(_ gesture: UISwipeGestureRecognizer) {
        switch gesture.direction {
        case .up:
            playerPosition.y += 10
        case .down:
            playerPosition.y -= 10
        case .left:
            playerPosition.x -= 10
        case .right:
            playerPosition.x += 10
        default:
            break
        }
        syncPositionToServer() // Sync the updated position to the server
    }

    func syncPositionToServer() {
        guard let server = server else { return }
        server.updatePlayerPosition(playerPosition) // Implement the method in the ServerConnection class
    }
}

class ServerConnection {
    func updatePlayerPosition(_ position: CGPoint) {
        // Logic to send the position to the server goes here
        print("Position synced to server: \(position)")
    }
}