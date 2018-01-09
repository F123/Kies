Kies, the menu system for creation of a text-only desktop type environment.
(C) copyright Meraka Institute, 
 Meraka, CSIR, P.O. Box 395, Pretoria, 0001, South Africa 
EMAIL: Willem van der Walt wvdwalt@csir.co.za
Web: http://www.meraka.org.za


*******************************************************************************

This program is free software; you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation; either version 3 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU General Public License for more details (file
COPYING in the root directory).

You should have received a copy of the GNU General Public License along with
this program; if not, write to the Free Software Foundation, Inc., 675 Mass
Ave, Cambridge, MA 02139, USA.

*******************************************************************************
This is a collection of mainly bash scripts which together forms a
user-friendly, speech-friendly desktop for the Linux/UNIX console.
Note that all of these scripts are developed to be speech-friendly and not
to look good on a screen.  It assumes that a console-based screen-reader is
running and is not self-voicing.
It also should work with Braille through the brltty program 
available from http://mielke.cc/brltty/. This has not
been tested yet.  Extensive testing with speakup,
 available from http://www.linux-speakup.org,  has been done and some
testing with yasr, available from http://yasr.sourceforge.net.
Speakup and yasr are screen-readers for the console.

To install, run ./install.sh from the distribution directory.
Running install.sh --help will show the available options which can be
provided to the installer.
Note: if you have selected to install to a none-standard location
using the --prefix option, you must ensure that the <prefix>/bin directory
is in your path.
After successful installation, do man kies for instructions, or read the
different README files.


The menu system itself is in the directory menu_system, the directory
kies_wrappers contain wrapper scripts for many Linux command-line commands.
Example menus can be found in the sub-directory menus under menu_system.
Note that the installation script does not check if the programs called from
the sample menus are actually installed.

The file_browser directory contain the pickafile file browser.
The database directory contains the createtab database creation script.
Each of these directories has their own README file giving more detail.
These scripts all assume the availability of standard UNIX commands like
fgrep, ls, sed, bc, wc etc.
Please send comments, suggestions and bugs to me at:
wvdwalt@csir.co.za
