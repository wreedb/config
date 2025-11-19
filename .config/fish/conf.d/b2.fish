set -l keydir (xdg-user-dir DOCUMENTS)/keys

set -gx B2_APPLICATION_KEY_ID (yq '.keyID' $keydir/b2-application-key.yml)
set -gx B2_APPLICATION_KEY (yq '.applicationKey' $keydir/b2-application-key.yml)
