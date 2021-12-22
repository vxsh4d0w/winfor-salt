{% set version = '21.5' %}

mobaxterm:
  file.managed:
    - name: C:\\salt\\tempdownload\\MobaXterm_Installer_v{{ version }}.zip
    - source: "https://download.mobatek.net/2152021112100754/MobaXterm_Installer_v{{ version }}.zip"
    - source_hash: sha256=70ed54fb1471e473e982a7cca11e948fbc582bd1b4c133a29594d1ef00613601
    - makedirs: True

mobaxterm-archive:
  archive.extracted:
    - name: C:\\salt\\tempdownload\\mobaxterm
    - source: C:\\salt\\tempdownload\\MobaXterm_Installer_v{{ version }}.zip
    - enforce_toplevel: False
    - watch:
      - file: mobaxterm

mobaxterm-install:
  cmd.run:
    - name: "msiexec C:\\salt\\tempdownload\\mobaxterm\\MobaXterm_installer_{{ version }}.msi /qn /norestart"
    - cwd: 'C:\\salt\\tempdownload\\mobaxterm\\'
    - shell: cmd
