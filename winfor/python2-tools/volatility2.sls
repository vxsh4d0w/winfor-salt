# Name: Volatility
# Website: https://github.com/volatilityfoundation/volatility
# Description: Memory analysis toolset
# Category: Windows Analysis
# Author: https://github.com/volatilityfoundation/volatility/blob/master/AUTHORS.txt
# License: GNU General Public License v2 (https://github.com/volatilityfoundation/volatility/blob/master/LICENSE.txt)
# Version: 2
# Notes: 

include:
  - winfor.packages.python2
  - winfor.python2-tools.py2-pycryptodome
  - winfor.python2-tools.distorm3

volatility:
  pip.installed:
    - name: git+https://github.com/volatilityfoundation/volatility
    - bin_env: 'C:\Python27\python.exe'
    - require:
      - sls: winfor.packages.python2
      - sls: winfor.python2-tools.py2-pycryptodome
      - sls: winfor.python2-tools.distorm3

volatility2-wrapper:
  file.managed:
    - name: 'C:\Python27\Scripts\vol2.cmd'
    - win_inheritance: True
    - contents:
      - '@echo off'
      - 'C:\Python27\python.exe C:\Python27\Scripts\vol.py %*'

volatility2-env-vars:
  win_path.exists:
    - name: 'C:\Python27\Scripts\'
