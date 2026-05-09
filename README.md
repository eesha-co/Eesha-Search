# Eesha Search

A privacy-respecting, independent metasearch engine powered by [SearXNG](https://github.com/searxng/searxng).

🌐 **Live instance**: [eesha-search.onrender.com](https://eesha-search.onrender.com)

## Features

- 🔍 Aggregates results from 70+ search engines
- 🔒 Privacy-respecting — no tracking, no profiling
- 🖼️ Search categories: General, Images, Videos, News, IT, Science
- 🌙 Dark mode support
- 📱 Mobile-friendly responsive design
- 🔗 JSON API for programmatic access

## API Endpoints

| Endpoint | Description |
|----------|-------------|
| `/search?q=...&format=json` | Search results (JSON) |
| `/search?q=...` | Search results (HTML) |
| `/autocompleter?q=...` | Search suggestions |
| `/opensearch.xml` | OpenSearch description |
| `/healthz` | Health check |

## Deployment

This project is deployed on [Render.com](https://render.com) using Docker.

### Quick Start

1. Fork this repository
2. Create a new Web Service on Render
3. Set the Docker context to the repository root
4. Add environment variables:
   - `SEARXNG_PORT` = `10000`
   - `PORT` = `10000`
   - `SEARXNG_BASE_URL` = your instance URL
   - `SEARXNG_SECRET` = auto-generated secret

## Project Structure

```
├── Dockerfile              # Docker image definition
├── settings.yml            # SearXNG configuration
├── render.yaml             # Render.com deployment blueprint
├── branding/
│   ├── logo.png            # Eesha Search logo
│   ├── templates/          # Jinja2 template overrides
│   │   └── simple/
│   │       ├── base.html       # Footer, meta tags
│   │       ├── index.html      # Homepage
│   │       ├── search.html     # Search results header
│   │       └── opensearch.xml  # Browser search provider
│   └── static/
│       ├── css/
│       │   └── eesha-branding.css  # Brand styling overrides
│       └── img/
│           └── favicon.svg   # SVG favicon
└── shared/
    └── icons/              # Brand icons
```

## License

This project is licensed under the **GNU Affero General Public License v3.0** (AGPLv3).

This is because Eesha Search is based on [SearXNG](https://github.com/searxng/searxng), which is licensed under AGPLv3. The AGPLv3 license requires that the source code be made available to users who interact with the software over a network.

### SearXNG Attribution

Eesha Search uses the SearXNG metasearch engine as its backend. SearXNG is developed by the SearXNG community and is licensed under AGPLv3.

- **SearXNG Source**: https://github.com/searxng/searxng
- **SearXNG License**: AGPL-3.0
