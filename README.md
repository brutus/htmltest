# Dockerized HTMLTest

This image holds a comiled [HTMLTest] binary.

## Usage

```shell
docker run --rm registry.uberspace.is/uberspace/homepage/htmltest --help
```

You can see <https://github.com/wjdp/htmltest#wrench-configuration> for more.

## Example

Check HTML files in a `./public/` directory, ignoring checks for external stuff:

```shell
docker run --rm \
	--volume "$(pwd)":/docs --workdir /docs \
	registry.uberspace.is/uberspace/homepage/htmltest --skip-external public
```

### CI

You can also run this from the CI:

```yaml
htmltest:
    stage: test
image: registry.uberspace.is/uberspace/homepage/htmltest
```

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

[htmltest]: https://github.com/wjdp/htmltest
