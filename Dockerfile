# Eesha Search — SearXNG Dockerfile for Render.com
# Based on the official SearXNG image with Eesha Search branding overlay
#
# Branding: SearXNG UI is replaced with Eesha Search identity
# - Templates: base.html (footer, meta), index.html (homepage), search.html (results header), opensearch.xml
# - Static: Custom CSS (eesha-branding.css), favicon, logo
# - CSS: Hides engine source labels (Google, DuckDuckGo, etc.)
# - All "SearXNG" references replaced with "Eesha Search"
# - AGPLv3 compliance: Source code link in footer + About page

FROM searxng/searxng:latest

# ─── Copy SearXNG settings ───
COPY settings.yml /etc/searxng/settings.yml

# ─── Apply Eesha Search Branding Overlay ───

# Override templates — replaces SearXNG branding with Eesha Search
COPY branding/templates/simple/base.html /usr/local/searxng/searx/templates/simple/base.html
COPY branding/templates/simple/index.html /usr/local/searxng/searx/templates/simple/index.html
COPY branding/templates/simple/search.html /usr/local/searxng/searx/templates/simple/search.html
COPY branding/templates/simple/opensearch.xml /usr/local/searxng/searx/templates/simple/opensearch.xml

# Copy custom branding CSS (loaded by base.html via url_for('static'))
# Hides: engine source labels, SearXNG URLs, version text
# Styles: Eesha logo text, brand colors, search accent, category tabs
COPY branding/static/css/eesha-branding.css /usr/local/searxng/searx/static/css/eesha-branding.css

# Replace SearXNG logo/favicon with Eesha Search branding
COPY branding/logo.png /usr/local/searxng/searx/static/themes/simple/img/searxng.png
COPY branding/logo.png /usr/local/searxng/searx/static/themes/simple/img/favicon.png
COPY branding/static/img/favicon.svg /usr/local/searxng/searx/static/themes/simple/img/favicon.svg
COPY branding/static/img/favicon.svg /usr/local/searxng/searx/static/themes/simple/img/searxng.svg

# Set the base URL from environment variable (Render provides this)
ENV SEARXNG_BASE_URL=${SEARXNG_BASE_URL}

# Health check on port 10000 (Render's default)
HEALTHCHECK --interval=30s --timeout=5s --start-period=30s --retries=3 \
  CMD wget -q -O /dev/null http://localhost:10000/healthz || exit 1

# SearXNG's entrypoint.sh uses:
#   export GRANIAN_PORT="${SEARXNG_PORT:-$GRANIAN_PORT}"
# Set SEARXNG_PORT=10000 via render.yaml envVars
