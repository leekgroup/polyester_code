code for Polyester paper
==============

Reproduce our updated Polyester paper (available [on BiorXiv](http://biorxiv.org/content/early/2014/12/12/006015)) with the code/data in this repository! 

The document that I reproduced for you is at [this link](http://htmlpreview.github.io/?https://github.com/alyssafrazee/polyester_code/blob/master/polyester_manuscript.html). (That's just a rendered version of `polyester_manuscript.html`, which lives in this repo).

If you'd like to reproduce the document yourself, clone this repository, read the introduction of `polyester_manuscript.Rmd` carefully, download/create all the necessary data files, and then use [knitr](http://yihui.name/knitr/) to create the html output: from within R, with the repository main directory as the working directory, run:

```R
library(knitr)
knit2html('polyester_manuscript.Rmd')
```

The paper also includes three small analyses as supplements. The`.Rmd` files with code in them and corresponding rendered html are in this repository. You can view the supplements at these links:

* `ebseq.Rmd`: [rendered html](http://htmlpreview.github.io/?https://github.com/alyssafrazee/polyester_code/blob/master/ebseq.html)
* `dataDrivenEst.Rmd`: [rendered html](http://htmlpreview.github.io/?https://github.com/alyssafrazee/polyester_code/blob/master/dataDrivenEst.html)
* `length_simulation.Rmd`: [rendered html](http://htmlpreview.github.io/?https://github.com/alyssafrazee/polyester_code/blob/master/length_simulation.html)

