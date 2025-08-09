{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:

{
  programs.vim = {
    enable = true;
    extraConfig = ''
      set background=dark
      set shiftwidth=4
      set showmatch
      set ignorecase
      set smartcase
      set incsearch
      set hlsearch
      set expandtab
      set rnu nu
      syntax on
      set tabstop=4
      set mouse=a
      set laststatus=2
      set nobackup
      set noswapfile
      set undofile
      set undodir=~/.vim/undodir
    '';
  };
}
