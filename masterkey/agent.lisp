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

;; EXAMPLE CODE : 
;;(load "agent.lisp")
;;(defvar fa (make-agent))
;;(funcall fa (list 'init "123"))


(defun make-agent (&optional msgl)
	#'(lambda (msgl)
		(cond ((eq (car msgl) 'init) (print "foo done:")(print (cadr msgl)))
			(T (print "Agent : message not understood : ")(print msgl))))
	)
