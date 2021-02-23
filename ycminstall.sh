#!/bin/bash
# Author: lirise(alfangj@126.com)
# Create Time: 2021-02-11 17:28:44
# Modified Time: 2021-02-21 23:05:36 

echo "这个以Vim-Plug为插件管理为例！！"

cd ~/.vim/plugged/

echo "下载YouCompleteMe……"
rm -rf ./YouCompleteMe
git clone https://gitee.com/lirise/YouCompleteMe.git
cd ~/.vim/plugged/YouCompleteMe/
git remote set-url origin https://github.com/ycm-core/YouCompleteMe.git
cd ~/.vim/plugged/YouCompleteMe/third_party/

#echo "下载python-future……"
#rm -rf ./python-future
#git clone https://gitee.com/lirise/python-future.git
#cd ~/.vim/plugged/YouCompleteMe/third_party/python-future
#git remote set-url origin https://github.com/PythonCharmers/python-future.git
#cd ~/.vim/plugged/YouCompleteMe/third_party/

#echo "下载pythonfutures……"
#rm -rf ./pythonfutures
#git clone https://gitee.com/lirise/pythonfutures.git
#cd ~/.vim/plugged/YouCompleteMe/third_party/pythonfutures
#git remote set-url origin https://github.com/agronholm/pythonfutures.git
#cd ~/.vim/plugged/YouCompleteMe/third_party/

echo "下载requests-futures……"
rm -rf ./requests-futures
git clone https://gitee.com/lirise/requests-futures.git
cd ~/.vim/plugged/YouCompleteMe/third_party/requests-futures/
git remote set-url origin https://github.com/ross/requests-futures.git

echo "进入requests_deps……"
cd ~/.vim/plugged/YouCompleteMe/third_party/requests_deps/

echo "下载certifi……"
rm -rf ./certifi
git clone https://gitee.com/lirise/python-certifi.git ./certifi
cd ~/.vim/plugged/YouCompleteMe/third_party/requests_deps/certifi/
git remote set-url origin https://github.com/certifi/python-certifi.git
cd ~/.vim/plugged/YouCompleteMe/third_party/requests_deps/

echo "下载chardet……"
rm -rf ./chardet
git clone https://gitee.com/lirise/chardet.git
cd ~/.vim/plugged/YouCompleteMe/third_party/requests_deps/chardet/
git remote set-url origin https://github.com/chardet/chardet.git
cd ~/.vim/plugged/YouCompleteMe/third_party/requests_deps/

echo "下载idna……"
rm -rf ./idna
git clone https://gitee.com/lirise/idna.git
cd ~/.vim/plugged/YouCompleteMe/third_party/requests_deps/idna/
git remote set-url origin https://github.com/kjd/idna.git
cd ~/.vim/plugged/YouCompleteMe/third_party/requests_deps/

echo "下载requests……"
rm -rf requests
git clone https://gitee.com/lirise/requests.git
cd ~/.vim/plugged/YouCompleteMe/third_party/requests_deps/requests/
git remote set-url origin https://github.com/psf/requests.git
cd ~/.vim/plugged/YouCompleteMe/third_party/requests_deps/

echo "下载urllib3……"
rm -rf urllib3
git clone https://gitee.com/lirise/urllib3.git
cd ~/.vim/plugged/YouCompleteMe/third_party/requests_deps/urllib3/
git remote set-url origin https://github.com/urllib3/urllib3.git
cd ~/.vim/plugged/YouCompleteMe/third_party/requests_deps/

echo "下载ycmd……"
cd ~/.vim/plugged/YouCompleteMe/third_party/
rm -rf ./ycmd
git clone https://gitee.com/lirise/ycmd.git
cd ~/.vim/plugged/YouCompleteMe/third_party/ycmd/
git remote set-url origin https://github.com/ycm-core/ycmd.git

echo "进入ycmd/third_party……"
cd ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/

echo "下载bottle……"
rm -rf ./bottle
git clone https://gitee.com/lirise/bottle.git
cd ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/bottle/
git remote set-url origin https://github.com/bottlepy/bottle.git
cd ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/

echo "进入jedi_deps……"
cd ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/jedi_deps/

echo "下载jedi……"
rm -rf ./jedi
git clone https://gitee.com/lirise/jedi.git
cd ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/jedi_deps/jedi/
git remote set-url origin https://github.com/davidhalter/jedi.git

