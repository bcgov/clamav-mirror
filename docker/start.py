#!/usr/bin/python3

import os
import concurrent.futures

# Run a filesystem oldscan every day unless one is in progress.
os.system("echo \"$(($RANDOM % 60))   *   *   *   *   /entrypoint.sh update > /proc/1/fd/1 2>&1\" > /root.crontab")
os.system("fcrontab -u root /root.crontab")
os.system("rm /root.crontab")

# Run cron
def systemrun(run):
    os.system(run)


with concurrent.futures.ThreadPoolExecutor(max_workers=5) as executor:
    runner = ["/usr/sbin/fcron -f", "/entrypoint.sh serve"]
    executor.map(systemrun, runner)