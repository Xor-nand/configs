dir="$(pwd)"
mkdir backup

function moveout {

	mv ~/.config/i3/i3blocks.conf ~/.config/i3/i3blocks.conf.old
	cp $dir/i3/config ~/.config/i3/config
	mv ~/.config/i3/config ~/.config/i3/config.old
	cp $dir/i3/i3blocks.conf ~/.config/i3/i3blocks.conf

	mv ~/.config/termite/config ~/.config/termite/config.old
	cp $dir/termite/config ~/.config/termite/config

}
function movein {

	echo " > i3 to git-i3"
	mv $dir/i3/config $dir/backup/i3_config.old
	cp ~/.config/i3/config $dir/i3/
	echo " > i3blocks to git-i3blocks"
	mv $dir/i3/i3blocks.conf $dir/backup/i3blocks.conf.old
	cp ~/.config/i3/i3blocks.conf $dir/i3/
	echo " > termite to git-termite"
	mv $dir/termite/config $dir/backup/termite_config.old
	cp ~/.config/termite/config $dir/termite/
}

echo "Options :"
echo " (1) : move configs from github to home"
echo " (2) : move configs from home to update github directory"
read -p ' > ' c
case $c in
	"1")
	echo ' moving files ';moveout
	;;

	"2")
	echo ' moving files ';movein
	;;

	*)
	echo ' error: invalid answer ';exit 1
	;;
esac
echo bye
exit 0
