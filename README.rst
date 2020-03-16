

Example setting up an arch linux mirror::

    bigsudo yourlabs.traefik @arch.example.com
    bigsudo yourlabs.mirror @arch.example.com

Or, in non-interactive::

    bigsudo yourlabs.mirror home=/home/arch template=arch.sh url=https://arch.example.com @arch.example.com

Uninstall::

    bigsudo yourlabs.mirror uninstall home=/home/arch
