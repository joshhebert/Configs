Configs
=======
All of my configuration files for my environment

Setting it all up
=======
    1. Packages
       Depending on the distro, run ./dist/packages/{dist}.pkg as root
       This will install the packages that I eiher use, or my environment
       depends upon.
    2. Deploy
       In order to put my configs in the correct place, as well as make it
       easy to update across my devices, link.sh will place symbolic links in
       the home folder to this folder. Run that and let it do its thing
    3. Zsh
       Load up zsh. Antigen should install all of the zsh plugins I use.
       Pretty easy
    4. Vim
       Load up Vim and run :PlugInstall. This will pull down all the Vim
       plugins/conf I use.

Everything should now be set

