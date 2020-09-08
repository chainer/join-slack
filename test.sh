#!/bin/sh

set -uex

ALIVE_CHAINER="$(perl -ne 'print $1 if m|;url=(.+?)"|' docs/chainer.html)"
ALIVE_CHAINER_JP="$(perl -ne 'print $1 if m|;url=(.+?)"|' docs/chainer-jp.html)"

EXPIRED_CHAINER="https://chainer.slack.com/join/shared_invite/enQtMjk4ODE3NjA4MzM3LTNiMzM4YmY3ZTFjMmE3YWZlY2IzMTg3NGZiMzE2OGExMTExYTcxNzRjNGM3Mjc4ZjY3MjZlOTNlNzZmMTE2M2M"
EXPIRED_CHAINER_JP="https://chainer-jp.slack.com/join/shared_invite/enQtMjk5MzU0MTQ4ODM2LWUyOThkNjMwZTcwZDY5ZTg5YmY1NWYxOGZhZTk4ZmQyNjQxNTc2NjVmNGFjMzI5MjlhMDllZGI4MzRiZTMwODI"

KEY="terms_of_service.css"

# Expect a key that only appears in alive invitation links.
( curl -L "${EXPIRED_CHAINER}"    | grep -F "${KEY}" ) && exit 1
( curl -L "${EXPIRED_CHAINER_JP}" | grep -F "${KEY}" ) && exit 1
( curl -L "${ALIVE_CHAINER}"      | grep -F "${KEY}" ) || exit 1
( curl -L "${ALIVE_CHAINER_JP}"   | grep -F "${KEY}" ) || exit 1
