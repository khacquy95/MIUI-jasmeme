export CURRENTUSER=$(whoami)
SCRIPTDIR=$(readlink -f "$0")
CURRENTDIR=$(dirname "$SCRIPTDIR")
PORTZIP=$(readlink -f "$1")
STOCKTAR=$(readlink -f "$2")
SOURCEROM=$(readlink -f "$3")

git -C $CURRENTDIR submodule update --init --recursive
if [[ -z $STOCKTAR ]] || [[ -z $PORTZIP ]] || [[ -z $SOURCEROM ]]
then
echo "usage: 
port.sh https://mgb1.androidfilehost.com/dl/8INLuawyPmSC3k7v2r1OvQ/1609817464/17248734326145706204/xiaomi.eu_multi_HMNote7_20.12.28_v12-10.zip? https://bigota.d.miui.com/V11.0.19.0.QDIMIXM/jasmine_global_images_V11.0.19.0.QDIMIXM_20201218.0000.00_10.0_9d37383b8a.tgz ~/aicp" && exit
fi
if [ $CURRENTUSER == root ]
then
echo "do not run as root" && exit
fi
sudo su -c "$CURRENTDIR/main.sh $PORTZIP $STOCKTAR $SOURCEROM $CURRENTUSER"
