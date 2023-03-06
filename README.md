# MVVM + Programmatic UI Approach + No Storyboard + No Xibs + Data Binding + Singleton + Generic API Calls


| Movies List      | Movie Selection      | Movie Details      |
|------------|-------------| -------------|
| <img src="https://user-images.githubusercontent.com/30188089/223220494-8214e77f-b390-4d8c-bb6d-da3eefbc7d14.png" width="250"> | <img src="https://user-images.githubusercontent.com/30188089/222958011-027e9aaa-df84-4a8d-9bec-4df4e23ac062.png" width="250"> | <img src="https://user-images.githubusercontent.com/30188089/222958303-c1416a8c-bb2a-4a5a-8507-500243416f98.png" width="250"> |

Feature details:
- Favorite Movies list is expected to horizontal swipe if the number of the movies doesn’t fit in the screen.
- Call the associated APIs to get the list for all movies and the favorite movies.
- If a movie is a favorite, it should appear on both watched/ To Watch and favorites section.
- The watched movies shouldn’t appear in To Watch section
- By pressing next after selecting a movie, the details screen should have all the synced information about the movie.
- If you select a movie in the favorite list, the associated movie in the Watched/ To watch list should be selected as well and vice versa.
- Movies should be sorted using rating if more than one movie have the same rating then it should sort based on the name.


---- Features ------
- UIKit
- Programtic UI Approach
- No storyboard/Xibs
- MVVM architecture
- Data Binding
- Singleton Design Pattern
- URLSession - Generic Api calls - Networking API
- Decodable Protocol with JSONDecoder
- Downloading Image - Kingfisher Library
- Swift Package Manager - SPM
- Closure, Completion, Typealias, Enum
- Detailed use of UIStackView, UITableView, UITableViewCell XIB
- Inheritance - Final Keyword, Init()
- Memory Management
- Light and Dark Mode
- Unit Testing
- UI Testing
- Capital 'S' singelton
