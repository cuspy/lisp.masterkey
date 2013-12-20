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

;; HACKING : concave and convex functions

(load "fuzzyworddatabase.lisp")

;; x^1.3
(defun make-littlef ()
	#'(lambda (x)
	(/ 1.3 sqrt(x))))
;; x^1.7
(defun make-slightlyf ()
	#'(lambda (x)
	(/ 1.7 sqrt(x))))
;; x^2	
(defun make-veryf ()
	#'(lambda (x)
	(* x x)))
;; x^3
(defun make-extremelyf ()
	#'(lambda (x)
	(* x x x)))
;; x^4	
(defun make-veryveryf ()
	#'(lambda (x)
	(* x x x x)))
;; sqrt x	
(defun make-moreorlessf ()
	#'(lambda (x)
	(sqrt x)))
;; sqrt x
(defun make-somewhatf ()
	#'(lambda (x)
	(sqrt x)))
;; 2[mu(x)]^2 if 0 <= mu <= 0.5
;; 1-2[1-mu(x)]^2 if 0.5 <= mu <= 1
(defun make-indeedf ()
	#'(lambda (x &optional mu)
	(cond ((and (> mu x)(< mu 0.5))
		(* 2 x x))
		((and (> mu 0.5)(< mu 1))
		(- 1 (* 2 (- 1 mu)(- 1 mu)))))))
	

(defvar db (make-word-database))
(funcall db (list 'add-to-dict "little" (make-littlef)))
(funcall db (list 'add-to-dict "sightly" (make-slightlyf)))
(funcall db (list 'add-to-dict "very" (make-veryf)))
(funcall db (list 'add-to-dict "extremely" (make-extremelyf)))
(funcall db (list 'add-to-dict "veryvery" (make-veryveryf)))
(funcall db (list 'add-to-dict "very very" (make-veryveryf)))
(funcall db (list 'add-to-dict "moreorless" (make-moreorlessf)))
(funcall db (list 'add-to-dict "more or less" (make-moreorlessf)))
(funcall db (list 'add-to-dict "somewhat" (make-somewhatf)))
(funcall db (list 'add-to-dict "indeed" (make-indeedf)))
(print (funcall db (list 'get-with-key "very very")))

