;;; Compiled snippets and support files for `js2-jsx-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'js2-jsx-mode
                     '(("" "import React, { Component, PropTypes } from 'react'\n\nexport default ${1: `(buffer-file-name)` } extends Componet {\n  static propTypes = {\n    chiildren: PropTypes.node,\n  }\n\n  render() {\n    const {children} = this.props;\n\n    return (\n      <div>\n        {children}\n      </div>\n    );\n  }\n}\n" "recls" nil nil nil "/home/nonlux/.emacs.d/snippets/js2-jsx-mode/recls" nil nil)))


;;; Do not edit! File generated at Wed Dec 21 09:50:53 2016
