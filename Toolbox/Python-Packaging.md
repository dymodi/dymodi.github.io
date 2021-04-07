---
layout: post
title: Python Packaging
date: August 28, 2018
author: Yi DING
---



## Local Test

Install: `pip install .`



## Python Packaging

Official and detailed guide can be found [here](https://python-packaging.readthedocs.io/en/latest/) and [here](https://packaging.python.org/tutorials/packaging-projects/), and a sample can be found [here](https://github.com/pypa/sampleproject).

A simple guide is:

1. Prepare `__init__.py`
2. Prepare `setup.py`
3. Buide distribution: `python setup.py sdist bdist_wheel`
4. Upload to TestPyPI: `twine upload --repository-url https://test.pypi.org/legacy/ dist/*`
5. Upload to PyPI: `twine upload dist/*`



## Update Package

When you modify the code and want to release a new version:

1. Change the version number in `setup.py`
2. Build distribution
3. Upload to TestPyPI
4. Upload to PyPI

Note that only upload the new version in `dist/` but not `dist/*`, otherwise an error will occur with "File already exists" since the old version has been uploaded and TestPyPI and PyPI do **not** permit repeated uploading (even the old version is deleted).