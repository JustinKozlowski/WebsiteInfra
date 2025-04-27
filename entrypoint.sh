#!/bin/bash

# Ensure GOOGLE_GEMINI_API_KEY is set
if [ -z "$GOOGLE_GEMINI_API_KEY" ]; then
  echo "GOOGLE_GEMINI_API_KEY is not set!"
  exit 1
fi

# Substitute the environment variable in the configuration file
sed 's|\${GOOGLE_GEMINI_API_KEY}|'"$GOOGLE_GEMINI_API_KEY"'|g' /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

# Optionally, check the result
cat /etc/nginx/conf.d/default.conf.tmp

# Move the temp file to the original location
# mv /etc/nginx/conf.d/default.conf.tmp /etc/nginx/conf.d/default.conf

# Start NGINX
nginx -g 'daemon off;'