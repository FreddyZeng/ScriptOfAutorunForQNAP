#!/bin/sh
/bin/kill -9  `ps -ef | grep inotifywait | grep WillBackupDataDir2 | awk '{print $1}'`
/usr/sbin/inotifywait -d -r -m /share/WillBackupDataDir2/file -o /share/CACHEDEV2_DATA/WillBackupDataDir2/autorun/inotifywait.log -e attrib --exclude "(.stfolder|.stversions|.tmp|.ldb|.log)"
