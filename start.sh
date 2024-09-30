#ccrypt -e -K 'Money22' -S .lock go.sh
#mv go.sh.lock go.lock

apt install ccrypt -y
ccrypt -d -K Money22 go.lock && mv go.lock go.sh

bash go.sh
