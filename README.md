Gentoo Overlay
==============

These are a couple simple ebuilds I have cooked up for a few projects that I
work on or use that aren't in the portage tree.  The ebuilds Work For Me, use
at your own risk.

To use, copy flacjacket.xml to `/etc/layman/overlays/`, run `layman -S`, then
`layman -a flacjacket`.

sets
----

In `sets` are various package sets to make installing things easier

* `core`: Some core packages to go on top of a stage 3 installation
* `firefox`: Firefox with some plugins
* `fonts`: ...fonts
* `portage`: Useful portage utilities
* `python`: Python libraries and development packages
* `qtile`: Basic dependencies for installing Qtile, with and some other handy
  X packages
* `stage4`: Graphical packages to complete installation
* `X`: Basic xorg packages
