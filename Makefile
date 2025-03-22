install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

lint:
	pylint --disable=R,C *.py devopslib


test:
	python -m pytest -vv --cov=devopslib

format:
	black *.py devopslib/*.py

post-install:
	python -m textblob.download_corpora

deploy:
	aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 258266855446.dkr.ecr.ap-south-1.amazonaws.com
	docker build -t devops-noah-gift .
	docker tag devops-noah-gift:latest 258266855446.dkr.ecr.ap-south-1.amazonaws.com/devops-noah-gift:latest
	docker push 258266855446.dkr.ecr.ap-south-1.amazonaws.com/devops-noah-gift:latest

all: install post-install lint test format deploy