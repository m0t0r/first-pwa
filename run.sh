#!/bin/bash
PATH=$PATH:$(npm bin)
set -x

# Production build
ng build --prod

# Generate a new index.html with an app shell
node_modules/.bin/ngu-app-shell --module src/app/app.module.ts \
                                --insert-module src/app/loading/loading.module.ts \
                                --url /loading \
                                --out dist/index.html

# Generate a SW manifest from out app
node_modules/.bin/ngu-sw-manifest --module src/app/app-routing.module.ts \
                                  --out dist/ngsw-manifest.json

# Copy prebuilt worker into our site
cp node_modules/@angular/service-worker/bundles/worker-basic.min.js dist/

# Serve
cd dist
lite-server
