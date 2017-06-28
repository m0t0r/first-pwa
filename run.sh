#!/bin/bash
PATH=$PATH:$(npm bin)
set -x

# Production build
ng build --prod

# Generate a SW manifest from out app
node_modules/.bin/ngu-sw-manifest --module src/app/app-routing.module.ts \
                                  --out dist/ngsw-manifest.json

# Copy prebuilt worker into our site
cp node_modules/@angular/service-worker/bundles/worker-basic.min.js dist/

# Serve
cd dist
lite-server
