#xchg

* **goal:** Convertion OpenMarkov's ProbModelX (pgmx) &harr; XMLBIF (xml)
* **tech:** Two `XSLT` stylesheets are provided to convert in each way:
    * `bif2pgmx.xslt`: XMLBIF &rarr; ProbModelX
    * `pgmx2bif.xslt`: ProbModelX &rarr; XMLBIF
* **requirements:** A `XSLT` processor (_e.g._ [`xsltproc`](http://xmlsoft.org/XSLT/xsltproc2.html) available in `OSX` and most Linux distros)
* **usage:**
    * `xsltproc bif2pgmx.xslt a_network.xml > a_network.pgmx`
    * `xsltproc pgmx2bif.xslt a_network.pgmx > a_network.xml`
* **warnings**:
    * My first experiment with `XSL*`. Bugs are certain;
    * Experimental stuff. Use at your own risk;
* **acknowledgements**:
    * [Gnome](http://www.gnome.org) for `libxslt`;
    * [W3C](http://www.w3.org/Status) for the standards;
    * [Open Source](http://opensource.org) for freedom;
    * [OpenMarkov](http://www.openmarkov.org) for the PGMX format (and related tools);
    * [Fabio Gagliardi Cozman](http://www.cs.cmu.edu/~fgcozman/Research/InterchangeFormat/) for the XMLBIF format;
