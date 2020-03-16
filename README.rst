Manage a Linux package distribution mirror
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

All mirrors require an operationnal Traefik instance that you can setup with::

    bigsudo yourlabs.traefik @your.example.com

Example setting up an arch linux mirror::

    bigsudo yourlabs.mirror home=/home/arch template=arch.sh url=https://arch.example.com @your.example.com

Alpine linux::

    bigsudo yourlabs.mirror home=/home/alpine template=alpine.sh url=https://alpine.example.com @your.example.com

An uninstall script is also available, it will require the home argument::

    bigsudo yourlabs.mirror uninstall home=/home/arch
