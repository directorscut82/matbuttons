### matbuttons ![gifaki](https://cloud.githubusercontent.com/assets/8236909/9156386/04045dd4-3ee1-11e5-997c-cabf10500485.gif)

###### matbuttons is a simple matlab script for creating gui elements and especially buttons in arbitary sizes and shapes.

Unfortunately despite the many incarnations of mathworks's ui building (Guide and its children, including some exceptional commits from file-exchange), its functionality leaves something to be desired. A prominent exclusion -at least to me, is the absence of circle buttons*.

*Geps_summer_treat* is a small demo script that serves as a guide for creating buttons with practically no creative limitations at the price of exposing some java functionality by undocumented methods and reqires a little bit of photoshop/gimp skills. 

See **manual.pdf** for a quick overview and run Geps_summer_treat.m for inspecting the different flavors (tristates, toggles, embedded, etc.). Callback's functions are implemented nested only for demostration purposes, mainly for viewing code snippets without much scrolling. 

*we now have the [App Designer](http://www.mathworks.com/matlabcentral/fileexchange/48142-app-designer) with more stylish designs by Tim Smith (but in my totally humble opinion they are exemplars of not-so-nice skeuomorphic design)

---

###### References

* Kudos to mister Altman from [undocumentedMatlab](http://undocumentedmatlab.com) as most of the ideas presented (if not everything) are based on his fanstastic posts and books.
* findjobj.m is also his contribution for finding java objects contained within a specified Matlab GUI handle from [fileexchange](http://www.mathworks.com/matlabcentral/fileexchange/14317-findjobj-find-java-handles-of-matlab-graphic-objects)
* Original button icons and extracted images are included on folders 'psds' and 'extracted', respectively. Icon psds were found floating freely on the internets.

*As always everything is highly experimental and is offered as-is*
