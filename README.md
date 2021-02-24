An automatic configuration program for vim
===============================================

<p align="center">
    <a href="#build" alt="build"><img src="https://img.shields.io/badge/build-passing-brightgreen.svg" /></a>
    <a href="#安装" alt="platform"><img src="https://img.shields.io/badge/platform-MacOSX%20%7C%20Linux%2064bit%20%7C%20Docker%20%7C%20WSL-brightgreen.svg" /></a>
    <a href="https://github.com/chxuan/vimplus/stargazers" alt="stars"><img src="https://img.shields.io/github/stars/chxuan/vimplus.svg?style=popout&label=stars" /></a>
    <a href="https://github.com/chxuan/vimplus/forks" alt="forks"><img src="https://img.shields.io/github/forks/chxuan/vimplus.svg?style=popout&label=forks" /></a>
    <a href="https://github.com/chxuan/vimplus/graphs/contributors" alt="contributors"><img src="https://img.shields.io/github/contributors/chxuan/vimplus" /></a>
    <a href="https://github.com/chxuan/vimplus/blob/master/LICENSE" alt="lincense"><img src="https://img.shields.io/badge/license-MIT-blue.svg" /></a>
</p>

![main][1]

## 安装

### Mac OS X

#### 安装[HomeBrew][2]
 
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#### 安装vimplus

    git clone https://github.com/chxuan/vimplus.git ~/.vimplus
    cd ~/.vimplus
    ./install.sh
    
#### 设置Nerd Font

为防止vimplus显示乱码，需设置mac终端字体为`Droid Sans Mono Nerd Font`。

#### 更新vimplus

紧跟vimplus的步伐，尝鲜新特性

    ./update.sh
    

  [1]: https://raw.githubusercontent.com/lirise/macvimplus/master/screenshots/main.png
  [2]: https://brew.sh/
 
