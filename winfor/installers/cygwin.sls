# Name: Cygwin
# Website: https://cygwin.com
# Description: Linux Terminal Emulator for Windows
# Category: Terminals
# Author: https://cygwin.com/faq.html#faq.what.who
# License: GNU General Public License (GPL) (https://cygwin.com/licensing.html)
# Version: 3.3.4-2
# Notes: Retcode below is set to '2' for success because the Cygwin installer
# (even though on Windows) attempts to search for /etc/setup/setup.rc
# or /etc/setup/installed.db and fails with retcode 2. This causes
# Saltstack to read an ERROR and result: False, even though the pkg state
# returns 'install success'.

{% set hash = 'c0a26f4693ba25cc2039033126b0d95ac0f6fbc833b84857fdfa4ab11fd79411' %}

cygwin:
  file.managed:
    - name: 'C:\salt\tempdownload\setup-x86_64.exe'
    - source: https://cygwin.com/setup-x86_64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

cygwin-install:
  cmd.run:
    - name: 'C:\salt\tempdownload\setup-x86_64.exe -R C:\cygwin64\ -d -X -l C:\cygwin64\ -q -O -s https://mirror.csclub.uwaterloo.ca/cygwin/'
    - shell: cmd
    - success_retcodes: 2
