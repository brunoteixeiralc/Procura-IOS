//
//  SearchResultCell.swift
//  procura
//
//  Created by Bruno Corrêa on 09/01/2018.
//  Copyright © 2018 Bruno Lemgruber. All rights reserved.
//

import UIKit

class SearchResultCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var artworkImageView: UIImageView!
    
    var downloadTask: URLSessionDownloadTask?
    
    func configure(for result: SearchResult) {
        nameLabel.text = result.name
        if result.artistName.isEmpty {
            artistNameLabel.text = "Desconhecido"
        } else {
            artistNameLabel.text = String(format: "%@ (%@)",result.artistName, result.type)
        }
        
        artworkImageView.image = UIImage(named:"Placeholder")
        if let smallURL = URL(string: result.imageSmall){
            downloadTask = artworkImageView.loadImage(url: smallURL, thumbnail: true)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        downloadTask?.cancel()
        downloadTask = nil
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let selectedView = UIView(frame:CGRect.zero)
        selectedView.backgroundColor = UIColor(red: 46/255, green: 204/255,blue: 113/255, alpha: 0.2)
        selectedBackgroundView = selectedView
    }
}
