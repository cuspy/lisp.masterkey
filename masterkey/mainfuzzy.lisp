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


(load "fuzzyset.lisp")

(defvar fset (make-fuzzy-set))

(funcall fset (list 'add-rule-value "low"))


(defvar sys (make-fuzzy-rule-set))
(funcall sys (list 'init))
(funcall sys (list 'add-rule-variables "low" 0.3))

(load "fuzzyparser.lisp")
;;(print(parse-for-typeX (concatenate 'string "12345678 90210 321 " (string #\newline)) 0 ()))
(print(parse-for "12345678 90210 321 " ));;(list " ")))


(load "fuzzyworddatabaseutil.lisp")
