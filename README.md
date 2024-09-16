# [![Vim The editor](assets/icons/VimIcon.svg)](https://www.vim.org)

# My Custom Vimrc


## Where to put my vimrc file?
According to vim official recommendation, which you can check through `:help vimrc` in vim.

	Places for your personal initializations:
		Unix		$HOME/.vimrc, $HOME/.vim/vimrc
				or $XDG_CONFIG_HOME/vim/vimrc
		MS-Windows	$HOME/_vimrc, $HOME/vimfiles/vimrc
				or $VIM/_vimrc
		Amiga		s:.vimrc, home:.vimrc, home:vimfiles:vimrc
				or $VIM/.vimrc
		Haiku		$HOME/config/settings/vim/vimrc

	The files are searched in the order specified above and only the first
	one that is found is read.

	RECOMMENDATION: Put all your Vim configuration stuff in the $HOME/.vim/ directory ($HOME/vimfiles/ for MS-Windows). That makes it easy to copy it to another system.


## How to install?
### Install for your own user only
To install it simply do following from your terminal:

	git clone --depth=1 https://github.com/Blunc1999/vimrc.git ~/.vim_runtime
	sh ~/.vim_runtime/install_Linux.sh

### Install for multiple users
To install for multiple users, the repository needs to be cloned to a location accessible for all the intended users.

	git clone --depth=1 https://github.com/Blunc1999/vimrc.git /opt/vim_runtime
	sh /opt/vim_runtime/install_Linux_parameterized.sh /opt/vim_runtime user0 user1 user2
	# to install for all users with home directories, note that root will not be included
	sh /opt/vim_runtime/install_Linux_parameterized.sh /opt/vim_runtime --all
	
Naturally, `/opt/vim_runtime` can be any directory, as long as all the users specified have read access.


## Fonts

