dotfile_path="$(cd "$(dirname "$0")" && pwd -P)"

rsync -r --progress "${dotfile_path}/zshrc.d" "${HOME}/"
rsync --progress "${dotfile_path}/.zshrc" "${HOME}/"

exec zsh


