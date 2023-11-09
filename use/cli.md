# CLI

- [cht.sh](https://github.com/chubin/cheat.sh#installation)
```shell
curl https://cht.sh/:cht.sh > "$BIN_DIR/cht.sh"
chmod +x "$BIN_DIR/cht.sh"
```

## from macports

- [cheat](https://github.com/cheat/cheat) (also used by [cht.sh]())
  - bonus: allows custom dirs `cheat -d` for `work` and `personal` use    
- [tldr](https://dbrgn.github.io/tealdeer/) (also used by [cht.sh]())

## outside macports

Items not found in [macports](macports.txt) nor in [apps](apps.md)

- [gcloud](https://cloud.google.com/sdk/gcloud#download_and_install_the) and `kubectl` 
```sh
mv ~/Download/google-cloud-sdk ../env/
cd env
./google-cloud-sdk/install.sh
gcloud components install kubectl
```
- 

## env/bin/
drop-in binaries 

- [pack](https://github.com/buildpacks/pack/releases)
- [gh](https://cli.github.com/)
