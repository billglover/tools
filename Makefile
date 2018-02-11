.PHONY: dotfiles nvim

dotfiles:
	@for file in $(shell find $(CURDIR)/dotfiles -name ".*" -not -name ".gitignore" -not -name ".git"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done;

nvim:
	@ln -sfn $(CURDIR)/nvim/init.vim $(HOME)/.config/nvim/init.vim
	#@ln -sfn $(CURDIR)/nvim/init.vim $(HOME)/.nvimrc
