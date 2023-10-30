# Z Shell
My zsh config is not really mine; I use Oh My Zsh.<br>

## Plugins used
- zsh-autosuggestions
- zsh-autocomplete
- fast-syntax-highlighting

### Installation

1. Set up zshrc following instructions on the web!

2. Install **Oh My Zsh** with `curl`, `wget`, or `fetch`:

| Method    | Command                                                                                           |
| :-------- | :------------------------------------------------------------------------------------------------ |
| **curl**  | `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"` |
| **wget**  | `sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`   |
| **fetch** | `sh -c "$(fetch -o - https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"` |

3. Install plugins

- zsh-autosuggestions
`git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions`

- zsh-autocomplete
`git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete`

- fast-syntax-highlighting
`git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting`

4. Place the zshrc file into your $HOME directory, renaming it to .zshrc
`cp zshrc ~/.zshrc`

5. If you want to use my theme, place angelpilled.zsh-theme to `$HOME/.oh-my-zsh/themes/`
`cp angelpilled.zsh-theme $HOME/.oh-my-zsh/themes/`
If it's not changed yet, change the `ZSH_THEME` in `.zshrc` to `angelpilled`!

6. You're done!
If there's any mistake you've noticed, feel free to open a new issue.
