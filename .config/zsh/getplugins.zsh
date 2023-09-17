#!/bin/zsh

command -v git || exit 2;

ZDOTDIR="${HOME}/.config/zsh"
mkdir -pv "${ZDOTDIR}/plugins"

git clone https://github.com/zsh-users/zsh-autosuggestions "${ZDOTDIR}/plugins/autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting "${ZDOTDIR}plugins/syntax-highlighting"
git clone https://github.com/zsh-users/zsh-history-substring-search "${ZDOTDIR}/plugins/history-substring-search"

ln -s "${ZDOTDIR}/plugin/autosuggestions/zsh-autosuggestions.plugin.zsh" "${ZDOTDIR}/plugins/autosuggestions/plugin.zsh"
ln -s "${ZDOTDIR}/plugin/syntax-highlighting/zsh-syntax-highlighting.plugin.zsh" "${ZDOTDIR}/plugins/syntax-highlighting/plugin.zsh"
ln -s "${ZDOTDIR}/plugin/history-substring-search/zsh-history-substring-search.plugin.zsh" "${ZDOTDIR}/plugins/history-substring-search/plugin.zsh"
