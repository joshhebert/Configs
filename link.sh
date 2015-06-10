cd ~
echo "Assuming config directory is ~/configs/..."

rm -r .i3
ln -s configs/.i3 		            .i3
rm -r .i3blocks.conf
ln -s configs/.i3/.i3blocks.conf    .i3blocks.conf
echo "i3 config linked..."

rm -r .vim .vimrc
ln -s configs/.vim 		            .vim
ln -s configs/.vimrc 		        .vimrc
echo "vim config linked..."

rm -r .zsh .zshrc
ln -s configs/.zsh 		            .zsh
ln -s configs/.zshrc 		        .zshrc
echo "zsh config linked..."

rm -r .tmux.conf
ln -s configs/.tmux.conf 	        .tmux.conf
echo "tmux config linked..."

rm -r .Xdefaults
ln -s configs/.Xdefaults 	        .Xdefaults
echo "Xdefaults linked..."

rm -r .dir_colors
ln -s configs/.dir_colors 	        .dir_colors
echo "dir_colors linked..."

rm -r .scm_breeze
ln -s configs/scm_breeze            .scm_breeze
echo "scm_breeze linked..."

echo "done"