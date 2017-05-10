# purescript-newtype-operator

Provides the `^` operator to ease nested newtype handling when no lens are used.

## Installation

```
bower install purescript-newtype-operator
```

## Usage

```
book^_.author^_.birthplace^_.location.lon
```

Full example is provided in [`test/Main.purs`](https://github.com/cyrbon/purescript-newtype-operator/test/Main.purs)
