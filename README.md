
# ClamAV Mirror [![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE) [![Lifecycle:Stable](https://img.shields.io/badge/Lifecycle-Stable-97ca00)](https://github.com/bcgov/repomountie/blob/master/doc/lifecycle-badges.md)

[![Docker](https://github.com/bcgov/clamav-mirror/actions/workflows/on-push.yaml/badge.svg)](https://github.com/bcgov/clamav-mirror/actions/workflows/docker-image.yaml)

![Image of ClamAV](https://www.clamav.net/assets/clamav-trademark.png)

A lightweight containerized ClamAV Mirror using [CVD-Update](https://github.com/Cisco-Talos/cvdupdate) and [Caddy](https://github.com/caddyserver/caddy).

Run this container to host the ClamAV Database definitions, and leverage a cronjob to periodically update the definitions from upstream.

## Directory Structure

    .github/                   - PR and Issue templates
    docker/                    - Docker Root
    ├── src/                   - Docker source files
    └── Dockerfile             - Main Dockerfile
    openshift/                 - OpenShift deployment template files
    CODE-OF-CONDUCT.md         - Code of Conduct
    COMPLIANCE.yaml            - BCGov PIA/STRA compliance status
    CONTRIBUTING.md            - Contributing Guidelines
    LICENSE                    - License

## Documentation

* [Docker Readme](docker/README.md)
* [Openshift Readme](openshift/README.md)

## Getting Help or Reporting an Issue

To report bugs/issues/features requests, please file an [issue](https://github.com/bcgov/clamav-mirror/issues).

## How to Contribute

If you would like to contribute, please see our [contributing](CONTRIBUTING.md) guidelines.

Please note that this project is released with a [Contributor Code of Conduct](CODE-OF-CONDUCT.md). By participating in this project you agree to abide by its terms.

## License

    Copyright 2020 Province of British Columbia

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
