# Name: Magnet RESPONSE
# Website: https://magnetforensics.com
# Description: Tool to collect data relevant to incident response investigations
# Category: Acquisition and Analysis
# Author: Magnet Forensics
# License: EULA
# Version: 1.5
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '1E85425B325AEB60DCF954A7F35A156E8F2FFF28907FDB36B456CF00381A21A1' %}
{% set version = '150' %}

magnet-response-download-only:
  file.managed:
    - name: '{{ downloads }}\MagnetRESPONSEv{{ version }}.zip'
    - source: https://storage.googleapis.com/mfi-files/free_tools/MagnetRESPONSE/MagnetRESPONSEv{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True