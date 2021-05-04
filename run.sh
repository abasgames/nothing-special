sudo apt-get install bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev libwxgtk3.0-dev

mkdir -p ~/bin

wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip

unzip platform-tools-latest-linux.zip -d ~

curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo

chmod a+x ~/bin/repo

if [ -d "$HOME/platform-tools" ] ; then
    PATH="$HOME/platform-tools:$PATH"
fi

source ~/.profile

mkdir crDroid
cd crDroid

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

source ~/.profile

repo init -u git://github.com/crdroidandroid/android.git -b 11.0 

repo sync -j24

cd crDroid

. build/envsetup.sh
mmm frameworks/base/packages/SystemUI/
