# CLI's

## From brew/macports

- [cheat](https://github.com/cheat/cheat) - used by [cht.sh]()<br>
  bonus: allows custom dirs `cheat -d` for `work` and `personal` use
- [tldr](https://dbrgn.github.io/tealdeer/) - used by [cht.sh]()

## Outside brew/macports

!!! info "not in"
    - [macos/macports.txt]({{ repo_url_to("macos/macports.txt") }})
    - [macos/brew.txt]({{ repo_url_to("macos/brew.txt") }})
    - [apps](apps.md)

- [`gcloud`](https://cloud.google.com/sdk/docs/install) and `kubectl`
```sh
mv ~/Download/google-cloud-sdk ~/env/
cd ~/env
./google-cloud-sdk/install.sh
gcloud components install kubectl
```
- `krew` plugins
```shell
kubectl krew update
kubectl krew install rbac-tool # kubectl krew list
```
- [cht.sh](https://github.com/chubin/cheat.sh#installation)
```shell
curl https://cht.sh/:cht.sh > "$BIN_DIR/cht.sh"
chmod +x "$BIN_DIR/cht.sh"
```

### go tools
```shell
# dlv/delve via ports
# https://pkg.go.dev/golang.org/x/pkgsite/cmd/pkgsite
go install golang.org/x/pkgsite/cmd/pkgsite@master
go install golang.org/x/tools/go/analysis/passes/fieldalignment/cmd/fieldalignment@latest
go install golang.org/x/tools/cmd/goimports@latest
# https://go.dev/blog/govulncheck
go install golang.org/x/vuln/cmd/govulncheck@latest

#https://pkg.go.dev/golang.org/x/exp
go install golang.org/x/exp/cmd/gorelease@latest
go install golang.org/x/exp/cmd/apidiff@latest
```

### env/bin
drop-in binaries

- [pack](https://github.com/buildpacks/pack/releases)
- [gh](https://cli.github.com/)
