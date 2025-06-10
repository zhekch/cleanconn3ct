import time
import os
import json
import sys

from modules.update import update

downloads_path = os.path.join(os.path.expanduser("~"), "Downloads")
UPDATE_INTERVAL = 60  # * 60 * 24  # daily
last_update_check = 0


def get_version_file():
    if getattr(sys, "frozen", False):
        base_dir = os.path.dirname(sys.executable)
    else:
        base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    return os.path.join(base_dir, "modules", "update", "version.json")


while True:
    if time.time() - last_update_check >= UPDATE_INTERVAL:
        try:
            with open(get_version_file()) as vf:
                current_version = json.load(vf)["version"]
            update.check_for_update(current_version)
        except Exception as e:
            print(f"Failed to check for updates: {e}")
        last_update_check = time.time()

    file = os.path.join(downloads_path, "example.txt")
    with open(file, "w") as f:
        f.write(time.strftime("%Y-%m-%d %H:%M:%S\n"))
    time.sleep(3600)
