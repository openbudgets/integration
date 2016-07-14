#!/usr/bin/env bash
# Everything that is in A will be added to B:
# A => B
STAGING_DATA=/srv2/obeu/integration/volumes/tripleStoreStaging/data/
PRODUCTION_DATA=/srv2/obeu/integration/volumes/tripleStoreProduction/data/
sudo rsync -az $STAGING_DATA $PRODUCTION_DATA
sudo rsync --dry-run -az $STAGING_DATA $PRODUCTION_DATA