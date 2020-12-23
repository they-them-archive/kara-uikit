# Kara Swift UIKit

This application, a mood tracker, is a study project for the iOS bootcamp I'm hosting. This is one of [two implementations](https://github.com/they-them-archive/kara-swiftui).

## Implementation Details

This app uses direct access to `UserDefaults` and a delegate to update the `UITableView`. Since `UserDefaults` does not directly support the storing of custom types, the array of Mood structs are encoded and decoded into a JSON string to be stored in `UserDefaults`.

## Screenshot

![Artboard](https://user-images.githubusercontent.com/6799989/101292934-8f38d300-37e0-11eb-8af8-aebd5e56e11f.png)
