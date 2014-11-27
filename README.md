code for Polyester paper
==============

Reproduce our updated Polyester paper (available soon on BiorXiv) with the code/data in this repository! 

The document that I reproduced for you is at [this link](http://htmlpreview.github.io/?https://github.com/alyssafrazee/polyester_code/blob/master/polyester_manuscript.html). (That's just a rendered version of `polyester_manuscript.html`, which lives in this repo).

If you'd like to reproduce the document yourself, clone this repository, read the introduction of `polyester_manuscript.Rmd` carefully, download/create all the necessary data files, and then use [knitr](http://yihui.name/knitr/) to create the html output: from within R, with the repository main directory as the working directory, run:

```R
library(knitr)
knit2html('polyester_manuscript.Rmd')
```


