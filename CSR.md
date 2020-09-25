### Create CSR using OpenSSL Without Prompt (Non-Interactive)

- CSR (Certificate Signing Request)

#### Create CSR and Key Without Prompt using OpenSSL

Use the following command to create a new private key 2048 bits in size `example.key` and generate CSR `example.csr` from it:

```bash
$ openssl req -nodes -newkey rsa:2048 -keyout example.key -out example.csr -subj "/C=GB/ST=London/L=London/O=Global Security/OU=IT Department/CN=example.com"
```

| Option | Description |
| --- | --- |
| openssl req | certificate request generating utility |
| -nodes | if a private key is created it will not be encrypted |
| -newkey | creates a new certificate request and a new private key |
| rsa:2048 | generates an RSA key 2048 bits in size |
| -keyout | the filename to write the newly created private key to |
| -out | specifies the output filename |
| -subj | sets certificate subject |

#### Generate CSR From the Existing Key using OpenSSL

Use the following command to generate CSR `example.csr` from the private key `example.key`:

```bash
$ openssl req -new -key example.key -out example.csr -subj "/C=GB/ST=London/L=London/O=Global Security/OU=IT Department/CN=example.com"
```

| Option | Description |
| --- | --- |
| openssl req | certificate request generating utility |
| -new | generates a new certificate request |
| -key | specifies the file to read the private key from |
| -out | specifies the output filename |
| -subj | sets certificate subject |

#### Automated Non-Interactive CSR Generation

`-subj` option

Replaces subject field of input request with specified data and outputs modified request. The arg must be formatted as `/type0=value0/type1=value1/type2=…`, characters may be escaped by \ (backslash), no spaces are skipped.

| Field | Meaning | Example |
| --- | --- | --- |
| /C= | Country | GB |
| /ST= | State | London |
| /L= | Location | London |
| /O= | Organization | Global Security |
| /OU= | Organizational Unit | IT Department |
| /CN= | Common Name | example.com |
