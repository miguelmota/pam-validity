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
	sudo chmod +r /sys/class/dmi/id/product_serial
	sudo chmod +r /sys/class/dmi/id/product_name

reload-udev-rules:
	sudo udevadm control --reload-rules && udevadm trigger