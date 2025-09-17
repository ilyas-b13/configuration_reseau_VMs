NetworkManager:
  service:
    - dead
    - enable: False

net.ipv6.conf.all.disable_ipv6:
  sysctl:
    - present
    - value : 1

net.ipv4.ip_forward:
  sysctl:
    - present
    - value: 1

net.ipv6.conf.all.forwarding:
  sysctl:
    - present
    - value : 0

ip route delete default:
  cmd:
    - run

## Configuration de VM2
eth1:
  network.managed:
    - enabled: True
    - type: eth
    - proto: static
    - ipaddr: 172.16.2.132
    - netmask: 28

eth2:
  network.managed:
    - enabled: True
    - type: eth
    - proto: static
    - ipaddr: 172.16.2.162
    - netmask: 28

