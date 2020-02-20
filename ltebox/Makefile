hss:
	tmux new-session -d -s hss 'cd /opt/hss_sim0609/; sudo ./starthss'
hss-start:
	tmux a -t hss
gui:
	tmux new-session -d -s gui 'cd /opt/ltebox/bin/; ./lteboxGui'
run:
	cd /opt/ltebox/tools/; ./start_ltebox;	
stop:
	cd /opt/ltebox/tools/; ./stop_ltebox;
stop-all:
	cd /opt/ltebox/tools/; ./stop_ltebox; tmux kill-session -t gui; tmux kill-session -t hss

