import time
import os

downloads_path = os.path.join(os.path.expanduser("~"), "Downloads")

while 1:
    file = os.path.join(downloads_path, "example.txt")
    with open(file, "w") as f:
        f.write(time.strftime("%Y-%m-%d %H:%M:%S\n"))
    time.sleep(3600)
