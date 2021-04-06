#!/bin/sh
/bin/sh /share/CACHEDEV2_DATA/WillBackupDataDir2/autorun/inotify_syncthing.sh
echo "*/5 * * * * /bin/sh /share/CACHEDEV2_DATA/WillBackupDataDir2/autorun/refresh_qsirch.sh" >> /etc/config/crontab

/bin/cp -f /share/CACHEDEV2_DATA/WillBackupDataDir2/autorun/apache-file.conf /etc/default_config/apache-file.conf
/etc/init.d/thttpd.sh restart

/bin/ln -s /share/CACHEDEV2_DATA/WillBackupDataDir2/autorun /root/autorun

