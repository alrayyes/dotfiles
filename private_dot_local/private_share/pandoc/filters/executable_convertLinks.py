#!/usr/bin/python 

import re
import panflute as pf

# Convert org mode links to links Gatsby will understand
def action(elem, doc):
    if isinstance(elem, pf.Link):
        matches = list(re.finditer(r"(\.org)", elem.url))
        if matches:
            m = matches[-1]
            elem.url = "/wiki/" + elem.url[: m.start(1)] + elem.url[m.end(1) :]
            return elem


if __name__ == "__main__":
    pf.run_filter(action)
