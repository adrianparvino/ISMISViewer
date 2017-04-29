#!/bin/bash

# Build the client
stack build --stack-yaml=ISMISViewerFrontend/stack.yaml

# Copy over the javascript
rm -f ISMISViewer/static/all.js
cp $(stack path --stack-yaml=ISMISViewerFrontend/stack.yaml --local-install-root)/bin/ISMISViewerFrontend.jsexe/all.js ISMISViewer/static/all.js

# Build the server
stack build --stack-yaml=ISMISViewer/stack.yaml
