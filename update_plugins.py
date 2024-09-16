import re
import shutil
import tempfile
import urllib.request
import zipfile
from io import BytesIO
from os import path

# --- Globals ----------------------------------------------
PLUGINS = """
ack.vim https://github.com/mileszs/ack.vim
ale https://github.com/dense-analysis/ale
auto-pairs https://github.com/jiangmiao/auto-pairs
bufexplorer.zip https://github.com/vim-scripts/bufexplorer.zip
conflict-marker.vim https://github.com/rhysd/conflict-marker.vim
copilot.vim https://github.com/github/copilot.vim
ctrlp.vim https://github.com/ctrlpvim/ctrlp.vim
editorconfig-vim https://github.com/editorconfig/editorconfig-vim
emmet-vim https://github.com/mattn/emmet-vim
gist-vim https://github.com/mattn/gist-vim
goyo.vim https://github.com/junegunn/goyo.vim
indentpython.vim https://github.com/vim-scripts/indentpython.vim
lightline.vim https://github.com/itchyny/lightline.vim
lightline-ale https://github.com/maximbaz/lightline-ale
markdown-preview.nvim https://github.com/iamcco/markdown-preview.nvim
nerdcommenter https://github.com/scrooloose/nerdcommenter
nerdtree https://github.com/preservim/nerdtree
nerdtree-git-plugin https://github.com/Xuyuanp/nerdtree-git-plugin
open_file_under_cursor.vim https://github.com/amix/open_file_under_cursor.vim
pathogen.vim https://github.com/tpope/vim-pathogen
PIV https://github.com/spf13/PIV
snipmate.vim https://github.com/garbas/vim-snipmate
tabular https://github.com/godlygeek/tabular
tagbar https://github.com/preservim/tagbar
undotree https://github.com/mbbill/undotree
vim-addon-mw-utils https://github.com/MarcWeber/vim-addon-mw-utils
vim-airline https://github.com/vim-airline/vim-airline
vim-coloresque https://github.com/gko/vim-coloresque
vim-commentary https://github.com/tpope/vim-commentary
vim-css3-syntax https://github.com/hail2u/vim-css3-syntax
vim-cursorword https://github.com/itchyny/vim-cursorword
vim-expand-region https://github.com/terryma/vim-expand-region
vim-FIGlet https://github.com/fadein/vim-FIGlet
vim-fugitive https://github.com/tpope/vim-fugitive
vim-gitignore https://github.com/gisphm/vim-gitignore
vim-indent-guides https://github.com/preservim/vim-indent-guides
vim-indent-object https://github.com/michaeljsmith/vim-indent-object
vim-javascript https://github.com/pangloss/vim-javascript
vim-json https://github.com/elzr/vim-json
# vim-multiple-cursors https://github.com/terryma/vim-multiple-cursors
vim-visual-multi https://github.com/mg979/vim-visual-multi
vim-signature https://github.com/kshenoy/vim-signature
vim-signify https://github.com/mhinz/vim-signify
vim-surround https://github.com/tpope/vim-surround
vim-table-mode https://github.com/dhruvasagar/vim-table-mode
vim-textobj-user https://github.com/kana/vim-textobj-user
vim-yankstack https://github.com/maxbrunsfeld/vim-yankstack
vim-zenroom2 https://github.com/amix/vim-zenroom2
vimwiki https://github.com/vimwiki/vimwiki
wildfire.vim https://github.com/gcmt/wildfire.vim
YouCompleteMe https://github.com/Valloric/YouCompleteMe

# bufexplorer https://github.com/jlanzarotta/bufexplorer
# mayansmoke https://github.com/vim-scripts/mayansmoke
# nginx.vim https://github.com/chr4/nginx.vim
# tlib https://github.com/tomtom/tlib_vim
# vim-bundle-mako https://github.com/sophacles/vim-bundle-mako
# vim-coffee-script https://github.com/kchmck/vim-coffee-script
# vim-colors-solarized https://github.com/altercation/vim-colors-solarized
# vim-less https://github.com/groenewege/vim-less
# vim-pyte https://github.com/therubymug/vim-pyte
# vim-snipmate https://github.com/garbas/vim-snipmate
# vim-snippets https://github.com/honza/vim-snippets
# vim-surround https://github.com/tpope/vim-surround
# vim-expand-region https://github.com/terryma/vim-expand-region
# vim-rhubarb https://github.com/tpope/vim-rhubarb
# vim-repeat https://github.com/tpope/vim-repeat
# vim-gitgutter https://github.com/airblade/vim-gitgutter
# gruvbox https://github.com/morhetz/gruvbox
# vim-flake8 https://github.com/nvie/vim-flake8
# vim-pug https://github.com/digitaltoad/vim-pug
# vim-abolish https://github.com/tpope/vim-abolish
# rust.vim https://github.com/rust-lang/rust.vim
# vim-markdown https://github.com/plasticboy/vim-markdown
# vim-gist https://github.com/mattn/vim-gist
# vim-ruby https://github.com/vim-ruby/vim-ruby
# typescript-vim https://github.com/leafgarland/typescript-vim
# vim-python-pep8-indent https://github.com/Vimjas/vim-python-pep8-indent
# mru.vim https://github.com/vim-scripts/mru.vim
# dracula https://github.com/dracula/vim
""".strip()

GITHUB_ZIP = "%s/archive/master.zip"

SOURCE_DIR = path.join(path.dirname(__file__), "sources_non_forked")


def download_extract_replace(plugin_name, zip_path, temp_dir, source_dir):
    # Download and extract file in temp dir
    with urllib.request.urlopen(zip_path) as req:
        zip_f = zipfile.ZipFile(BytesIO(req.read()))
        zip_f.extractall(temp_dir)
        content_disp = req.headers.get("Content-Disposition")

    filename = re.findall("filename=(.+).zip", content_disp)[0]
    plugin_temp_path = path.join(temp_dir, path.join(temp_dir, filename))

    # Remove the current plugin and replace it with the extracted
    plugin_dest_path = path.join(source_dir, plugin_name)

    try:
        shutil.rmtree(plugin_dest_path)
    except OSError:
        pass

    shutil.move(plugin_temp_path, plugin_dest_path)
    print("Updated {0}".format(plugin_name))


def update(plugin):
    name, github_url = plugin.split(" ")
    zip_path = GITHUB_ZIP % github_url
    try:
        download_extract_replace(name, zip_path, temp_directory, SOURCE_DIR)
    except Exception as exp:
        print("Could not update {}. Error was: {}".format(name, str(exp)))


if __name__ == "__main__":
    temp_directory = tempfile.mkdtemp()

    try:
        [update(x) for x in PLUGINS.splitlines()]
    finally:
        shutil.rmtree(temp_directory)