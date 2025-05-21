# ecpaas-install
This is the files for ECPaaS installation used.

# Debug
Some system will set filter tables Forward Chain as Drop.<br />
make sure change to Forward.

`
sudo nft chain ip filter FORWARD '{ policy accept ; }'
`
<br />or <br />
`
sudo iptables-nft -t filter  -P FORWARD ACCEPT
`
