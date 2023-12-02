
#!/bin/bash
busybox devmem 0x0c303018 w 0xc458
busybox devmem 0x0c303010 w 0xc400
busybox devmem 0x0c303008 w 0xc458
busybox devmem 0x0c303000 w 0xc400
# 挂载CAN 内核
modprobe can
modprobe can_raw
modprobe mttcan
# 打开canbus 
ip link set can0 up type can bitrate 1000000