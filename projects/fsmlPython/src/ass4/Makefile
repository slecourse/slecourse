run:
	cd ../ass2; make build;
	python -B PositiveTests.py ${depth}
	python -B NegativeTests.py ${depth}

clean:
	@rm -rf CorrectFSMGenerator.pyc
	@rm -rf CorrectDataGenerator.pyc
	@rm -rf CorrectInputGenerator.pyc
	@rm -rf FalseFSMGenerator.pyc
	@rm -rf FalseDataGenerator.pyc
	@rm -rf FalseInputGenerator.pyc
	@rm -rf SyntaxGenerator.pyc
