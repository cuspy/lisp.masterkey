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

(load "net.lisp")

;;(defvar nn (make-net))
(let ((*input-layer ())
	(*hidden-layer ())
	(*output-layer ()))

(defun generate-neurons-main (in hn on) (make-net 'generate-neurons in hn on))

(setq layers (generate-neurons-main 10 10 10))
(setq *input-layer (car layers))
(setq *hidden-layer (cadr layers))
(setq *output-layer (caddr layers))

)
