# Configuration eth1
# RAPPEL: eth0 est Ã  vagrant, ne pas y toucher

## DÃ©sactivation de network-manager
NetworkManager:
  service:
    - dead
    - enable: False

net.ipv6.conf.all.disable_ipv6:
  sysctl:
    - present
    - value : 0

net.ipv4.ip_forward:
  sysctl:
    - present
    - value: 1

net.ipv6.conf.all.forwarding:
  sysctl:
    - present
    - value : 1
    
## Suppression de la passerelle par dÃ©faut
ip route del default:
  cmd:
    - run

## Configuration de VM1
eth1:
  network.managed:
    - enabled: True
    - type: eth
    - proto: static
    - ipaddr: 172.16.2.131
    - netmask: 28

eth2:
  network.managed:
    - enabled: True
    - type: eth
    - proto: none
    - enable_ipv4: false
    - ipv6proto: static
    - enable_ipv6: true
    - ipv6_autoconf: no
    - ipv6ipaddr: fc00:1234:3::1
    - ipv6netmask: 64

## Configuration de la route vers LAN2 via VM2
routes:
  network.routes:
    - name: eth1
    - routes:
      - name: LAN2
        ipaddr: 172.16.2.160/28
        gateway: 172.16.2.132

    - name: eth2
    - routes:
      - name: LAN1-6
        ipaddr: fc00:1234:1::/64
        gateway: fc00:1234:3::16

      - name : LAN2-6
        ipaddr: fc00:1234:2::/64
        gateway: fc00:1234:1::26

      - name : LAN4-6
        ipaddr: fc00:1234:4::/64


