POETRY=poetry
POETRY_RUN=$(POETRY) run

SOURCE_FILES=$(shell find . -name '*.py' -not -path **/.venv/*)
SOURCES_FOLDER=gym_voltorb_flip

BRANCH := $(shell git rev-parse --abbrev-ref HEAD)
HASH := $(shell git rev-parse HEAD)
TAG := $(shell git tag -l --contains HEAD)

format:
	$(POETRY_RUN) isort -rc $(SOURCES_FOLDER)
	$(POETRY_RUN) black $(SOURCE_FILES)

lint:
	$(POETRY_RUN) bandit -r $(SOURCES_FOLDER)
	$(POETRY_RUN) isort -rc $(SOURCES_FOLDER) --check-only
	$(POETRY_RUN) black $(SOURCE_FILES) --check
	$(POETRY_RUN) pylint $(SOURCES_FOLDER)