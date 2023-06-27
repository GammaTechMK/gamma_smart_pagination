## 1.0.3
* removed platform directories based on `https://github.com/flutter/flutter/pull/125292` (this fixes the depricated android embedding warning)
* updated readme

## 1.0.2
* Updated README
* Removed other platforms except ios and android (since the package is not tested yet on other platforms)

## 1.0.1
* Updated code docs
* Internal / non-public facing method names updated
* Updated README

## 1.0.0
* Breaking changes:
  - `GammaSmartController` is now `GammaController`
  - `GammaControllerStatus` is now a generated freezed model.
  - added `child` param.
  - removed `itemBuilder`, 
  - removed `separatorBuilder`
* Added code documentation for the package
* Updated the example app to refrlect different controller states
* Optimized scroll controller handling to trigger callbacks only when expected.
* Updated documentation
* Added unit and widget tests

## 0.0.3
* General improvements

## 0.0.2
* Updated class names of GammaSmartController and GammaSmartPagination

## 0.0.1
* Initial setup
