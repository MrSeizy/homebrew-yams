# Ponchopig Yams

Private Homebrew tap for [Yams](https://github.com/PonchoPig/yams).

## How do I install these formulae?

The tap repository is private. Add it with an authenticated clone URL (SSH
is enough if `git clone git@github.com:PonchoPig/homebrew-yams.git` already
works):

```sh
brew tap ponchopig/yams git@github.com:PonchoPig/homebrew-yams.git
brew install yams
```

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "ponchopig/yams", "git@github.com:PonchoPig/homebrew-yams.git"
brew "ponchopig/yams/yams"
```

`brew tap ponchopig/yams` without a clone URL only works once GitHub
credentials can fetch `https://github.com/PonchoPig/homebrew-yams`.

Until the first Yams GitHub release exists, `brew install yams` cannot
download the formula URL. Install from a local gate-built tarball instead:

```sh
# temporarily point Formula/yams.rb url at
# file://$HOME/dev/yams/dist/yams-0.1.0-aarch64-apple-darwin.tar.gz
brew install --formula ponchopig/yams/yams
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
