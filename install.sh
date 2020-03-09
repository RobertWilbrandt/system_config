#!/bin/sh

if [ ! -d "$HOME/.oh-my-zsh" ] ;
then
  RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  rm -f "$HOME/.zshrc"
fi

# Make sure git directory exists
if [ ! -d "git" ] ;
then
  mkdir git
fi

rm -rf profile_plugins
mkdir -p profile_plugins/.profile_plugins
extra_plugins_file="$(pwd)/profile_plugins/.profile_plugins/extra_plugins.sh"

echo "Updating dependencies..."

cd git

if [ -d "dot_profile" ] ;
then
  cd dot_profile
  git pull
  cd ..
else
  git clone https://github.com/fmauch/dot_profile.git
fi

echo "source $(pwd)/dot_profile/.profile_plugins/ros_helper_functions.sh" >> "$extra_plugins_file"
echo "source $(pwd)/dot_profile/.profile_plugins/git_batch_functions.sh" >> "$extra_plugins_file"

cd ..

echo "Stowing configuration..."

stow_dirs="shell vim profile_plugins"

for dir in "$stow_dirs" ; do
  stow $dir
done

# Install/update vim plugins
vim -c "PlugUpdate" -c "PlugInstall" -c "q" -c "q"

echo "Done"
