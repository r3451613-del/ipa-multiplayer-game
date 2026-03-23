import UIKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var messages: [String] = []
    
    let tableView = UITableView()
    let messageInputField = UITextField()
    let sendButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupInputComponents()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: messageInputField.topAnchor)
        ])
    }
    
    func setupInputComponents() {
        messageInputField.borderStyle = .roundedRect
        messageInputField.placeholder = "Enter message..."
        messageInputField.translatesAutoresizingMaskIntoConstraints = false
    
        sendButton.setTitle("Send", for: .normal)
        sendButton.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
    
        view.addSubview(messageInputField)
        view.addSubview(sendButton)
    
        NSLayoutConstraint.activate([
            messageInputField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8),
            messageInputField.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            messageInputField.rightAnchor.constraint(equalTo: sendButton.leftAnchor, constant: -8),
            messageInputField.heightAnchor.constraint(equalToConstant: 40),
            
            sendButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8),
            sendButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            sendButton.widthAnchor.constraint(equalToConstant: 70),
            sendButton.heightAnchor.constraint(equalTo: messageInputField.heightAnchor)
        ])
    }
    
    @objc func sendMessage() {
        guard let message = messageInputField.text, !message.isEmpty else { return }
        messages.append(message)
        messageInputField.text = ""
        tableView.reloadData()
    }
    
    // UITableViewDataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = messages[indexPath.row]
        return cell
    }
}