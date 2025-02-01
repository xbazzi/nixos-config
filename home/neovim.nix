{ inputs, pkgs, lib, config, ...  }:

{
  programs.neovim ={
       enable = true;
       defaultEditor = true;
       #extraConfig = /home/nixxer/.config/nvim-javi/init.lua;
     # extraConfig = ''
     #   set background=dark
     #   set shiftwidth=4
     #   set showmatch
     #   set ignorecase
     #   set smartcase
     #   set incsearch
     #   set hlsearch
     #   set expandtab
     #   set rnu nu
     #   set tabstop=4
     #   set mouse=a
     #   set laststatus=2
     #   set nobackup
     #   set noswapfile
     #   set undofile
     #   let undodir=stdpath('data') .. '/undodir'
     #   set clipboard=unnamedplus
     # '';
  };
}
