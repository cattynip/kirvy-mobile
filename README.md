# Flutter for Beginners

## Info

This is a "For Beginners" project for learning how to make a simple application with Dart and Flutter. The course that I took was [Flutter For Beginners](https://nomadcoders.co/flutter-for-beginners) from Nomadcoders. Now, this project is done. The next project for improving the skills on Dart and Flutter is [TikTok Clone Coding](https://nomadcoders.co/tiktok-clone), which is a "Clone Coding" project, and [here](https://github.com/cattynip/ticktok) is the repository for that.

If you want to see more "For Beginners" and "Clone Coding" projects in Nomadcoders, like this project, visit [my Nomadcoders List](https://github.com/stars/cattynip/lists/nomadcoders) on GitHub List.

## Projects

### First Project - Banking

Source Code: [#6c46fa8](https://github.com/cattynip/flutter-for-beginners/tree/6c46fa884386c706da3c4a6d4cf78f6899b903d7)

- What I did

  - Cloning [The Financial Mobile IOS App by Kristina Taskaeva](https://dribbble.com/shots/19858341-Finnancial-Mobile-IOS-App)
    - She made 3 pages and screens for the app, but I built only the main screen
  - Displaying the widgets on the screen as similar as what I saw in the image

- What I learned
  - The Layout of the application built by Flutter
  - The concept of `widgets` in Flutter
  - How to place them
  - How to add styles on the widgets
  - How to make reuseable stateless widgets for my own

- Screenshots (left - original | right - mine)

  <a href="https://dribbble.com/shots/19858341-Finnancial-Mobile-IOS-App"><img alt="The Original Image" src="https://github.com/cattynip/flutter-for-beginners/assets/96553411/9f3c878f-c85b-4486-ae54-156d59875864" width="45%" ></a>
  <img alt="The Screenshot of the fist project" src="https://github.com/cattynip/flutter-for-beginners/assets/96553411/14aee270-e0b1-4209-bf11-8882c1eb508e" width="45%" />

---

### Second Project - Pomodoros

Source Code: [#80a91e7](https://github.com/cattynip/flutter-for-beginners/tree/80a91e734709ca744e26754ba2e5d87f41c5df3c)

- What I did
  - Cloning [The Pomodoros App Design by Omar Sherif](https://www.behance.net/gallery/98918603/POMO-UIKIT)
    - He made a lot of pages and screens for the app, but I built only the main screen
  - Featuring of...
    - Increasing the number of Pomodoros as I am done
    - Stopping and Resuming the timer
    - Restarting the timer so I can start from beginning no matter how much I have done

- What I learned
  - How to make reuseable stateful widgets for my own
  - How to manage the variables and datas in Flutter Application

- Videos
  - Increasing the number of Pomodoros

    <video src="https://github.com/cattynip/flutter-for-beginners/assets/96553411/1c82559b-0d5e-4b3c-b0ae-b85d559bd7bc" />

  - Stopping the timer

    <video src="https://github.com/cattynip/flutter-for-beginners/assets/96553411/16ac2e2e-9579-4a8b-91a4-b483a006c6d3" />

  - Restarting the timer

    <video src="https://github.com/cattynip/flutter-for-beginners/assets/96553411/a5a31c02-8436-4369-8722-3a8fb803192f" />

---

### Third Project - Webtoon App

Source Code: [#a8237be](https://github.com/cattynip/flutter-for-beginners/tree/a8237be811bd71223610b751891a41ea981c3a0c)

- What I did
  - Building the webtoon library application
  - Fetching data from the server
  - Listing Today's Trending Webtoons
  - Showing the Details of a Trending Webtoon
  - Showing the specific episode of a Webtoon
  - Marking a webtoon as a favourite

- What I learned
  - How to fetch data in Flutter
  - How to save data locally
  - How to list something
  - How to show websites
  - How to show images
  - How to allow users to scroll the widgets in case they are out of the screen
  - How to install packages and use them

- Videos

  - List View
    <video src="https://github.com/cattynip/flutter-for-beginners/assets/96553411/32456eb4-450e-4652-b754-a2e1a2d6dbdf" />

  - Hero
    <video src="https://github.com/cattynip/flutter-for-beginners/assets/96553411/a71153d0-9dcd-4d9e-af61-b0901e527a67" />

  - Favourite and Saving data locally
    <video src="https://github.com/cattynip/flutter-for-beginners/assets/96553411/4216a33c-a84a-4265-b986-cc3172735a2d" />

  - Webtoon on websites
    <video src="https://github.com/cattynip/flutter-for-beginners/assets/96553411/8c4e3f44-2a2d-4beb-97b9-5f95b0ede576" />

## Reflection

Through these lectures, I learned what problem the computer programming language Dart and the framework that is working on that, Flutter, are trying to solve, how they are working on the different devices, and how to use them literally.

What I felt while learning and writing codes in Dart and Flutter is that it is pretty similar to ReactJS in terms of making and configuring the project, showing something by defining widgets or components, and managing variables and data. Both of them define the widgets, components, and even stylings to display on Mobile or Website. Because I have written a lot of ReactJS code, which flows similarly to Flutter code, it was easier to get used to writing in Flutter(or Dart) than I expected it to be. The only difference is how the codes are being used and what they are used by. Flutter code is read by its engine to draw them on a kind of canvas, while ReactJS code is a sort of guide for Web Browser to structure the DOM Element trees, which is CSR.

Also, I really like Dart's and Flutter's way of defining widgets. In Flutter, basically, I have to make a class that is doing only ONE THING. It can take the other child(class) to add styles or layout its children or do something like that. It is clear, and it is pretty easy to recognize what the widget is doing and find the widget that causes the error.
