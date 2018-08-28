---
layout: post
title: Python Packaging
date: August 28, 2018
author: Yi DING
---



## Python Packaging

Official and detailed guide can be found [here](https://python-packaging.readthedocs.io/en/latest/) and [here](https://packaging.python.org/tutorials/packaging-projects/).

A simple guide is:

1. Prepare `__init__.py`
2. Prepare `setup.py`
3. Buide distribution: `python setup.py sdist bdist_wheel`
4. Upload to TestPyPI: `twine upload --repository-url https://test.pypi.org/legacy/ dist/*`
5. Upload to PyPI: `twine upload dist/*`

