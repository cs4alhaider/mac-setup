# Power of macOS Terminal

## Here is how I set up any mac device using terminal

### 1- Installing [HomeBrew](https://brew.sh) to have the ability to automate installing more than `n^` apps/packages automatically

```bash
/bin/bash -c "$(curl -fsSL [https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh](https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh))"
```

- Installing Needed Apps

```bash
// I moved sf-symbols and virtualbox to the front since they require passwords 
brew install --cask virtualbox \
sf-symbols \
google-chrome \
alfred \
visual-studio-code \
notion \
zoom \
mongodb-realm-studio \
obsidian \
brave-browser \
microsoft-teams \
airbuddy \
android-studio \
dbeaver-community \
docker \
figma \
iina \
postman \
sourcetree \
telegram \
slack \
transmission \
virtualbox-extension-pack \
imazing \
surge \
the-unarchiver \
xcodes \
devtoys \
raycast \
little-snitch \
tableplus \
sublime-text \
sublime-merge \
angry-ip-scanner \
shottr
```

- Installing needed packages

```bash
brew install \
exa \
openshift-cli \
carthage \
fastlane \
python \
npm \
openjdk
```

- Installing optional quick look packages [here](https://github.com/sindresorhus/quick-look-plugins)

### 2- Installing [Cocoapods](https://cocoapods.org) package manager for iOS/macOS apps

```bash
sudo gem install cocoapods
```

### 3- Installing [oh-my-zsh](https://ohmyz.sh) for better command-line experience

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### 4- Installing npm related tools globally
```bash
npm install -g firebase-tools
```

- Changing the theme to use [jonathan](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#jonathan) by replacing theme name using [sed](https://www.geeksforgeeks.org/sed-command-in-linux-unix-with-examples/)

```bash
sed -i.bak 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"jonathan\"/g' ~/.zshrc
```

- Adding Auto completion using [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

```bash
brew install zsh-autosuggestions
```

### 5- Creating `.profile` file

- Create file for `.profile` and added your `alias` and custom `functions`

```bash
vim ~/.profile
```

- Appending the below to the end of this file → `~/.zshrc`

```bash
echo "source ~/.profile" >> ~/.zshrc
```

### 6- Cloning [Abdullah Alhaider - Xcode Theme colors & fonts](https://github.com/cs4alhaider/XcodeTheme)

- First let’s install the needed fonts by running the following

```bash
git clone https://github.com/adobe-fonts/source-code-pro.git ./Desktop/temp-fonts && cd Desktop/temp-fonts/TTF && mv *.ttf ~/Library/Fonts && cd ~ && rm -rf Desktop/temp-fonts

```

- Now let's add the theme and that’s it!

```bash
git clone https://github.com/cs4alhaider/XcodeTheme.git ./Desktop/temp-theme && cd Desktop/temp-theme && mkdir ~/Library/Developer/Xcode/UserData/FontAndColorThemes && mv *.xccolortheme ~/Library/Developer/Xcode/UserData/FontAndColorThemes && cd ~ && rm -rf Desktop/temp-theme
```

### 7- Adding Xcode extensions
* [Multiliner](https://github.com/aheze/Multiliner)
