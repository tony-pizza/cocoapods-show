List installed CocoaPods
========================

A way to quickly see what pods (and versions) are installed in your project.

For fans of Bundler's `bundle list`.

## Installation

`$ gem install cocoapods-show`

## Usage

```
$ pod show
Installed pods:
  * AWSCore (2.2.5)
  * AWSS3 (2.2.5)
  * Bolts (1.2.2)
  ...
```

Or filter:

```
$ pod show AWS
Installed pods:
  * AWSCore (2.2.5)
  * AWSS3 (2.2.5)
```

## Can't I just look at Podfile.lock?

Yup.
