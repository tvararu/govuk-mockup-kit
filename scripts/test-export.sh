#!/bin/sh

clear && \
cd tmp/journey-10-v12 && \
git reset --hard HEAD && \
cd ../.. && \
rails export 10 tmp/journey-10-v12 && \
cd tmp/journey-10-v12 && \
git add --all . && \
git diff --cached
