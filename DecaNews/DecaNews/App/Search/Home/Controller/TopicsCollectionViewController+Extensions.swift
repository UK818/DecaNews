import UIKit

extension TopicsCollectionViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == circularCollectionView {
            guard let cell = circularCollectionView.dequeueReusableCell(withReuseIdentifier: NewsTopicsCollectionViewCell.identifier, for: indexPath) as? NewsTopicsCollectionViewCell else {
                return UICollectionViewCell() }
            
            cell.setup(with: topics[indexPath.row])
            return cell
        }
        
        if collectionView == cardShapedCollectionView {
            guard let cell2 = cardShapedCollectionView.dequeueReusableCell(withReuseIdentifier: PopularPublications.identifier, for: indexPath) as? PopularPublications
            else { return UICollectionViewCell()
            }
            if let articles = collectionViewNews {
                let article = articles[indexPath.row]
                
                cell2.urlFromBase = article.url
                cell2.changecircularViewBorderColor()
                cell2.popularPublicationsNames(article.source.name ?? "")
                cell2.setUp(with: article)
                
            }
            return cell2
            
        } else if collectionView == authorsCardShapedCollectionView {
            guard let cell3 = authorsCardShapedCollectionView.dequeueReusableCell(withReuseIdentifier: PopularAuthorViewCell.identifier, for: indexPath) as? PopularAuthorViewCell
            else {
                return UICollectionViewCell()
            }
            if let articles = authorsCollectionViewNews {
                let article = articles[indexPath.row]
                
                cell3.giveMeFullName(article.author ?? "")
                cell3.seePostFromAuthor = article.url
                return cell3
            }
        }
        return UICollectionViewCell()
    }
}

extension TopicsCollectionViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == circularCollectionView {
            return topics.count
        } else if collectionView == cardShapedCollectionView {
            return collectionViewNews?.count ?? 0
        } else if collectionView == authorsCardShapedCollectionView {
            return authorsCollectionViewNews?.count ?? 0
        }
        return 5
    }
    
}