echo "进入jedi/jedi/third_party/"
cd ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/jedi_deps/jedi/jedi/third_party/

echo "下载django-stubs……"
rm -rf ./django-stubs
git clone https://gitee.com/lirise/django-stubs.git
cd ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/jedi_deps/jedi/jedi/third_party/django-stubs/
git remote set-url origin https://github.com/davidhalter/django-stubs.git
cd ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/jedi_deps/jedi/jedi/third_party/

echo "下载typeshed……"
rm -rf ./typeshed
git clone https://gitee.com/lirise/typeshed.git
cd ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/jedi_deps/jedi/jedi/third_party/typeshed/
git remote set-url origin https://github.com/davidhalter/typeshed.git

echo "返回jedi_deps……"
cd ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/jedi_deps/

echo "下载numpydoc……"
rm -rf ./numpydoc
git clone https://gitee.com/lirise/numpydoc.git
cd ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/jedi_deps/numpydoc/
git remote set-url origin https://github.com/numpy/numpydoc.git

echo "下载scipy-sphinx-theme"
cd ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/jedi_deps/numpydoc/doc/
rm -rf ./scipy-sphinx-theme
git clone https://gitee.com/lirise/scipy-sphinx-theme.git
cd ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/jedi_deps/numpydoc/doc/scipy-sphinx-theme/
git remote set-url origin https://github.com/scipy/scipy-sphinx-theme.git
cd ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/jedi_deps/

echo "下载parso……"
rm -rf ./parso
git clone https://gitee.com/lirise/parso.git
cd ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/jedi_deps/parso/
git remote set-url origin https://github.com/davidhalter/parso.git

echo "进入ycmd/third_party……"
cd ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/

echo "下载mrab-regex……"
rm -rf ./mrab-regex
git clone https://gitee.com/lirise/mrab-regex.git
cd ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/mrab-regex
git remote set-url origin https://bitbucket.org/mrabarnett/mrab-regex.git
cd ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/

echo "拷贝requests_deps……"
rm -rf ./requests_deps/*
cp -R ~/.vim/plugged/YouCompleteMe/third_party/requests_deps ./

echo "下载waitress……"
rm -rf ./waitress
git clone https://gitee.com/lirise/waitress.git
cd ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/waitress/
git remote set-url origin https://github.com/Pylons/waitress.git
cd ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/

echo "进入watchdog_deps……"
cd ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/watchdog_deps/

echo "下载pathtools……"
rm -rf ./pathtools
git clone https://gitee.com/lirise/pathtools.git
cd ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/watchdog_deps/pathtools/
git remote set-url origin https://github.com/gorakhargosh/pathtools.git

echo "下载flask-sphinx-themes……"
cd ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/watchdog_deps/pathtools/docs/source/
rm -rf ./_themes
git clone https://gitee.com/lirise/flask-sphinx-themes.git ./_themes
cd ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/watchdog_deps/pathtools/docs/source/_themes
git remote set-url origin https://github.com/pallets/flask-sphinx-themes.git
cd ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/watchdog_deps/

echo "下载watchdog……"
rm -rf ./watchdog
git clone https://gitee.com/lirise/watchdog.git
cd ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/watchdog_deps/watchdog/
git remote set-url origin https://github.com/gorakhargosh/watchdog.git

echo "创建clangd目录、下载clangd文件"
mkdir -p ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/clangd/
cd ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/clangd/
git clone https://gitee.com/lirise/clangd.git ./cache

echo "下载libclang文件"
cd ~/.vim/plugged/YouCompleteMe/third_party/ycmd/
git clone https://gitee.com/lirise/libclang.git ./clang_archives

echo "返回YouCompleteMe……"
cd ~/.vim/plugged/YouCompleteMe/

echo "确认仓库的完整性……"
git submodule update --init --recursive

echo "编译YouCompleterMe……"
python3 ./install.py --clang-completer --clangd-completer

echo "修改.ycm_extra_conf.py文件"
File=""$HOME"/.vim/plugged/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py"
sed -i '' "s/'-std=c++11'/#\'-std=c++11\'/g" "$File"
sed -i '' "s/'-x'/#\'-x\'/g" "$File"
sed -i '' "s/'c++'/#\'c++\'/g" "$File"

echo "结束………………^-^………………OK！！"
exit 0


