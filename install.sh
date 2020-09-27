#!/bin/bash

# CHECK PERMISSION AND DIRECTORY
if [ ! $UID -eq 0 ]; then
	echo "Permission denied."
	exit 1
elif [ ! -d /usr/share/plymouth/themes ]; then
	echo "Please setup plymouth."
	exit 1
fi

if [ ! $1 ]; then
	echo "Please choose theme at least one."
	echo "Example: ~# install.sh paper-town"
	exit 1
fi

SCRIPT_DIR=$(cd $(dirname $0); pwd)

for ((i=1; i <= $#; i++)); do
	case ${!i} in

		# INSTALL paper-town
		"paper-town" ) \
		rm -rf /usr/share/plymouth/themes/paper-town ; \
		mkdir /usr/share/plymouth/themes/paper-town && \
		cp $SCRIPT_DIR/paper-town/intro/* /usr/share/plymouth/themes/paper-town/ && \
		cp $SCRIPT_DIR/paper-town/loop/* /usr/share/plymouth/themes/paper-town/ && \
		cp $SCRIPT_DIR/paper-town/misc/* /usr/share/plymouth/themes/paper-town/ && \
		echo "installing paper-town ......" && plymouth-set-default-theme -R paper-town >/dev/null 2>&1 && \
		echo "INSTALL paper-town DONE !!!!" || echo "ERROR HAS OCCURRED !!" ;;


	esac
done

exit
