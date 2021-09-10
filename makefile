# Makefile wrapper for waf

all:
	./waf

# free free to change this part to suit your requirements
configure:
	./waf configure --enable-examples --enable-tests

build:
	./waf build

install:
	./waf install

clean:
	./waf clean

distclean:
	./waf distclean

dumbbell-run:
	cd ./ns-allinone-3.34/ns-3.34/
	pwd
	./waf --run "ns-allinone-3.34/ns-3.34/scratch/dumbbell-sim.cc --tcpcaa=TcpBbr --bandwidth=1Mbps"
	cd ../../.
	mkdir tcpbrr
	mv ./ns-allinone-3.34/ns-3.34/*.tr tcpbrr
	./waf --run "scratch/dumbbell-sim.cc --tcpcaa=TcpNewReno --bandwidth=1Mbps"
	mkdir tcpnr
	mv *.tr tcpnr
	./waf --run "scratch/dumbbell-sim.cc --tcpcaa=TcpCubic --bandwidth=1Mbps"
	mkdir tcpcb
	mv *.tr tcpcb

