#!/bin/sh
echo "Using SSL certificates created during image build"
echo "Starting NGINX..."
exec nginx -g "daemon off;"
