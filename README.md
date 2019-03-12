# Dockerized HTMLTest

This image holds a compiled [HTMLTest] binary.

## Usage

```shell
docker run --rm registry.uberspace.is/uberspace/homepage/htmltest --help
```

The _entry point_ is `/bin/htmltest`, the _working directory_ `/var/www`.

You can see <https://github.com/wjdp/htmltest#wrench-configuration> for more.

## Configuration

The default configuration is read from `.htmltest.yml` if available, .e.g.:

```yaml
# .htmltest.yml
DirectoryPath: public
CheckExternal: true
CheckFavicon: true
EnforceHTML5: true
EnforceHTTPS: true
IgnoreInternalEmptyHash: true
```

## Example

Check HTML files in a `./public/` directory, ignoring checks for external stuff:

```shell
docker run --rm \
	--volume "$(pwd)":/var/www \
	registry.uberspace.is/uberspace/homepage/htmltest --skip-external public
```

### CI

You can also run this from the CI, for that use the `alpine` tag:

```yaml
test-html:
  stage: test
  image:
    name: registry.uberspace.is/uberspace/homepage/htmltest:alpine
    entrypoint: [""]
  script:
    - /bin/htmltest
```

[htmltest]: https://github.com/wjdp/htmltest
