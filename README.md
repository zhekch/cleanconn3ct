# CleanConn3ct

## Building the binary

Run `./development/export.sh` to build the project using PyInstaller. The binary
and required `modules` directory will be placed in the `deploy` folder.

## macOS autostart

To generate a LaunchAgent plist, execute:

```bash
./development/create_launch_agent.sh
```

Copy the generated plist from the `deploy` directory to
`~/Library/LaunchAgents` and load it with `launchctl`:

```bash
cp deploy/cleanconn3ct.plist ~/Library/LaunchAgents/
launchctl load ~/Library/LaunchAgents/cleanconn3ct.plist
```

The main application writes a timestamp to `~/Downloads/example.txt` every hour
and checks for updates daily.


