dotfile_path="$(cd "$(dirname "$0")" && pwd -P)"

# create zshrc.d and sync up
mkdir -P "${HOME}/zshrc.d"

rsync                                   \
  --recursive                           \
  --progress                            \
  --delete-after                        \
  "${dotfile_path}/zshrc.d/"            \
  "${HOME}/zshrc.d"

# sync .zshrc
backup_suffix=".$(date +"%Y%m%d_%H%M").bkup"

rsync                                       \
  --progress                                \
  --backup                                  \
  --suffix="$backup_suffix"                 \
  "${dotfile_path}/.zshrc"                  \
  "${HOME}/.zshrc"

# restart zsh
echo ""
echo "====================================="
echo "(:3｣∠)_ Time to restart you shell..."
# TODO: need to find a more robust way to restart the shell

