all: build

build:
	gcc -fPIC -fno-stack-protector -c pam_validity.c
	ld -x --shared -o /usr/lib64/security/pam_validity.so pam_validity.o

build-debug:
	gcc -fPIC -fno-stack-protector -c pam_validity_debug.c
	ld -x --shared -o /usr/lib64/security/pam_validity_debug.so pam_validity_debug.o

post-install:
	cp pam_validity.sh /usr/share/python-validity/playground/pam_validity.sh

set-permissions:
	chmod +r /sys/class/dmi/id/product_serial
	chmod +r /sys/class/dmi/id/product_name

set-udev-rules:
	echo 'ATTRS{idVendor}=="06cb", ATTRS{idProduct}=="009a", MODE="0666"' > /etc/udev/rules.d/10-fpreader.rules

reload-udev-rules:
	udevadm control --reload-rules && udevadm trigger