---
description: Use NSO's embedded web server to deliver dynamic content.
---

# Web Server

This page describes an embedded basic web server that can deliver static and Common Gateway Interface (CGI) dynamic content to a web client, commonly a browser. Due to the limitations of this web server, and/or of its configuration capabilities, a proxy server such as Nginx is recommended to address special requirements.

## Web Server Capabilities <a href="#d5e8815" id="d5e8815"></a>

The web server can be configured through settings in `ncs.conf` . See the [Manual Pages](../../man/section5.md#configuration-parameters) section Configuration Parameters.

Here is a brief overview of what you can configure on the web server:

* `toggle web server`: the web server can be turned on or off.
* `toggle transport`: enable HTTP and/or HTTPS, set IPs, ports, redirects, certificates, etc.
* `hostname`: set the hostname of the web server and decide whether to block requests for other hostnames.
* `/`: set the `docroot` from where all static content is served.
* `/login`: set the `docroot` from where static content is served for URL paths starting with `/login`.
* "/custom": set the `docroot` from where static content is served for URL paths starting with `/custom`.
* `/cgi`: toggle CGI support and set the `docroot` from where dynamic content is served for URL paths starting with `/cgi`.
* `non-authenticated paths`: by default, all URL paths, except those needed for the login page are hidden from non-authenticated users; authentication is done by calling the JSON-RPC `login` method.
* `allow symlinks`: Allow symlinks from under the `docroot`.
* `cache`: set the cache time window for static content.
* `log`: several logs are available to configure in terms of file paths - an access log, a full HTTP traffic/trace log, and a browser/JavaScript log.
* `custom headers`: set custom headers across all static and dynamic content, including requests to `/jsonrpc`.

In addition to what is configurable, the web server also GZip-compresses responses automatically if the browser handles such responses, either by compressing the response on the fly or, if requesting a static file, like `/bigfile.txt`, by responding with the contents of `/bigfile.txt.gz`, if there is such a file.

## CGI Support <a href="#d5e8848" id="d5e8848"></a>

The web server includes CGI functionality, disabled by default. Once you enable it in `ncs.conf` (see Configuration Parameters in [Manual Pages](../../man/section5.md#configuration-parameters)), you can write CGI scripts, that will be called with the following NSO environment variables prefixed with NCS\_ when a user has logged in via JSON-RPC:

* `JSONRPC_SESSIONID`: the JSON-RPC session id (cookie).
* `JSONRPC_START_TIME`: the start time of the JSON-RPC session.
* `JSONRPC_END_TIME`: the end time of the JSON-RPC session.
* `JSONRPC_READ`: the latest JSON-RPC read transaction.
* `JSONRPC_READS`: a comma-separated list of JSON-RPC read transactions.
* `JSONRPC_WRITE`: the latest JSON-RPC write transaction.
* `JSONRPC_WRITES`: a comma-separated of JSON-RPC write transactions.
* `MAAPI_USER`: the MAAPI username.
* `MAAPI_GROUPS`: a comma-separated list of MAAPI groups.
* `MAAPI_UID`: the MAAPI UID.
* `MAAPI_GID`: the MAAPI GID.
* `MAAPI_SRC_IP`: the MAAPI source IP address.
* `MAAPI_SRC_PORT`: the MAAPI source port.
* `MAAPI_USID`: the MAAPI USID.
* `MAAPI_READ`: the latest MAAPI read transaction.
* `MAAPI_READS`: a comma-separated list of MAAPI read transactions.
* `MAAPI_WRITE`: the latest MAAPI write transaction.
* `MAAPI_WRITES`: a comma-separated of MAAPI write transactions.

Server or HTTP-specific information is also exported as environment variables:

* `SERVER_SOFTWARE:`
* `SERVER_NAME:`
* `GATEWAY_INTERFACE:`
* `SERVER_PROTOCOL:`
* `SERVER_PORT:`
* `REQUEST_METHOD:`
* `REQUEST_URI:`
* `DOCUMENT_ROOT:`
* `DOCUMENT_ROOT_MOUNT:`
* `SCRIPT_FILENAME:`
* `SCRIPT_TRANSLATED:`
* `PATH_INTO:`
* `PATH_TRANSLATED:`
* `SCRIPT_NAME:`
* `REMOTE_ADDR:`
* `REMOTE_HOST:`
* `SERVER_ADDR:`
* `LOCAL_ADDR:`
* `QUERY_STRING:`
* `CONTENT_TYPE:`
* `CONTENT_LENGTH:`
* `HTTP_*"`: HTTP headers e.g. "Accept" value exported as `HTTP_ACCEPT`.

## Storing TLS Data in the Database <a href="#ug.webserver.tls_data_in_db" id="ug.webserver.tls_data_in_db"></a>

The `tailf-tls.yang` YANG module defines a structure to store TLS data in the database. It is possible to store the private key, the private key's passphrase, the public key certificate, and CA certificates.

To enable the web server to fetch TLS data from the database, `ncs.conf` needs to be configured.

{% code title="Configuring NSO to Read TLS Data from the Database." %}
```xml
<webui>
  <transport>
    <ssl>
      <enabled>true</enabled>
      <ip>0.0.0.0</ip>
      <port>8889</port>
      <read-from-db>true</read-from-db>
    </ssl>
  </transport>
</webui>
```
{% endcode %}

Note that the options `key-file`, `cert-file`, and `ca-cert-file`, are ignored when `read-from-db` is set to true. See the ncs.conf.5 man page for more details.

The database is populated with TLS data by configuring the `/tailf-tls:tls/private-key, /tailf-tls:tls/certificate`, and, optionally, `/tailf-tls/ca-certificates`. It is possible to use password-protected private keys, then the _passphrase_ leaf in the `private-key` container needs to be set to the password of the encrypted private key. Unencrypted private key data can be supplied in both PKCS#8 and PKCS#1 format, while encrypted private key data needs to be supplied in PKCS#1 format.

In the following example a password-protected private key, the passphrase, a public key certificate, and two CA certificates are configured with the CLI.

{% code title="Populating the Database with TLS data" %}
```
          
admin@io> configure
Entering configuration mode private
[ok][2019-06-10 19:54:21]

[edit]
admin@io% set tls certificate cert-data
(<unknown>):
[Multiline mode, exit with ctrl-D.]
> -----BEGIN CERTIFICATE-----
> MIICrzCCAZcCFBh0ETLcNAFCCEcjSrrd5U4/a6vuMA0GCSqGSIb3DQEBCwUAMBQx
> ...
> -----END CERTIFICATE-----
>
[ok][2019-06-10 19:59:36]

[edit]
admin@confd% set tls private-key key-data
(<unknown>):
[Multiline mode, exit with ctrl-D.]
> -----BEGIN RSA PRIVATE KEY-----
> Proc-Type: 4,ENCRYPTED
> DEK-Info: AES-128-CBC,6E816829A93AAD3E0C283A6C8550B255
> ...
> -----END RSA PRIVATE KEY-----
[ok][2019-06-10 20:00:27]

[edit]
admin@confd% set tls private-key passphrase
(<AES encrypted string>): ********
[ok][2019-06-10 20:00:39]

[edit]
admin@confd% set tls ca-certificates ca-cert-1 cert-data
(<unknown>):
[Multiline mode, exit with ctrl-D.]
> -----BEGIN CERTIFICATE-----
> MIIDCTCCAfGgAwIBAgIUbzrNvBdM7p2rxwDBaqF5xN1gfmEwDQYJKoZIhvcNAQEL
> ...
> -----END CERTIFICATE-----
[ok][2019-06-10 20:02:22]

[edit]
admin@confd% set tls ca-certificates ca-cert-2 cert-data
(<unknown>):
[Multiline mode, exit with ctrl-D.]
> -----BEGIN CERTIFICATE-----
> MIIDCTCCAfGgAwIBAgIUZ2GcDzHg44c2g7Q0Xlu3H8/4wnwwDQYJKoZIhvcNAQEL
> ...
> -----END CERTIFICATE-----
[ok][2019-06-10 20:03:07]

[edit]
admin@confd% commit
Commit complete.
[ok][2019-06-10 20:03:11]

[edit]
```
{% endcode %}

The SHA256 fingerprints of the public key certificate and the CA certificates can be accessed as operational data. The fingerprint is shown as a hex string. The first octet identifies what hashing algorithm is used, _04_ is SHA256, and the following octets is the actual fingerprint.

{% code title="Show TLS Certificate Fingerprints" %}
```
          
admin@io> show tls
tls certificate fingerprint 04:65:8a:9e:36:2c:a7:42:8d:93:50:af:97:08:ff:e6:1b:c5:43:a8:2c:b5:bf:79:eb:be:b4:70:88:96:40:22:fd
NAME      FINGERPRINT
--------------------------------------------------------------------------------------------------------------
cacert-1  04:00:5e:22:f8:4b:b7:3a:47:e7:23:11:80:03:d3:9a:74:8d:09:c0:fa:cc:15:2b:7f:81:1a:e6:80:aa:a1:6d:1b
cacert-2  04:2d:93:9b:37:21:d2:22:74:ad:d9:99:ae:76:b6:6a:f2:3b:e3:4e:07:32:f2:8b:f0:63:ad:21:7d:5e:db:92:0a

[ok][2019-06-10 20:43:31]
```
{% endcode %}

\
When the database is populated, NSO needs to be reloaded.

```bash
          
$ ncs --reload
```

After configuring NSO, populating the database, and reloading, the TLS transport is usable.

```bash
          
$ curl -kisu admin:admin https://localhost:8889
HTTP/1.1 302 Found
...
```

## Package Upload <a href="#ug.webserver.package-upload" id="ug.webserver.package-upload"></a>

The web server includes support for uploading packages to `/package-upload` using `HTTP POST` from the local host to the NSO host, making them installable there. It is disabled by default but can be enabled in `ncs.conf`; see Configuration Parameters in [Manual Pages](../../man/section5.md#configuration-parameters).

By default, only uploading 1 file per request will be processed and any remaining file parts after that will result in an error and its content will be ignored. To allow multiple files in a request you can increase `/ncs-config/webui/package-upload/max-files`.

{% code title="Valid Package Example" %}
```bash
curl \
    --cookie 'sessionid=sess12541119146799620192;' \
    -X POST \
    -H "Cache-Control: no-cache" \
    -F "upload=@path/to/some-valid-package.tar.gz" \
    http://127.0.0.1:8080/package-upload
[
    {
        "result": {
            "filename": "some-valid-package.tar.gz"
        }
    }
]
```
{% endcode %}

{% code title="Invalid Package Example" %}
```bash
curl \
    --cookie 'sessionid=sess12541119146799620192;' \
    -X POST \
    -H "Cache-Control: no-cache" \
    -F "upload=@path/to/some-invalid-package.tar.gz" \
    http://127.0.0.1:8080/package-upload
[
    {
        "error": {
            "filename": "some-invalid-package.tar.gz",
            "data": {
                "reason": "Invalid package contents"
            }
        }
    }
]
```
{% endcode %}

The AAA infrastructure can be used to restrict access to library functions using command rules:

```xml
<cmdrule xmlns="http://tail-f.com/yang/acm">
<name>deny-package-upload</name>
<context>webui</context>
<command>::webui:: package-upload</command>
<access-operations>exec</access-operations>
<action>deny</action>
</cmdrule>
```

Note how the command is prefixed with `::webui::`. This tells the AAA engine to apply the command rule to WebUI API functions. You can read more about command rules in [AAA infrastructure](../../administration/management/aaa-infrastructure.md).
