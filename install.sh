#!/bin/bash
#Released under GNU General Public License version 3, see the file COPYING for details.
#installation script for Kies

#parse arguments for installation directories
showhelp() {
 echo $0 "can be called with the following options:"
 echo "$0 --help show options"
 echo $0" --prefix=<dir> installs into <dir>"
 echo $0" --destdir=<dir> destination "root" directory to copy files to"
 echo "e.g. when installing to a fakeroot environment"
 echo $0" --datadir=<dir> where data components will go"
 echo $0" --bindir=<dir> where executables will go"
 echo $0" --mandir=<dir> where man pages will go" 
 exit 1
}

for arg
do
  case $arg in
    --prefix=*)
        prefix=${arg#*=}
        ;;
    --help)
        showhelp
        ;;
    --bindir=*)
        bindir=${arg#*=}
        ;;
    --mandir=*)
        mandir=${arg#*=}
        ;;
    --datadir=*)
        datadir=${arg#*=}
        ;;
    --destdir=*)
        #destination "root" directory to copy files to
        #e.g. when installing to a fakeroot environment
        destdir=${arg#*=}
        ;;
  esac
done
if [ -z $prefix ]
then
  prefix=/usr/local
fi
if [ -z $bindir ]
then
  bindir=$prefix/bin
fi
if [ -z $datadir ] 
then
  datadir=$prefix/share
fi
if [ -z $mandir ]
then
  mandir=$datadir/man
fi

#check for the basics
ok=1
check_for() {
if (which "$1" 2> /dev/null > /dev/null)
then ok=0
else echo "I need the $1 utility and cannot find it, please install it first"
  exit 1
  fi
}  
check_for sed
check_for dd
check_for stty
check_for wc
check_for tty
check_for hexdump
check_for fgrep
check_for sort
check_for file
check_for test
check_for lynx

#change hardcoded file locations in other files
find . -type f -not -name "install.sh" -exec sed -i "s:/usr/local/bin:$bindir:g;" {} ";"
find . -type f -not -name "install.sh" -exec sed -i "s:/usr/local/man:$mandir:g;" {} ";"
find . -type f -not -name "install.sh" -exec sed -i "s:/usr/local/share:$datadir:g;" {} ";"
find . -type f -not -name "install.sh" -exec sed -i "s:/opt/kies/bin:$bindir:g;" {} ";"
find . -type f -not -name "install.sh" -exec sed -i "s:/opt/kies/share/man:$mandir:g;" {} ";"
find . -type f -not -name "install.sh" -exec sed -i "s:/opt/kies/share:$datadir:g;" {} ";"

echo "installing the menu system"

cd menu_system&&\
ok=1
if (test ! -d $destdir$bindir)
  then mkdir -p $destdir$bindir&&ok=0||echo creation of $destdir$bindir failed
  export PATH=$PATH:$destdir$bindir
  test $ok -eq 1&&exit 1
fi
  for i in $(ls|fgrep -v "menus
kies.1
README");do
cp "$i" $destdir$bindir||echo "failed to copy $i"
done
#if (test ! -d $destdir/bin)
#  then mkdir -p $destdir/bin&&ok=0||echo creation of $destdirbindir failed
#  test $ok -eq 1&&exit 1
#fi
echo "installing the man page"
ok=1
if (test ! -d $destdir$mandir/man1)
  then mkdir -p $destdir$mandir/man1&&ok=0||echo creation of $destdir$mandir/man1 failed
  test $ok -eq 1&&exit 1
fi
cp kies.1 $destdir$mandir/man1||echo "man page installation failed"

echo "installing example menus"

if (test ! -d $destdir$datadir/kies/menu_system/menus)
then mkdir -p $destdir$datadir/kies/menu_system/menus||echo failed
fi

cp -r menus/* $destdir$datadir/kies/menu_system/menus/.
cp README $destdir$datadir/kies/.
cd ../kies_wrappers
echo "installing wrapper scripts"

for i in $(ls|fgrep -v "README
configure_email.templates");do
cp "$i" $destdir$bindir
done

if (test ! -d $destdir$datadir/kies/kies_wrappers/configure_email.templates)
then mkdir -p $destdir$datadir/kies/kies_wrappers/configure_email.templates||echo failed
fi

cp -r configure_email.templates $destdir$datadir/kies/kies_wrappers/.
cp README* $destdir$datadir/kies/kies_wrappers/.
cp kies_ocr_engines.txt $destdir$datadir/kies/kies_wrappers/.
echo "installing the pickafile file browser"
cd ../file_browser
cp pickafile $destdir$bindir
cp getterm $destdir$bindir
cp pickafile.1 $destdir$mandir/man1||echo "man page installation failed"

if (test ! -d $destdir$datadir/kies/file_browser)
then mkdir -p $destdir$datadir/kies/file_browser||echo failed
fi
cp README $destdir$datadir/kies/file_browser/.

echo "installing database front end"
cd ../database
cp kies_createtab $destdir$bindir
cp kies_createtab.1 $destdir$mandir/man1||echo "man page installation failed"

if (test ! -d $destdir$datadir/kies/database)
then mkdir -p $destdir$datadir/kies/database||echo failed
fi
cp README $destdir$datadir/kies/database/.
cp config.php $destdir$datadir/kies/database/.
cp adodb468.tgz $destdir$datadir/kies/database/.
echo 'to proceed, type "man kies" without quotes and press enter.'