I recommend using [IBM Plex Mono font](https://github.com/IBM/plex) (it's an open-source and awesome font that can make your code look beautiful). The Awesome vimrc is already setup to try to use it.

Some other fonts that Awesome will try to use:

* [Hack](http://sourcefoundry.org/hack/)
* [Source Code Pro](https://adobe-fonts.github.io/source-code-pro/)+
* [JetBrainsMono](https://github.com/JetBrains/JetBrainsMono/)


## How to update to latest version?

Just do a git rebase!


    cd ~/.vim_runtime
    git reset --hard
    git clean -d --force
    git pull --rebase
    python update_plugins.py  # use python3 if python is unavailable


## Included Plugins

I recommend reading the docs of these plugins to understand them better. Each plugin provides a much better Vim experience!

* [ack.vim](https://github.com/mileszs/ack.vim): Vim plugin for `the_silver_searcher` (ag) or ack -- a wicked fast grep
* [ale](https://github.com/dense-analysis/ale): A plugin providing linting (syntax checking and semantic errors).
* [auto-pairs](https://github.com/jiangmiao/auto-pairs): Insert or delete brackets, parens, quotes in pair.
* [bufexplorer.zip](https://github.com/vim-scripts/bufexplorer.zip): Quickly and easily switch between buffers. This plugin can be opened with `<leader+o>`
* [conflict-marker.vim](https://github.com/rhysd/conflict-marker.vim): Vim plugin for developers fighting against conflicts.
* [copilot.vim](https://github.com/github/copilot.vim) Plugin for GitHub Copilot (AI autocompletion FTW 😅)
* [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim): Fuzzy file, buffer, mru and tag finder. It's mapped to `<Ctrl+F>`
* [editorconfig-vim](https://github.com/editorconfig/editorconfig-vim) EditorConfig helps maintain consistent coding styles for multiple developers working on the same project across various editors and IDEs
* [emmet-vim](https://github.com/mattn/emmet-vim): A vim plug-in which provides support for expanding abbreviations similar to emmet.
* [gist-vim](https://github.com/mattn/gist-vim) Easily create gists from Vim using the `:Gist` command
* [goyo.vim](https://github.com/junegunn/goyo.vim): Distraction-free writing in Vim.
* [indentpython.vim](https://github.com/vim-scripts/indentpython.vim): This indentation script for python tries to match more closely what is suggested in PEP 8 (http://www.python.org/peps/pep-0008.html).
* [lightline.vim](https://github.com/itchyny/lightline.vim): A light and configurable statusline/tabline for Vim
* [lightline-ale](https://github.com/maximbaz/lightline-ale): This plugin provides ALE indicator for the lightline vim plugin.
* [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim): Preview Markdown in your modern browser with synchronised scrolling and flexible configuration.
* [nerdcommenter](https://github.com/scrooloose/nerdcommenter): Comment functions so powerful—no comment necessary.
* [nerdtree](https://github.com/preservim/nerdtree): The NERDTree is a file system explorer for the Vim editor. Using this plugin, users can visually browse complex directory hierarchies, quickly open files for reading or editing, and perform basic file system operations.
* [nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin): A plugin of NERDTree showing git status flags. 
* [open_file_under_cursor.vim](https://github.com/amix/open_file_under_cursor.vim): Open file under cursor when pressing `gf`
* [pathogen.vim](https://github.com/tpope/vim-pathogen): Manage your vim runtimepath 
* [PIV](https://github.com/spf13/PIV): This project contains the most feature complete and up to date PHP Integration for Vim.
* [snipmate.vim](https://github.com/garbas/vim-snipmate): snipmate.vim aims to be a concise vim script that implements some of TextMate's snippets features in Vim
* [tabular](https://github.com/godlygeek/tabular): This plugin aims to make the easy things easy and the hard things possible, without providing an unnecessarily obtuse interface.
* [tagbar](https://github.com/preservim/tagbar): Tagbar is a Vim plugin that provides an easy way to browse the tags of the current file and get an overview of its structure.
* [undotree](https://github.com/mbbill/undotree): Undotree visualizes the undo history and makes it easy to browse and switch between different undo branches.
* [vim-addon-mw-utils](https://github.com/MarcWeber/vim-addon-mw-utils)
* [vim-airline](https://github.com/vim-airline/vim-airline): Lean & mean status/tabline for vim that's light as air.
* [vim-coloresque](https://github.com/gko/vim-coloresque): color preview for vim.
* [vim-commentary](https://github.com/tpope/vim-commentary): Comment stuff out.  Use `gcc` to comment out a line (takes a count), `gc` to comment out the target of a motion. `gcu` uncomments a set of adjacent commented lines
* [vim-css3-syntax](https://github.com/hail2u/vim-css3-syntax)
* [vim-cursorword](https://github.com/itchyny/vim-cursorword): Underlines the word under the cursor.
* [vim-expand-region](https://github.com/terryma/vim-expand-region): Allows you to visually select increasingly larger regions of text using the same key combination
* [vim-FIGlet](https://github.com/fadein/vim-FIGlet)
* [vim-fugitive](https://github.com/tpope/vim-fugitive): A Git wrapper so awesome, it should be illegal.
* [vim-gitignore](https://github.com/gisphm/vim-gitignore): This plugin provides syntax highlighting and up-to-date code snippets for .gitignore file.
* [vim-indent-guides](https://github.com/preservim/vim-indent-guides): Indent Guides is a plugin for visually displaying indent levels in Vim.
* [vim-indent-object](https://github.com/michaeljsmith/vim-indent-object): Defines a new text object representing lines of code at the same indent level. Useful for python/vim scripts
* [vim-json](https://github.com/elzr/vim-json): Distinct highlighting of keywords vs values, JSON-specific (non-JS) warnings, quote concealing.
* ~~[vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors): Sublime Text style multiple selections for Vim, CTRL+N is remapped to CTRL+S (due to YankRing)~~ This plugin is **deprecated**, use [vim-visual-multi](https://github.com/mg979/vim-visual-multi) instead.
* [vim-visual-multi](https://github.com/mg979/vim-visual-multi)
* [vim-signature](https://github.com/kshenoy/vim-signature): vim-signature is a plugin to place, toggle and display marks.
* [vim-signify](https://github.com/mhinz/vim-signify)
* [vim-surround](https://github.com/tpope/vim-surround)
* [vim-table-mode](https://github.com/dhruvasagar/vim-table-mode): An awesome automatic table creator & formatter allowing one to create neat tables as you type.
* [vim-textobj-user](https://github.com/kana/vim-textobj-user): A Vim plugin to create your own text objects without pain. It is hard to create text objects, because there are many pitfalls to deal with.
* [vim-yankstack](https://github.com/maxbrunsfeld/vim-yankstack): Maintains a history of previous yanks, changes and deletes
* [vim-zenroom2](https://github.com/amix/vim-zenroom2) Remove all clutter and focus only on the essential. Similar to iA Writer or Write Room
* [vimwiki](https://github.com/vimwiki/vimwiki): VimWiki is a personal wiki for Vim -- a number of linked text files that have their own syntax highlighting.
* [wildfire.vim](https://github.com/gcmt/wildfire.vim): With Wildfire you can quickly select the closest text object among a group of candidates.
* [YouCompleteMe](https://github.com/Valloric/YouCompleteMe): A code-completion engine for Vim.


## Included color schemes

Type `:colorscheme <Tab>` to try out color schemes on the fly,
or add the command to `~/.vim_runtime/my_configs.vim` (see [below](#how-to-include-your-own-stuff)),
for example `colorscheme pyte`.

* [vim-snazzy](https://github.com/connorholyday/vim-snazzy)
* [peaksea](https://github.com/vim-scripts/peaksea): The default
* [dracula](https://github.com/dracula/vim)
* [vim-colors-solarized](https://github.com/altercation/vim-colors-solarized)
* [vim-irblack](https://github.com/wgibbs/vim-irblack)
* [mayansmoke](https://github.com/vim-scripts/mayansmoke)
* [vim-pyte](https://github.com/therubymug/vim-pyte)


## Included modes

* [vim-coffee-script](https://github.com/kchmck/vim-coffee-script)
* [vim-less](https://github.com/groenewege/vim-less)
* [vim-bundle-mako](https://github.com/sophacles/vim-bundle-mako)
* [vim-markdown](https://github.com/plasticboy/vim-markdown)
* [nginx.vim](https://github.com/vim-scripts/nginx.vim): Highlights configuration files for nginx
* [rust.vim](https://github.com/rust-lang/rust.vim)
* [vim-ruby](https://github.com/vim-ruby/vim-ruby)
* [typescript-vim](https://github.com/leafgarland/typescript-vim)
* [vim-javascript](https://github.com/pangloss/vim-javascript)
* [vim-python-pep8-indent](https://github.com/Vimjas/vim-python-pep8-indent)


## How to uninstall

* Remove `~/.vim_runtime`
* Remove any lines that reference `.vim_runtime` in your `~/.vimrc`