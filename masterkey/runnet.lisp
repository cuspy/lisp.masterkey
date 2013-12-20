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

;;(let ((*input-layer ())
;;	(*hidden-layer ())
;;	(*output-layer ()))

(defun make-run-net ();; &optional il hl ol);;FIXME &optional

  #'(lambda (msg il hl ol)
      (cond ((eq msg 'run)
             (print "Starting net...")
             (mapcar #'(lambda (s)
                         (let ((a (funcall s 'get-activation NIL)))
                           (print a)
                           ))
                     il)
             ;;(list *input-layer *hidden-layer *output-layer)
             )
            ((eq msg 'print!)
             (print "print!>")(print *output-layer))
            (T (print "Net : message not understood")))
      )
  );;)
