.PHONY: dotfiles

dotfiles:
	@for file in $(shell find $(CURDIR)/dotfiles -name ".*" -not -name ".gitignore" -not -name ".git"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done;
