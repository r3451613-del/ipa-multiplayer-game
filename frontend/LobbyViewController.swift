import UIKit

class LobbyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var players: [String] = [] // Array to hold online player names

    let tableView = UITableView() // Table view to display players
    let joinGameButton = UIButton(type: .system) // Button to join a game

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView() // Setup the table view
        setupJoinGameButton() // Setup the join game button
    }

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "PlayerCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: joinGameButton.topAnchor)
        ])
    }

    func setupJoinGameButton() {
        joinGameButton.setTitle("Join Game", for: .normal)
        joinGameButton.addTarget(self, action: #selector(joinGame), for: .touchUpInside)
        joinGameButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(joinGameButton)

        NSLayoutConstraint.activate([
            joinGameButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            joinGameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc func joinGame() {
        // Action to join a game
        print("Join Game pressed")
    }

    // TableView DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath)
        cell.textLabel?.text = players[indexPath.row] // Display player name
        return cell
    }
}