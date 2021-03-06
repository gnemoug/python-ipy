.PHONY: tests egg install clean

PYTHON=python

tests:
	@echo "[ run unit tests in python 2 ]"
	PYTHONPATH=$(PWD) $(PYTHON)2 test/test_IPy.py || exit $$?
	@echo "[ run unit tests in python 3 ]"
	PYTHONPATH=$(PWD) $(PYTHON)3 test/test_IPy.py || exit $$?
	@echo
	@echo "[ test README ]"
	$(PYTHON) test_doc.py || exit $$?

egg: clean
	$(PYTHON) setup.py sdist bdist_egg

IPy.html: README
	rst2html README $@ --stylesheet=rest.css

install:
	./setup.py install

clean:
	rm -rf IPy.html *.pyc build dist IPy.egg-info

