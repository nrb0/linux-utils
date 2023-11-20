## Copy-saves
A config file needs to be created in `~/.config/nrbo/copy-saves` with the name `config.json`
Here's an example of a config file
```
{
    "backups": [
        {
            "name": "Baldur's Gate 3",
            "source": "/home/adrien/.var/app/com.usebottles.bottles/data/bottles/bottles/Baldur's-Gate-3/drive_c/users/adrien/AppData/Local/Larian Studios/Baldur's Gate 3",
            "destination": "/Saves/Baldur's Gate 3",
            "rclone-config": {
                "remote": "tetra",
                "sftp-path-override": "/volume1/Saves/Baldur's Gate 3"
            }
        }
    ]
}
```

`rclone` must have been configured with the remote target and ran at least once with the `--resync` argument before the tool can actually be used, Otherwise it requires special handling to create the initial directory on the remote location.

Here's an example of how the tool should be first ran:
```
rclone bisync -v --resync "/home/adrien/.var/app/com.usebottles.bottles/data/bottles/bottles/Baldur's-Gate-3/drive_c/users/adrien/AppData/Local/Larian Studios/Baldur's Gate 3/" tetra:/Saves/Baldur\'s\ Gate\ 3 --sftp-path-override /volume1/Saves/Baldur\'s\ Gate\ 3
```

The `sftp-path-override` is necessary for synology paths since they differ between ssh and sftp.