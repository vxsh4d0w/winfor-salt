# Name: bitsparser
# Website: https://github.com/digitalsleuth/bitsparser
# Description: A python tool to parse Windows BITS database files
# Category: Windows Analysis
# Author: Corey Forman / FireEye
# License: Apache License v2.0 (https://github.com/digitalsleuth/BitsParser/blob/master/LICENSE)
# Version: 1.0
# Notes: 

include:
  - winfor.packages.git

bitsparser-clone:
  git.latest:
    - name: https://github.com/digitalsleuth/bitsparser
    - target: 'C:\standalone\bitsparser'
    - rev: master
    - force_clone: True
    - force_reset: True
    - require:
      - sls: winfor.packages.git

bitsparser-requirements:
  pip.installed:
    - requirements: 'C:\standalone\bitsparser\requirements.txt'
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - git: bitsparser-clone

bitsparser-setup:
  win_path.exists:
    - name: 'C:\standalone\bitsparser\'
    - require:
      - pip: bitsparser-requirements
