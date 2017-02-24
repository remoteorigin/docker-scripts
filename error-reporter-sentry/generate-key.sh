#!/usr/bin/env bash

{ echo -n "SENTRY_SECRET_KEY=" & docker run --rm sentry config generate-secret-key; } > .env
