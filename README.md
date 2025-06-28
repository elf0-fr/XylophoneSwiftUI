# XylophoneSwiftUI

This project is a modern reimagining of the [sample code](https://github.com/appbrewery/Xylophone-iOS13) from “The Complete iOS Development Bootcamp”, rebuilt entirely using **SwiftUI**.
But this is more than a UIKit-to-SwiftUI migration — it also includes an interactive **WidgetKit extension** and **AppIntents** integration to support Siri and the Shortcuts app.

## What’s New Compared to the Original?

- Fully rewritten using **SwiftUI**, leveraging modern, declarative UI design.
- Integrated interactive widget with **WidgetKit**, allowing quick user interactions directly from the home screen.
- **AppIntent** integration to trigger actions via Siri voice commands or the Shortcuts app.
- Updated to support the latest versions of iOS (18) and Xcode (16).

## SwiftUI

<img src="https://github.com/user-attachments/assets/dad6fd26-3921-41cb-a145-7de793809563" alt="Portrait" width="200"/>
<img src="https://github.com/user-attachments/assets/afa519c3-fe4c-499e-b5ab-6c6eade78a17" alt="Landscape" height="200"/>

```swift
struct ContentView: View {
    
    let spacing: CGFloat = 8
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: spacing) {
                Group(subviews: musicalNotes) { subviews in
                    ForEach(subviews.indices, id: \.self) { index in
                        subviews[index]
                            .padding(.horizontal, getPadding(forIndex: index))
                    }
                    .frame(
                        height: getHeight(
                            withSubviewsCount: subviews.count,
                            geometry: geometry
                        )
                    )
                }
            }
        }
    }
    
    @ViewBuilder
    var musicalNotes: some View {
        MusicalNote(note: "C", color: .red)
        MusicalNote(note: "D", color: .orange)
        MusicalNote(note: "E", color: .yellow)
        MusicalNote(note: "F", color: .green)
        MusicalNote(note: "G", color: .indigo)
        MusicalNote(note: "A", color: .blue)
        MusicalNote(note: "B", color: .purple)
    }
    
    func getHeight(withSubviewsCount count: Int, geometry: GeometryProxy) -> CGFloat {
        let availableSpace = geometry.size.height - spacing * CGFloat(count - 1)
        
        return availableSpace / CGFloat(count)
    }
    
    func getPadding(forIndex index: Int) -> CGFloat {
        return CGFloat(index * 8)
    }
}
```

## Widget

<img src="https://github.com/user-attachments/assets/b31b466d-7744-41f4-9218-966bab62119f" alt="Widget" width="200"/>

## AppIntent

<img src="https://github.com/user-attachments/assets/d2f6bfd2-0285-4223-ab92-a3220e46e3a8" alt="Shortcut" width="200"/>

