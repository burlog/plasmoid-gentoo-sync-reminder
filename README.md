# plasmoid-gentoo-sync-reminder
KDE5 Plasmoid that show days since last portage sync

## Dependencies

 * Plasma 5 (Plasma Shell)
 * Plasma Framework Development Package (for installing)

# Installation

Installation is pretty simple and straight forward:

```shell
$ git clone https://github.com/burlog/plasmoid-gentoo-sync-reminder.git plasmoid-gentoo-sync-reminder
$ cd plasmoid-gentoo-sync-reminder
$ plasmapkg2 -t plasmoid -i ./plasmoid
```

After installation you can find the plasmoid in widgets list and installed
files in `~/.local/share/plasma/plasmoids/com.github.burlog.plasmoid-gentoo-sync-reminder/`.

# Devel

If you want to preview the plasmoid during dev just type this:

```shell
$ git clone https://github.com/burlog/plasmoid-gentoo-sync-reminder.git plasmoid-gentoo-sync-reminder
$ cd plasmoid-gentoo-sync-reminder
$ plasmoidviewer --applet ./plasmoid
```

# License

The gentoo-sync-reminder plasmoid is licensed under the GNU General Public License Version 2 or later.

You can modify or/and distribute it under the conditions of this license.

