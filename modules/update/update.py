import requests
import json
from packaging import version


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


check_for_update(json.load(open("modules/update/version.json"))["version"])
