# De facto bash strict mode.
set -efuo pipefail

# Generate nix files from node-packages.json.
node2nix -i node-packages.json -o node-packages.nix -c composition.nix
