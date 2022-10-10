black: ## Black format every python file to line length 100
	find . -type f -name "*.py" | xargs black --line-length=100;
	make clean;

flake8: ## Flake8 every python file
	find . -type f -name "*.py" -a | xargs flake8;

pylint: ## Pylint every python file
	find . -type f -name "*.py" -a | xargs pylint;

build: ## Build package distribution files
	flit build;

publish: ## Publish package distribution files to pypi
	flit publish;
	make clean;

clean: ## Remove package distribution files, caches, and .DS_Store
	rm -rf ./comics.egg-info ./dist ./build;
	find . -type d -name "__pycache__" | xargs rm -r;
	find . -type f -name ".DS_Store" | xargs rm -r;