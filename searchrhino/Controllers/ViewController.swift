//  Created by Jessica Joseph on 7/19/18.
//  Copyright © 2018 B0RN BKLYN. All rights reserved.

import UIKit

class ViewController: UIViewController {

    var emojis: [Emoji] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupEmojis()
        print(emojis)
    }
    
    func setupEmojis() {
        let path = Bundle.main.path(forResource: "Emoji", ofType: "plist") as! String
        let dictionary = NSDictionary(contentsOfFile: path)
        
        for (key, value) in dictionary! {
            let emoji = Emoji(name: (key as? String)!, emojiLiteral: (value as? String)!)
            emojis.append(emoji)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "emojiCell", for: indexPath)
        
        return cell
    }
    
}
