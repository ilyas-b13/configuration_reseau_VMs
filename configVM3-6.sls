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

ip route delete default:
  cmd:
    - run

## Configuration de VM3-6
eth1:
  network.managed:
    - enabled: True
    - type: eth
    - proto: none
    - enable_ipv4: false
    - ipv6proto: static
    - enable_ipv6: true
    - ipv6_autoconf: no
    - ipv6ipaddr: fc00:1234:4::36
    - ipv6netmask: 64

eth2:
  network.managed:
    - enabled: True
    - type: eth
    - proto: none
    - enable_ipv4: false
    - ipv6proto: auto
    - enable_ipv6: true
    - ipv6_autoconf: yes

routes:
  network.routes:
    - name: eth2
    - routes:
      - name: LAN1-6
        ipaddr: fc00:1234:1::/64
        gateway: fc00:1234:2::26

      - name: LAN3-6
        ipaddr: fc00:1234:3::/64


