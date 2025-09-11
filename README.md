# mhguix

## TODO
All packages that need configuration will be installed via a service that also installs their configuration (as well as potentially other helper packages).

The configuration for kmonad/kanata and emacs will be written in separate .kbd and .el files tangled from constellation. Either packages will be provided for the installation of these configuration files and included in the kmonad/kanata and emacs installation services, or the kmonad/kanata and emacs packages will be modified to install those config files along with the package itself.

The kmonad/kanata system services option will be modified to include the installation of kmonad/kanata along with its configuration in /root/.config/kmonad/config.kbd.
