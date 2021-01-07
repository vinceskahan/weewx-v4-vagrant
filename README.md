# PLEASE DO NOT USE THIS REPO (deprecated)
## USE MY 'weewx-vagrant' REPO INSTEAD !!!!!


### Weewx version4 python3 quick install for Vagrant/VirtualBox

This installs weewx v4 alpha from git, plus my extensions, in simulator mode.  The provision.sh script also installs a few of my personal weewx extensions, mainly so I can validate them also under python3.   You can use the provision.sh script (with a little light editing) as a baseline for how to quickly install weewx in simulator mode,'

Reminder - weewx v4 is 'alpha' and totally 'unsupported' at this time.

Usual weewx care+feeding applies:

* install any extensions normally via wee_extension
* if you change the station_type:
    * stop weewx
    * delete your archive/weewx.sdb file
    * delete the contents of your public_html tree
    * start weewx and it'll come up cleanly as usual


