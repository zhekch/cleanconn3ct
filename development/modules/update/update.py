import requests
import json
from packaging import version
import os


VERSION_URL = ".../version.json"


def check_for_update(current_version):
    try:
        r = requests.get(VERSION_URL, timeout=3)
        r.raise_for_status()
        data = r.json()

        latest_version = data.get("version")
        if latest_version is None:
            print("Version field not found in JSON.")
            return

        # For float comparison (safest if you use numbers like 0.1, 1.2, etc.)
        if version.parse(str(latest_version)) > version.parse(str(current_version)):
            print(f"Update available! Latest version: {latest_version}")
        else:
            print("Up to date.")
    except Exception as e:
        print(f"Could not check for update: {e}")


if __name__ == "__main__":
    this_dir = os.path.dirname(__file__)
    ver_file = os.path.join(this_dir, "version.json")
    with open(ver_file) as f:
        ver = json.load(f)["version"]
    check_for_update(ver)
