;; Copyright (C) c64bubble 2011

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 2 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;; concave and convex functions

(load "dictionary.lisp")

(defun make-word-database (&optional )
  (let ((*dict (make-dictionary)))
    #'(lambda (msgl)
        (cond ((eq (car msgl) 'add-to-dict)
               (funcall *dict (list 'add-pair (cadr msgl) (caddr msgl))))
              ((eq (car msgl) 'get-with-key)
               (funcall *dict (list 'get-with-key (cadr msgl))))
              (T (print "Word-Database : message not understood : ")(print msgl))))
    ))
