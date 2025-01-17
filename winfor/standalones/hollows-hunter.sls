# Name: hollows_hunter
# Website: https://github.com/hasherezade/hollows_hunter
# Description: Scans running processes for implants and dumps them if found
# Category: Executables
# Author: hasherezade
# License: BSD 2-Clause Simplified License (https://github.com/hasherezade/hollows_hunter/blob/master/LICENSE)
# Version: 0.3.5
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '0.3.5' %}
{% set hash = 'b7117f3e7f8b921914c8e0c9649560067a17343369cd581db75b1145ad581bb9' %}

hollows-hunter-download:
  file.managed:
    - name: '{{ inpath }}\hollows-hunter\hollows-hunter.exe'
    - source: https://github.com/hasherezade/hollows_hunter/releases/download/v{{ version }}/hollows_hunter64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

hollows-hunter-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\hollows-hunter\'
