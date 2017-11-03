
## Installation
```
$ git clone https://github.com/smarrerof/kc-ios3 <dir>
$ cd <dir>
$ carthage build --platform iOS
$ cd <dir>/TMDbCore/Config
$ cp Keys.sample.xcconfig Keys.xcconfig
```
*Please keep in mind that the build proccess can take a long time (few minutes)*

Open the Keys.xcconfig file with your favorite text editor and set the correct parameters. After that you can open TMDb.xcworkspace and run the application.
