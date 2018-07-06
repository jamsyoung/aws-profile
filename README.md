# AWS Profile Manager

This started as, and still is, a very dumb shell function.
Right now all it does is:

```bash
$ aws-profile list        # list profiles from ${HOME}/.aws/credentials
$ aws-profile set value   # export AWS_PROFILE as some value
$ aws-profile whoami      # shows all AWS ENVIRONMENT variables
```
