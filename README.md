# Dockerized HTMLTest

This image holds a compiled [HTMLTest] binary.

## Usage

```shell
docker run --rm registry.uberspace.is/uberspace/homepage/htmltest:master --help
```

The _entry point_ is `/bin/htmltest`, the _working directory_ `/var/www`.

You can see <https://github.com/wjdp/htmltest#wrench-configuration> for more.

## Configuration

The default configuration files is read from `.htmltest.yml`, .e.g.:

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
	registry.uberspace.is/uberspace/homepage/htmltest:master --skip-external public
```

### CI

You can also run this from the CI:

```yaml
htmltest:
    stage: test
image: registry.uberspace.is/uberspace/homepage/htmltest
```

[htmltest]: https://github.com/wjdp/htmltest
