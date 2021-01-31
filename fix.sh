 #!/bin/bash

[ $UID != 0 ] && { echo "run it as root privs" ; exit 1 ;}

for i in $( seq 1 "$(ls /boot/ | grep "$(uname -r)" | wc -l)" ) ; do
    cp "/boot/$(ls /boot/ | grep "$(uname -r)" |  awk "NR==${i}")" "/boot/$(ls /boot/ | grep "$(uname -r)" | sed "s/$(uname -r)/linux/g" | awk "NR==${i}")"
done
mkinitcpio -p linux && grub-mkconfig -o /boot/grub/grub.cfg 
