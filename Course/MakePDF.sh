#!/bin/bash
# 
# Make .pdf file from .md file using pandoc

md_file='Stat-5101-Cheat-Paper1.md'
pdf_file='Cheat-Paper1.pdf'

pandoc $md_file -s -o $pdf_file -V geometry:margin=1cm 