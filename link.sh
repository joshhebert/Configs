cd ~
echo "Assuming config directory is ~/configs/..."

rm -r .i3
ln -s configs/.i3 		    .i3
echo "i3 config linked..."

rm -r .vim .vimrc
ln -s configs/.vim 		    .vim
ln -s configs/.vimrc 		.vimrc
echo "vim config linked..."

rm -r .zsh .zshrc
ln -s configs/.zsh 		    .zsh
ln -s configs/.zshrc 		.zshrc
echo "zsh config linked..."

rm -r .tmux.conf
ln -s configs/.tmux.conf 	.tmux.conf
echo "tmux config linked..."

rm -r .Xdefaults
ln -s configs/.Xdefaults 	.Xdefaults
echo "Xdefaults linked..."

echo "done"
