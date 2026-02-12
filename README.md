## How to run it

### Run the following scripts

```bash
certs/simple-setup-certs
certs/create-chain
auto/start-server
```

### Trust Root CA

Add `certs/root-ca.pem` to keychain

### Validate Cert

```shell
curl --write-out %{certs} https://www.bqliu.com
```
