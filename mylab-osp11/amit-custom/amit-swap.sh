# As root - create 4GB swap
free
dd if=/dev/zero of=/swapfile bs=1024 count=4000000
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
free
echo "/swapfile   swap    swap    sw  0   0" >> /etc/fstab
