cd ~
echo "Assuming config directory is ~/configs/..."

rm -rf .i3
ln -s configs/.i3 		            .i3
ln -s configs/.i3/.i3blocks.conf    .i3/.i3blocks.conf
echo "i3 config linked..."

rm -rf .vim .vimrc
ln -s configs/.vim 		            .vim
ln -s configs/.vimrc 		        .vimrc
echo "vim config linked..."

rm -rf .zsh .zshrc
ln -s configs/.zsh 		            .zsh
ln -s configs/.zshrc 		        .zshrc
echo "zsh config linked..."

rm -rf .tmux.conf
ln -s configs/.tmux.conf 	        .tmux.conf
echo "tmux config linked..."

rm -rf .Xdefaults
ln -s configs/.Xdefaults 	        .Xdefaults
echo "Xdefaults linked..."

rm -rf .dir_colors
ln -s configs/.dir_colors 	        .dir_colors
echo "dir_colors linked..."


echo "done"
